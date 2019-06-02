using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;
using System.IO;
using System.Threading;
using System.Diagnostics;
using System.Net;

using Newtonsoft.Json.Linq;
using WebSocketSharp;

using MahjongAI.Models;

namespace MahjongAI
{
    class MajsoulClient : PlatformClient
    {
        private const string serverListUrl = "/recommend_list?service=ws-gateway&protocol=ws&ssl=true";
        private const string gameServerListUrlTemplate = "/recommend_list?service=ws-game-gateway&protocol=ws&ssl=true&location={0}";
        private const string replaysFileName = "replays.txt";

        private WebSocket ws;
        private WebSocket wsGame;
        private string username;
        private string password;
        private MajsoulHelper majsoulHelper = new MajsoulHelper();
        private byte[] buffer = new byte[1048576];
        private IEnumerable<JToken> operationList;
        private bool nextReach = false;
        private bool gameEnded = false;
        private Tile lastDiscardedTile;
        private int accountId = 0;
        private int playerSeat = 0;
        private bool continued = false;
        private bool syncing = false;
        private Queue<MajsoulMessage> pendingActions = new Queue<MajsoulMessage>();
        private bool inPrivateRoom = false;
        private bool continuedBetweenGames = false;
        private bool gameStarted = false;
        private Stopwatch stopwatch = new Stopwatch();
        private Random random = new Random();

        public MajsoulClient(Config config) : base(config)
        {
            var host = getServerHost(serverListUrl);
            ws = new WebSocket("wss://" + host, onMessage: OnMessage, onError: OnError);
            ws.Connect().Wait();
            username = config.MajsoulUsername;
            password = config.MajsoulPassword;
        }

        public override void Close(bool unexpected = false)
        {
            lock (ws)
            {
                if (connected)
                {
                    connected = false;
                    if (unexpected)
                    {
                        InvokeOnConnectionException();
                    }
                    InvokeOnClose();
                    try
                    {
                        ws.Close().Wait();
                        wsGame.Close().Wait();
                    } catch { }
                }
            }
        }

        public override void Login()
        {
            Send(ws, ".lq.Lobby.login", new
            {
                currency_platforms = new[] { 2 },
                account = username,
                password = EncodePassword(password),
                reconnect = false,
                device = new { device_type = "pc", browser = "safari" },
                random_key = GetDeviceUUID(),
                client_version = "0.4.149.w",
                gen_access_token = false,
            }).Wait();
            new Task(HeartBeat).Start();
            connected = true;
        }

        public override void Join(GameType type)
        {
            if (!inPrivateRoom)
            {
                int typeNum = 2;

                if (type.HasFlag(GameType.Match_EastSouth))
                {
                    typeNum += 1;
                }

                if (type.HasFlag(GameType.Level_Throne))
                {
                    typeNum += 12;
                }
                else if (type.HasFlag(GameType.Level_Jade))
                {
                    typeNum += 9;
                }
                else if (type.HasFlag(GameType.Level_Gold))
                {
                    typeNum += 6;
                }
                else if (type.HasFlag(GameType.Level_Silver))
                {
                    typeNum += 3;
                }

                Send(ws, ".lq.Lobby.matchGame", new { match_mode = typeNum }).Wait();

                Timer timer = new Timer((state) => {
                    if (!gameStarted)
                    {
                        InvokeOnUnknownEvent("Game matching timed out.");
                        Close(true);
                    }
                }, /* state */ null, /* dueTime */ 60000, /* period */ Timeout.Infinite);
            }
            else
            {
                Send(ws, ".lq.Lobby.readyPlay", new { ready = true }).Wait();
            }
        }

        public override void EnterPrivateRoom(int roomNumber)
        {
            if (roomNumber != 0)
            {
                Send(ws, ".lq.Lobby.joinRoom", new { room_id = roomNumber }).Wait();
                inPrivateRoom = true;
            }
            else
            {
                inPrivateRoom = false;
            }
        }

        public override void NextReady()
        {
            Send(wsGame, ".lq.FastTest.confirmNewRound", new { }).Wait();
        }

        public override void Bye()
        {
            wsGame.Close();
            wsGame = null;
        }

        public override void Pass()
        {
            doRandomDelay();
            Send(wsGame, ".lq.FastTest.inputChiPengGang", new { cancel_operation = true, timeuse = stopwatch.Elapsed.Seconds }).Wait();
        }

        public override void Discard(Tile tile)
        {
            doRandomDelay();
            Send(wsGame, ".lq.FastTest.inputOperation", new { type = nextReach ? 7 : 1, tile = tile.OfficialName, moqie = gameData.lastTile == tile, timeuse = stopwatch.Elapsed.Seconds }).Wait();
            nextReach = false;
            lastDiscardedTile = tile;
        }

        public override void Pon(Tile tile0, Tile tile1)
        {
            doRandomDelay();
            var combination = operationList.First(item => (int)item["type"] == 3)["combination"].Select(t => (string)t);
            int index = combination.ToList().FindIndex(comb => comb.Contains(tile0.GeneralName));
            Send(wsGame, ".lq.FastTest.inputChiPengGang", new { type = 3, index, timeuse = stopwatch.Elapsed.Seconds }).Wait();
        }

        public override void Minkan()
        {
            doRandomDelay();
            Send(wsGame, ".lq.FastTest.inputChiPengGang", new { type = 5, index = 0, timeuse = stopwatch.Elapsed.Seconds }).Wait();
        }

        public override void Chii(Tile tile0, Tile tile1)
        {
            doRandomDelay();
            var combination = operationList.First(item => (int)item["type"] == 2)["combination"].Select(t => (string)t);
            int index = combination.ToList().FindIndex(comb => comb.Split('|').OrderBy(t => t).SequenceEqual(new[] { tile0.OfficialName, tile1.OfficialName }.OrderBy(t => t)));
            Send(wsGame, ".lq.FastTest.inputChiPengGang", new { type = 2, index, timeuse = stopwatch.Elapsed.Seconds }).Wait();
        }

        public override void Ankan(Tile tile)
        {
            doRandomDelay();
            var combination = operationList.First(item => (int)item["type"] == 4)["combination"].Select(t => (string)t);
            int index = combination.ToList().FindIndex(comb => comb.Contains(tile.GeneralName));
            Send(wsGame, ".lq.FastTest.inputChiPengGang", new { type = 4, index, timeuse = stopwatch.Elapsed.Seconds }).Wait();
        }

        public override void Kakan(Tile tile)
        {
            doRandomDelay();
            var combination = operationList.First(item => (int)item["type"] == 6)["combination"].Select(t => (string)t);
            int index = combination.ToList().FindIndex(comb => comb.Contains(tile.GeneralName) || comb.Contains(tile.OfficialName));
            Send(wsGame, ".lq.FastTest.inputChiPengGang", new { type = 6, index, timeuse = stopwatch.Elapsed.Seconds }).Wait();
        }

        public override void Ron()
        {
            Send(wsGame, ".lq.FastTest.inputChiPengGang", new { type = 9, index = 0 }).Wait();
        }

        public override void Tsumo()
        {
            Send(wsGame, ".lq.FastTest.inputChiPengGang", new { type = 8, index = 0 }).Wait();
        }

        public override void Ryuukyoku()
        {
            doRandomDelay();
            Send(wsGame, ".lq.FastTest.inputChiPengGang", new { type = 10, index = 0, timeuse = stopwatch.Elapsed.Seconds }).Wait();
        }

        public override void Nuku()
        {
            throw new NotSupportedException();
        }

        public override void Reach(Tile tile)
        {
            nextReach = true;
            player.reached = true;
        }

        private void DelayedNextReady()
        {
            new Thread(() =>
            {
                Thread.Sleep(5000);
                if (!gameEnded)
                {
                    NextReady();
                }
            }).Start();
        }

        private void StartGame(JToken data, bool continued)
        {
            gameStarted = false;

            Task.Factory.StartNew(() =>
            {
                InvokeOnUnknownEvent("Game found. Connecting...");
                while (!gameStarted)
                {
                    wsGame = new WebSocket("wss://" + getServerHost(string.Format(gameServerListUrlTemplate, data["location"])), onMessage: OnMessage, onError: OnError);
                    wsGame.Connect().Wait();
                    Send(wsGame, ".lq.FastTest.authGame", new
                    {
                        account_id = accountId,
                        token = data["connect_token"],
                        game_uuid = data["game_uuid"]
                    }).Wait();
                    Thread.Sleep(3000);
                    if (!gameStarted)
                    {
                        InvokeOnUnknownEvent("Failed to connect. Retrying...");
                    }
                }
            });

            SaveReplay((string)data["game_uuid"]);
        }

        private int NormalizedPlayerId(int seat)
        {
            return (seat - playerSeat + 4) % 4;
        }

        private void HandleMessage(MajsoulMessage message, bool forSync = false)
        {
            if (syncing && !forSync && message.MethodName != ".lq.FastTest.fetchGamePlayerState")
            {
                pendingActions.Enqueue(message);
                return;
            }

            if (!message.Success && message.MethodName != ".lq.FastTest.authGame")
            {
                return;
            }
            if (message.MethodName == ".lq.Lobby.login" || message.MethodName == ".lq.Lobby.oauth2Login")
            {
                accountId = (int)message.Json["account_id"];

                if (message.Json["error"] != null && message.Json["error"]["code"] != null)
                {
                    InvokeOnLogin(resume: false, succeeded: false);
                }
                else if (message.Json["game_info"] != null)
                {
                    continued = true;
                    InvokeOnLogin(resume: true, succeeded: true);
                    StartGame(message.Json["game_info"], true);
                } else
                {
                    InvokeOnLogin(resume: false, succeeded: true);
                }
            }
            if (message.MethodName == ".lq.NotifyRoomGameStart" || message.MethodName == ".lq.NotifyMatchGameStart")
            {
                StartGame(message.Json, false);
            }
            else if (message.MethodName == ".lq.FastTest.authGame")
            {
                gameStarted = true;
                InvokeOnGameStart(continued);

                if (!continued)
                {
                    Send(wsGame, ".lq.FastTest.enterGame", new { }).Wait();
                }
                else
                {
                    Send(wsGame, ".lq.FastTest.syncGame", new { round_id = "-1", step = 1000000 }).Wait();
                    continued = false;
                }
            }
            else if (message.MethodName == ".lq.NotifyPlayerLoadGameReady")
            {
                playerSeat = message.Json["ready_id_list"].Select(t => (int)t).ToList().IndexOf(accountId);
            }
            else if (message.MethodName == "ActionMJStart")
            {
                gameEnded = false;
            }
            else if (message.MethodName == ".lq.NotifyGameEndResult")
            {
                Bye();
                gameEnded = true;
                InvokeOnGameEnd();
            }
            else if (message.MethodName == "ActionHule")
            {
                int[] points = message.Json["scores"].Select(t => (int)t).ToArray();
                int[] rawPointDeltas = message.Json["delta_scores"].Select(t => (int)t).ToArray();
                int[] pointDeltas = new int[4];

                for (var i = 0; i < 4; i++)
                {
                    gameData.players[NormalizedPlayerId(i)].point = points[i];
                    pointDeltas[NormalizedPlayerId(i)] = rawPointDeltas[i];
                }

                foreach (var agari in message.Json["hules"])
                {
                    Player who = gameData.players[NormalizedPlayerId((int)agari["seat"])];
                    Player fromWho = pointDeltas.Count(s => s < 0) == 1 ? gameData.players[Array.FindIndex(pointDeltas, s => s < 0)] : who;
                    int point = !(bool)agari["zimo"] ? (int)agari["point_rong"] : (bool)agari["qinjia"] ? (int)agari["point_zimo_xian"] * 3 : (int)agari["point_zimo_xian"] * 2 + (int)agari["point_zimo_qin"];
                    if (gameData.lastTile != null)
                    {
                        gameData.lastTile.IsTakenAway = true;
                    }
                    if ((bool)agari["yiman"])
                    {
                        SaveReplayTag("Yakuman");
                    }
                    InvokeOnAgari(who, fromWho, point, pointDeltas, gameData.players);
                }

                DelayedNextReady();
            }
            else if (message.MethodName == "ActionLiuJu")
            {
                InvokeOnAgari(null, null, 0, new[] { 0, 0, 0, 0 }, gameData.players);
                DelayedNextReady();
            }
            else if (message.MethodName == "ActionNoTile")
            {
                var scoreObj = message.Json["scores"][0];
                int[] rawPointDeltas = scoreObj["delta_scores"] != null ? scoreObj["delta_scores"].Select(t => (int)t).ToArray() : new[] { 0, 0, 0, 0 };
                int[] pointDeltas = new int[4];
                for (var i = 0; i < 4; i++)
                {
                    gameData.players[NormalizedPlayerId(i)].point = (int)scoreObj["old_scores"][i] + rawPointDeltas[i];
                    pointDeltas[NormalizedPlayerId(i)] = rawPointDeltas[i];
                }
                InvokeOnAgari(null, null, 0, pointDeltas, gameData.players);
                DelayedNextReady();
            }
            else if (message.MethodName == "ActionNewRound")
            {
                Tile.Reset();
                gameData = new GameData();
                HandleInit(message.Json);

                if (!syncing)
                {
                    InvokeOnInit(/* continued */ false, gameData.direction, gameData.seq, gameData.seq2, gameData.players);
                }
                
                if (player.hand.Count > 13)
                {
                    operationList = message.Json["operation"]["operation_list"];
                    if (!syncing)
                    {
                        Thread.Sleep(2000); // 等待发牌动画结束
                        stopwatch.Restart();
                        InvokeOnDraw(player.hand.Last());
                    }
                }
            }
            else if (message.MethodName == ".lq.FastTest.syncGame")
            {
                syncing = true;
                continuedBetweenGames = (int)message.Json["step"] == 0;
                Send(wsGame, ".lq.FastTest.fetchGamePlayerState", new { }).Wait();

                if (message.Json["game_restore"]["actions"] != null)
                {
                    foreach (var action in message.Json["game_restore"]["actions"])
                    {
                        var bytes = Convert.FromBase64String((string)action["data"]);
                        var actionMessage = majsoulHelper.decodeActionPrototype((string)action["name"], bytes);
                        pendingActions.Enqueue(actionMessage);
                    }
                }
            }
            else if (message.MethodName == ".lq.FastTest.fetchGamePlayerState")
            {
                bool inited = false;
                playerSeat = message.Json["state_list"].ToList().IndexOf("SYNCING") - 2;

                while (pendingActions.Count > 1)
                {
                    var actionMessage = pendingActions.Dequeue();
                    if (actionMessage.MethodName == "ActionNewRound")
                    {
                        inited = true;
                    }
                    HandleMessage(actionMessage, forSync: true);
                }

                Send(wsGame, ".lq.FastTest.finishSyncGame", new { }).Wait();
                syncing = false;

                if (inited)
                {
                    InvokeOnInit(/* continued */ true, gameData.direction, gameData.seq, gameData.seq2, gameData.players);
                }

                // Queue里的最后一个action需要响应
                if (pendingActions.Count > 0)
                {
                    HandleMessage(pendingActions.Dequeue());
                }

                if (continuedBetweenGames)
                {
                    NextReady();
                }
            }
            else if (message.MethodName == "ActionDealTile")
            {
                gameData.remainingTile = (int)message.Json["left_tile_count"];
                if (message.Json["doras"] != null)
                {
                    var doras = message.Json["doras"].Select(t => (string)t);
                    foreach (var dora in doras.Skip(gameData.dora.Count))
                    {
                        gameData.dora.Add(new Tile(dora));
                    }
                }
                if (NormalizedPlayerId((int)message.Json["seat"]) == 0)
                {
                    Tile tile = new Tile((string)message.Json["tile"]);
                    player.hand.Add(tile);
                    gameData.lastTile = tile;
                    operationList = message.Json["operation"]["operation_list"];
                    if (!syncing)
                    {
                        stopwatch.Restart();
                        InvokeOnDraw(tile);
                    }
                }
            }
            else if (message.MethodName == "ActionDiscardTile")
            {
                Player currentPlayer = gameData.players[NormalizedPlayerId((int)message.Json["seat"])];
                if (!(bool)message.Json["moqie"])
                {
                    currentPlayer.safeTiles.Clear();
                }
                var tileName = (string)message.Json["tile"];
                if (currentPlayer == player)
                {
                    if (lastDiscardedTile == null || lastDiscardedTile.OfficialName != tileName)
                    {
                        lastDiscardedTile = player.hand.First(t => t.OfficialName == tileName);
                    }
                    player.hand.Remove(lastDiscardedTile);
                }
                Tile tile = currentPlayer == player ? lastDiscardedTile : new Tile(tileName);
                lastDiscardedTile = null;
                currentPlayer.graveyard.Add(tile);
                gameData.lastTile = tile;
                foreach (var p in gameData.players)
                {
                    p.safeTiles.Add(tile);
                }
                if ((bool)message.Json["is_liqi"] || (bool)message.Json["is_wliqi"])
                {
                    currentPlayer.reached = true;
                    currentPlayer.safeTiles.Clear();
                    if (!syncing) InvokeOnReach(currentPlayer);
                }
                if (!syncing) InvokeOnDiscard(currentPlayer, tile);
                JToken keyValuePairs = message.Json;
                if (keyValuePairs["doras"] != null)
                {
                    var doras = message.Json["doras"].Select(t => (string)t);
                    foreach (var dora in doras.Skip(gameData.dora.Count))
                    {
                        gameData.dora.Add(new Tile(dora));
                    }
                }
                if (keyValuePairs["operation"] != null)
                {
                    operationList = message.Json["operation"]["operation_list"];
                    if (!syncing)
                    {
                        stopwatch.Restart();
                        InvokeOnWait(tile, currentPlayer);
                    }
                }
            }
            else if (message.MethodName == "ActionChiPengGang")
            {
                Player currentPlayer = gameData.players[NormalizedPlayerId((int)message.Json["seat"])];
                var fuuro = HandleFuuro(currentPlayer, (int)message.Json["type"], message.Json["tiles"].Select(t => (string)t), message.Json["froms"].Select(t => (int)t));

                if (!syncing) InvokeOnNaki(currentPlayer, fuuro);
            }
            else if (message.MethodName == "ActionAnGangAddGang")
            {
                Player currentPlayer = gameData.players[NormalizedPlayerId((int)message.Json["seat"])];
                FuuroGroup fuuro = null;
                if ((int)message.Json["type"] == 2)
                {
                    fuuro = HandleKakan(currentPlayer, (string)message.Json["tiles"]);
                }
                else if ((int)message.Json["type"] == 3)
                {
                    fuuro = HandleAnkan(currentPlayer, (string)message.Json["tiles"]);
                }

                if (!syncing) InvokeOnNaki(currentPlayer, fuuro);
            }
        }

        private void HandleInit(JToken data)
        {
            switch ((int)data["chang"])
            {
                case 0:
                    gameData.direction = Direction.E;
                    break;
                case 1:
                    gameData.direction = Direction.S;
                    break;
                case 2:
                    gameData.direction = Direction.W;
                    break;
            }

            gameData.seq = (int)data["ju"] + 1;
            gameData.seq2 = (int)data["ben"];
            gameData.reachStickCount = (int)data["liqibang"];

            gameData.remainingTile = GameData.initialRemainingTile;

            gameData.dora.Clear();
            gameData.dora.Add(new Tile((string)data["dora"]));

            for (int i = 0; i < 4; i++)
            {
                gameData.players[NormalizedPlayerId(i)].point = (int)data["scores"][i];
                gameData.players[NormalizedPlayerId(i)].reached = false;
                gameData.players[NormalizedPlayerId(i)].graveyard = new Graveyard();
                gameData.players[NormalizedPlayerId(i)].fuuro = new Fuuro();
                gameData.players[NormalizedPlayerId(i)].hand = new Hand();
            }

            int oyaNum = (4 - playerSeat + (int)data["ju"]) % 4;
            gameData.players[oyaNum].direction = Direction.E;
            gameData.players[(oyaNum + 1) % 4].direction = Direction.S;
            gameData.players[(oyaNum + 2) % 4].direction = Direction.W;
            gameData.players[(oyaNum + 3) % 4].direction = Direction.N;

            foreach (var tileName in data["tiles"].Select(t => (string)t))
            {
                player.hand.Add(new Tile(tileName));
            }
        }

        private FuuroGroup HandleFuuro(Player currentPlayer, int type, IEnumerable<string> tiles, IEnumerable<int> froms)
        {
            FuuroGroup fuuroGroup = new FuuroGroup();
            switch (type)
            {
                case 0:
                    fuuroGroup.type = FuuroType.chii;
                    break;
                case 1:
                    fuuroGroup.type = FuuroType.pon;
                    break;
                case 2:
                    fuuroGroup.type = FuuroType.minkan;
                    break;
            }

            foreach (var (tileName, from) in tiles.Zip(froms, Tuple.Create))
            {
                if (NormalizedPlayerId(from) != currentPlayer.id) // 从别人那里拿来的牌
                {
                    fuuroGroup.Add(gameData.lastTile);
                    gameData.lastTile.IsTakenAway = true;
                }
                else if (currentPlayer == player) // 自己的手牌
                {
                    Tile tile = player.hand.First(t => t.OfficialName == tileName);
                    player.hand.Remove(tile);
                    fuuroGroup.Add(tile);
                }
                else
                {
                    fuuroGroup.Add(new Tile(tileName));
                }
            }

            currentPlayer.fuuro.Add(fuuroGroup);
            return fuuroGroup;
        }

        private FuuroGroup HandleAnkan(Player currentPlayer, string tileName)
        {
            tileName = tileName.Replace('0', '5');

            FuuroGroup fuuroGroup = new FuuroGroup();
            fuuroGroup.type = FuuroType.ankan;

            if (currentPlayer == player)
            {
                IEnumerable<Tile> tiles = player.hand.Where(t => t.GeneralName == tileName).ToList();
                fuuroGroup.AddRange(tiles);
                player.hand.RemoveRange(tiles);
            }
            else
            {
                if (tileName[0] == '5' && tileName[1] != 'z') // 暗杠中有红牌
                {
                    fuuroGroup.Add(new Tile(tileName));
                    fuuroGroup.Add(new Tile(tileName));
                    fuuroGroup.Add(new Tile(tileName));
                    fuuroGroup.Add(new Tile("0" + tileName[1]));
                }
                else
                {
                    for (var i = 0; i < 4; i++)
                    {
                        fuuroGroup.Add(new Tile(tileName));
                    }
                }
            }

            currentPlayer.fuuro.Add(fuuroGroup);
            return fuuroGroup;
        }

        private FuuroGroup HandleKakan(Player currentPlayer, string tileName)
        {
            FuuroGroup fuuroGroup = currentPlayer.fuuro.First(g => g.type == FuuroType.pon && g.All(t => t.GeneralName == tileName.Replace('0', '5')));
            fuuroGroup.type = FuuroType.kakan;

            if (currentPlayer == player)
            {
                Tile tile = player.hand.First(t => t.GeneralName == tileName.Replace('0', '5'));
                player.hand.Remove(tile);
                fuuroGroup.Add(tile);
            }
            else
            {
                fuuroGroup.Add(new Tile(tileName));
            }

            return fuuroGroup;
        }

        private void HeartBeat()
        {
            while (true)
            {
                Thread.Sleep(60000);
                try
                {
                    Send(ws, ".lq.Lobby.heatbeat", new { no_operation_counter = 0 }).Wait();
                }
                catch (Exception)
                {
                    Close(true);
                    return;
                }
            }
        }

        private void SaveReplay(string gameID)
        {
            StreamWriter writer = new StreamWriter(replaysFileName, true);
            writer.WriteLine("https://majsoul.union-game.com/0/?paipu={0}", gameID);
            writer.Close();
        }

        private void SaveReplayTag(string tag)
        {
            StreamWriter writer = new StreamWriter(replaysFileName, true);
            writer.WriteLine("tag: {0}", tag);
            writer.Close();
        }

        private async Task OnMessage(MessageEventArgs args)
        {
            try
            {
                int length = await args.Data.ReadAsync(buffer, 0, buffer.Length);
                MajsoulMessage message = majsoulHelper.decode(buffer, 0, length);
                HandleMessage(message);
            } catch (Exception ex)
            {
                Trace.TraceError(ex.ToString());
                Close(true);
            }
        }

        private Task OnError(WebSocketSharp.ErrorEventArgs args)
        {
            return Task.Factory.StartNew(() => Close(true));
        }

        private static string EncodePassword(string password)
        {
            using (HMACSHA256 hmac = new HMACSHA256(Encoding.UTF8.GetBytes("lailai")))
            {
                return BitConverter.ToString(hmac.ComputeHash(Encoding.UTF8.GetBytes(password))).Replace("-", "").ToLower();
            }
        }

        public async Task Send(WebSocket ws, string methodName, object data)
        {
            byte[] buffer = majsoulHelper.encode(new MajsoulMessage
            {
                Type = MajsoulMessageType.REQUEST,
                MethodName = methodName,
                Data = data,
            });
            try
            {
                await ws.Send(buffer);
            }
            catch (Exception ex)
            {
                Trace.TraceError(ex.ToString());
                Close(true);
            }
        }

        private string GetDeviceUUID()
        {
            string uuid = (string)Properties.Settings.Default["DeviceUUID"];
            if (string.IsNullOrEmpty(uuid))
            {
                uuid = Guid.NewGuid().ToString();
                Properties.Settings.Default["DeviceUUID"] = uuid;
                Properties.Settings.Default.Save();
            }
            return uuid;
        }

        private string getServerHost(string serverListUrl)
        {
            var webClient = new WebClient();
            var serverListJson = webClient.DownloadString(Constants.MAJSOUL_API_URL_PRIFIX[config.MajsoulRegion] + serverListUrl);
            var serverList = JObject.Parse(serverListJson)["servers"];
            return (string)serverList[0];
        }

        private void doRandomDelay()
        {
            if (stopwatch.Elapsed < TimeSpan.FromSeconds(2))
            {
                Thread.Sleep(random.Next(1, 4) * 1000);
            }
        }
    }
}
