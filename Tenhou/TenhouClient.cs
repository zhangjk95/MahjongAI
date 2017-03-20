using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;
using System.Threading;
using System.IO;
using System.Xml;
using Tenhou.Models;

namespace Tenhou
{
    class TenhouClient
    {
        private const string server = "133.242.10.78";
        private const int port = 10080;

        public event Action<Tile> OnDraw;
        public event Action<Tile, Player> OnWait;
        public event Action<Player, Tile> OnDiscard;
        public event Action OnLogin;
        public event Action OnClose;
        public event Action OnConnectionException;
        public event Action<bool> OnGameStart;
        public event Action OnGameEnd;
        public event Action<Player, FuuroGroup> OnNaki;
        public event Action<Player> OnReach;
        public event Action<string> OnUnknownEvent;

        public GameData gameData;
        public bool connected;

        public Player player
        {
            get
            {
                return gameData.player;
            }
        }

        private SocketClient client = new SocketClient(server, port);
        private string username;
        private int lobby;

        public TenhouClient(string username)
        {
            this.username = username;
            this.lobby = 0;
        }

        ~TenhouClient()
        {
            Close();
        }

        public void Close()
        {
            if (connected)
            {
                connected = false;
                if (OnClose != null)
                {
                    OnClose();
                }
                client.Close();
            }
        }

        public void Login()
        {
            client.Send(string.Format("<HELO name=\"{0}\" tid=\"f0\" sx=\"M\" />", username));
            string authStr = client.Receive();
            if (authStr.StartsWith("<HELO "))
            {
                string authRes = getAuthRes(authStr);
                client.Send(authRes);
                if (OnLogin != null)
                {
                    OnLogin();
                }
            }
            else
            {
                HandleXML(authStr);
            }

            new Task(StartRecv).Start();
            new Task(HeartBeat).Start();
            connected = true;
        }

        public void Join(GameType type)
        {
            client.Send(string.Format("<JOIN t=\"{0},{1}\" />", lobby, (int)type));
        }

        public void EnterLobby(int lobby)
        {
            client.Send(string.Format("<CHAT text=\"%2Flobby%20{0}\" />", lobby));
            this.lobby = lobby;
        }

        public void NextReady() 
        {
            client.Send("<NEXTREADY />");
        }

        public void Bye()
        {
            client.Send("<BYE />");
        }

        public void Pass()
        {
            client.Send("<N />");
        }

        public void Discard(Tile tile)
        {
            client.Send(string.Format("<D p=\"{0}\" />", tile));
            player.hand.Remove(tile);
        }

        public void Pon(Tile tile0, Tile tile1)
        {
            client.Send(string.Format("<N type=\"1\" hai0=\"{0}\" hai1=\"{1}\" />", tile0, tile1));
        }

        public void Minkan()
        {
            client.Send("<N type=\"2\" />");
        }

        public void Chii(Tile tile0, Tile tile1)
        {
            client.Send(string.Format("<N type=\"3\" hai0=\"{0}\" hai1=\"{1}\" />", tile0, tile1));
        }

        public void Ankan(Tile tile)
        {
            client.Send(string.Format("<N type=\"4\" hai=\"{0}\" />", tile.Id / 4 * 4 + 2));
        }

        public void Kakan(Tile tile)
        {
            client.Send(string.Format("<N type=\"5\" hai=\"{0}\" />", tile));
        }

        public void Ron()
        {
            client.Send("<N type=\"6\" />");
        }

        public void Tsumo()
        {
            client.Send("<N type=\"7\" />");
        }

        public void Ryuukyoku()
        {
            client.Send("<N type=\"9\" />");
        }

        public void Nuku()
        {
            client.Send("<N type=\"10\" />");
        }

        public void Reach(Tile tile)
        {
            client.Send("<REACH hai=\"" + tile.ToString() + "\" />");
            player.reached = true;
        }

        public void StartSend() {
            while (true)
            {
                string str = Console.ReadLine();
                try
                {
                    client.Send(str);
                }
                catch (Exception ex)
                {
                    Close();
                    return;
                }
            }
        }

        private void StartRecv() {
            while (true) {
                string str;
                try
                {
                    str = client.Receive();
                }
                catch (Exception ex)
                {
                    if (connected)
                    {
                        if (OnConnectionException != null)
                        {
                            OnConnectionException();
                        }
                        Close();
                    }
                    break;
                }
                foreach (string substr in str.Split('\0'))
                {
                    HandleXML(substr);
                }
            }
        }

        private void HandleXML(string str)
        {
            var readerSettings = new XmlReaderSettings { ConformanceLevel = ConformanceLevel.Fragment };
            var reader = XmlReader.Create(new StringReader(str), readerSettings);
            reader.Read();
            if (reader.NodeType != XmlNodeType.Element)
            {
                return;
            }

            Match match;
            if (reader.Name == "REJOIN")
            {
                client.Send(str.Replace("REJOIN", "JOIN"));
            }
            else if (reader.Name == "GO")
            {
                client.Send("<GOK />");
            }
            else if (reader.Name == "AGARI" || reader.Name == "RYUUKYOKU")
            {
                if (reader.Name == "AGARI")
                {
                    if (gameData.lastTile != null)
                    {
                        gameData.lastTile.IsTakenAway = true;
                    }
                }
                if (OnUnknownEvent != null)
                {
                    OnUnknownEvent(str);
                }
                if (reader["owari"] != null)
                {
                    Bye();
                    if (OnGameEnd != null)
                    {
                        OnGameEnd();
                    }
                }
                else
                {
                    NextReady();
                }
            }
            else if (reader.Name == "TAIKYOKU")
            {
                NextReady();
                string logID = reader["log"];
                int oya = int.Parse(reader["oya"]);
                SaveTenhouLog(logID, oya == 0 ? 0 : 4 - oya);
                if (OnGameStart != null)
                {
                    OnGameStart(false);
                }
            }
            else if (reader.Name == "SAIKAI")
            {
                if (OnGameStart != null)
                {
                    OnGameStart(true);
                }
            }
            else if (reader.Name == "INIT" || reader.Name == "REINIT")
            {
                gameData = new GameData();
                HandleInit(reader["seed"], reader["ten"], reader["oya"], reader["hai"]);
                HandleReinit(reader["m0"], reader["m1"], reader["m2"], reader["m3"], reader["kawa0"], reader["kawa1"], reader["kawa2"], reader["kawa3"]);
                if (OnUnknownEvent != null)
                {
                    OnUnknownEvent(str);
                }
            }
            else if ((match = new Regex(@"T(\d+)").Match(reader.Name)).Success)
            {
                Tile tile = new Tile(int.Parse(match.Groups[1].Value));
                player.hand.Add(tile);
                gameData.lastTile = tile;
                if (OnDraw != null)
                {
                    OnDraw(tile);
                }
            }
            else if ((match = new Regex(@"([DEFGdefg])(\d+)").Match(reader.Name)).Success)
            {
                var tag = match.Groups[1].Value;
                Player currentPlayer = gameData.players[tag.ToLower()[0] - 'd'];
                if (tag == tag.ToUpper()) // 大写表示手切
                {
                    currentPlayer.safeTiles.Clear();
                }
                Tile tile = new Tile(int.Parse(match.Groups[2].Value));
                currentPlayer.graveyard.Add(tile);
                gameData.lastTile = tile;
                gameData.remainingTile--;
                foreach (var p in gameData.players)
                {
                    p.safeTiles.Add(tile);
                }
                if (OnDiscard != null)
                {
                    OnDiscard(currentPlayer, tile);
                }
                if (reader["t"] != null)
                {
                    if (OnWait != null)
                    {
                        OnWait(tile, currentPlayer);
                    }
                }
            }
            else if (reader.Name == "DORA")
            {
                Tile tile = new Tile(int.Parse(reader["hai"]));
                gameData.dora.Add(tile);
            }
            else if (reader.Name == "N")
            {
                Player currentPlayer = gameData.players[int.Parse(reader["who"])];
                var fuuro = HandleFuuro(currentPlayer, int.Parse(reader["m"]));

                if (OnNaki != null)
                {
                    OnNaki(currentPlayer, fuuro);
                }
            }
            else if (reader.Name == "REACH")
            {
                Player currentPlayer = gameData.players[int.Parse(reader["who"])];
                currentPlayer.reached = true;
                currentPlayer.safeTiles.Clear();
                if (OnReach != null)
                {
                    OnReach(currentPlayer);
                }
            }
        }

        private void HandleInit(string seed, string ten, string oya, string hai)
        {
            switch (int.Parse(new Regex(@"^(\d+)").Match(seed).Groups[1].Value))
            {
                case 0: case 1: case 2: case 3:
                    gameData.direction = Direction.E;
                    break;
                case 4: case 5: case 6: case 7:
                    gameData.direction = Direction.S;
                    break;
                case 8: case 9: case 10: case 11:
                    gameData.direction = Direction.W;
                    break;
            }

            gameData.remainingTile = GameData.initialRemainingTile;

            gameData.dora.Clear();
            int dora = int.Parse(new Regex(@"(\d+)$").Match(seed).Groups[1].Value);
            gameData.dora.Add(new Tile(dora));

            MatchCollection pointCollection = new Regex(@"\d+").Matches(ten);
            for (int i = 0; i < 4; i++)
            {
                gameData.players[i].point = int.Parse(pointCollection[i].Value);
                gameData.players[i].reached = false;
                gameData.players[i].graveyard = new Graveyard();
                gameData.players[i].fuuro = new Fuuro();
                gameData.players[i].hand = new Hand();
            }

            int oyaNum = int.Parse(oya);
            gameData.players[oyaNum].direction = Direction.E;
            gameData.players[(oyaNum + 1) % 4].direction = Direction.S;
            gameData.players[(oyaNum + 2) % 4].direction = Direction.W;
            gameData.players[(oyaNum + 3) % 4].direction = Direction.N;

            MatchCollection haiCollection = new Regex(@"\d+").Matches(hai);
            foreach (Match haiMatch in haiCollection)
            {
                player.hand.Add(new Tile(int.Parse(haiMatch.Value)));
            }
        }

        private void HandleReinit(string m0, string m1, string m2, string m3, string kawa0, string kawa1, string kawa2, string kawa3)
        {
            var ms = new List<Tuple<int, string>>()
            {
                Tuple.Create(0, m0),
                Tuple.Create(1, m1),
                Tuple.Create(2, m2),
                Tuple.Create(3, m3)
            };

            foreach (var tuple in ms)
            {
                if (string.IsNullOrEmpty(tuple.Item2))
                {
                    continue;
                }

                var currentPlayer = gameData.players[tuple.Item1];

                foreach (var m in tuple.Item2.Split(','))
                {
                    HandleFuuro(currentPlayer, int.Parse(m));
                }
            }

            var kawas = new List<Tuple<int, string>>()
            {
                Tuple.Create(0, kawa0),
                Tuple.Create(1, kawa1),
                Tuple.Create(2, kawa2),
                Tuple.Create(3, kawa3)
            };

            foreach (var tuple in kawas)
            {
                if (string.IsNullOrEmpty(tuple.Item2))
                {
                    continue;
                }

                var currentPlayer = gameData.players[tuple.Item1];

                foreach (var str in tuple.Item2.Split(','))
                {
                    var discarded = int.Parse(str);
                    if (discarded == 255)
                    {
                        currentPlayer.reached = true;
                    }
                    else
                    {
                        currentPlayer.graveyard.Add(new Tile(discarded));
                        gameData.remainingTile--;
                    }
                }
            }
        }

        private FuuroGroup HandleFuuro(Player currentPlayer, int m)
        {
            int type, kui;
            int[] hai = new int[4];
            decodeMeld(m, out type, out kui, out hai[0], out hai[1], out hai[2], out hai[3]);

            FuuroGroup tiles = new FuuroGroup();
            switch (type)
            {
                case 3:
                    tiles.type = FuuroType.chii;
                    break;
                case 1:
                    tiles.type = FuuroType.pon;
                    break;
                case 2:
                    tiles.type = FuuroType.minkan;
                    break;
                case 4:
                    tiles.type = FuuroType.ankan;
                    gameData.remainingTile--;
                    break;
                case 5:
                    tiles.type = FuuroType.kakan;
                    gameData.remainingTile--;
                    break;
            }

            foreach (int num in hai)
            {
                if (num != -1)
                {
                    tiles.Add(new Tile(num));
                    if (gameData.lastTile != null && gameData.lastTile.Id == num)
                    {
                        gameData.lastTile.IsTakenAway = true;
                    }
                }
            }

            if (kui != 0) // 从别人处拿到的牌
            {
                var takenTile = new Tile(hai[3 - kui]);
                takenTile.IsTakenAway = true;
                var fromPlayer = gameData.players[(kui + currentPlayer.id) % 4];
                if (!fromPlayer.graveyard.Exists(t => t.Id == takenTile.Id))
                {
                    fromPlayer.graveyard.Add(takenTile);
                    gameData.remainingTile--;
                }
            }

            currentPlayer.fuuro.Add(tiles);

            // 如果加杠则移除原来的碰
            if (tiles.type == FuuroType.kakan)
            {
                currentPlayer.fuuro.RemoveAll(g => g.type == FuuroType.pon && g.All(t => t.GenaralId == tiles[0].GenaralId));
            }

            if (currentPlayer == player)
            {
                player.hand.RemoveWhere((tile) => tiles.Exists((_tile) => tile.Id == _tile.Id));
            }

            return tiles;
        }

        private void HeartBeat()
        {
            while (true)
            {
                Thread.Sleep(5000);
                try
                {
                    client.Send("<Z />");
                }
                catch (Exception ex)
                {
                    Close();
                    return;
                }                
            }
        }

        private void SaveTenhouLog(string logID, int tw)
        {
            StreamWriter writer = new StreamWriter("TenhouLog.txt", true);
            writer.WriteLine("http://tenhou.net/0/?log={0}&tw={1}", logID, tw);
            writer.Close();
        }

        private string getAuthRes(string authStr) 
        {
            int[] tt2 = new int[] {63006,9570,49216,45888,9822,23121,59830,51114,54831,4189,580,5203,42174,59972,55457,59009,59347,64456,8673,52710,49975,2006,62677,3463,17754,5357};

            Regex regex = new Regex("auth=\"(.*?)\"");
            string auth = regex.Match(authStr).Groups[1].Value;
            string[] tmp = auth.Split('-');

            var _loc4 = int.Parse("2" + tmp[0].Substring(2, 6)) % (13 - int.Parse(tmp[0].Substring(7, 1)) - 1);
            var authval = tmp[0] + "-" + (tt2[_loc4 * 2 + 0] ^ int.Parse(tmp[1].Substring(0, 4), System.Globalization.NumberStyles.HexNumber)).ToString("x4") + (tt2[_loc4 * 2 + 1] ^ int.Parse(tmp[1].Substring(4, 4), System.Globalization.NumberStyles.HexNumber)).ToString("x4");

            return string.Format("<AUTH val=\"{0}\"/>", authval);
        }

        public void decodeMeld(int m, out int type, out int kui, out int hai0, out int hai1, out int hai2, out int hai3)
        {
            hai0 = hai1 = hai2 = hai3 = -1;
            kui = m & 3;
            int __reg0;
	        if ((m & 1 << 2) != 0) 
	        {
		        var __reg3 = (m & 64512) >> 10;
		        var __reg4 = __reg3 % 3;
		        __reg3 = __reg3 / 3;
		        __reg3 = __reg3 / 7 * 9 + __reg3 % 7;
		        __reg3 = __reg3 * 4;
		        var __reg5 = new List<int> {__reg3 + 4 * 0 + ((m & 24) >> 3), __reg3 + 4 * 1 + ((m & 96) >> 5), __reg3 + 4 * 2 + ((m & 384) >> 7)};
                if ((__reg0 = __reg4) == 1)
                {
                    var temp = __reg5[1];
                    __reg5.Remove(temp);
                    __reg5.Insert(0, temp);
                }
                else if (__reg0 == 2)
                {
                    var temp = __reg5[2];
                    __reg5.Remove(temp);
                    __reg5.Insert(0, temp);
                }
                type = 3;
		        hai0 = __reg5[0];
		        hai1 = __reg5[1];
		        hai2 = __reg5[2];
		        return;
	        }
	        if ((m & 1 << 3) != 0)
	        {
		        var __reg6 = (m & 96) >> 5;
		        var __reg7 = (m & 65024) >> 9;
		        var __reg8 = __reg7 % 3;
		        __reg7 = __reg7 / 3;
		        __reg7 = __reg7 * 4;
		        var __reg9 = new List<int> {__reg7, __reg7, __reg7};
		        if ((__reg0 = __reg6) == 0) 
		        {
			        __reg9[0] = __reg9[0] + 1;
			        __reg9[1] = __reg9[1] + 2;
			        __reg9[2] = __reg9[2] + 3;
		        }
		        else if (__reg0 == 1) 
		        {
			        __reg9[0] = __reg9[0] + 0;
			        __reg9[1] = __reg9[1] + 2;
			        __reg9[2] = __reg9[2] + 3;
		        }
		        else if (__reg0 == 2) 
		        {
			        __reg9[0] = __reg9[0] + 0;
			        __reg9[1] = __reg9[1] + 1;
			        __reg9[2] = __reg9[2] + 3;
		        }
		        else if (__reg0 == 3) 
		        {
			        __reg9[0] = __reg9[0] + 0;
			        __reg9[1] = __reg9[1] + 1;
			        __reg9[2] = __reg9[2] + 2;
		        }
                if ((__reg0 = __reg8) == 1)
                {
                    var temp = __reg9[1];
                    __reg9.Remove(temp);
                    __reg9.Insert(0, temp);
                }
                else if (__reg0 == 2)
                {
                    var temp = __reg9[2];
                    __reg9.Remove(temp);
                    __reg9.Insert(0, temp);
                }
                if (kui < 3)
                {
                    var temp = __reg9[2];
                    __reg9.Remove(temp);
                    __reg9.Insert(0, temp);
                }
                if (kui < 2)
                {
                    var temp = __reg9[2];
                    __reg9.Remove(temp);
                    __reg9.Insert(0, temp);
                }
                type = 1;
		        hai0 = __reg9[0];
		        hai1 = __reg9[1];
		        hai2 = __reg9[2];
		        return;
	        }
	        if ((m & 1 << 4) != 0)
	        {
		        var __reg10 = (m & 96) >> 5;
		        var __reg11 = (m & 65024) >> 9;
		        var __reg12 = __reg11 % 3;
		        __reg11 = __reg11 / 3;
		        __reg11 = __reg11 * 4;
		        var __reg13 = new List<int> {__reg11, __reg11, __reg11};
		        if ((__reg0 = __reg10) == 0) 
		        {
			        __reg13[0] = __reg13[0] + 1;
			        __reg13[1] = __reg13[1] + 2;
			        __reg13[2] = __reg13[2] + 3;
		        }
		        else if (__reg0 == 1) 
		        {
			        __reg13[0] = __reg13[0] + 0;
			        __reg13[1] = __reg13[1] + 2;
			        __reg13[2] = __reg13[2] + 3;
		        }
		        else if (__reg0 == 2) 
		        {
			        __reg13[0] = __reg13[0] + 0;
			        __reg13[1] = __reg13[1] + 1;
			        __reg13[2] = __reg13[2] + 3;
		        }
		        else if (__reg0 == 3) 
		        {
			        __reg13[0] = __reg13[0] + 0;
			        __reg13[1] = __reg13[1] + 1;
			        __reg13[2] = __reg13[2] + 2;
		        }
                if ((__reg0 = __reg12) == 1)
                {
                    var temp = __reg13[1];
                    __reg13.Remove(temp);
                    __reg13.Insert(0, temp);
                }
                else if (__reg0 == 2)
                {
                    var temp = __reg13[2];
                    __reg13.Remove(temp);
                    __reg13.Insert(0, temp);
                }
                type = 5;
		        hai0 = __reg11 + __reg10;
		        hai1 = __reg13[0];
		        hai2 = __reg13[1];
		        hai3 = __reg13[2];
		        return;
	        }
	        if ((m & 1 << 5) != 0)
	        {
		        type = 10;
		        hai0 = (m & 65280) >> 8;
		        return;
	        }
	        hai0 = (m & 65280) >> 8;
	        if (kui == 0) 
	        {
		        hai0 = (hai0 & (3 ^ -1)) + 3;
	        }
	        var __reg14 = hai0 / 4 * 4;
	        var __reg15 = new List<int> {__reg14, __reg14, __reg14};
	        if ((__reg0 = hai0 % 4) == 0) 
	        {
		        __reg15[0] = __reg15[0] + 1;
		        __reg15[1] = __reg15[1] + 2;
		        __reg15[2] = __reg15[2] + 3;
	        }
	        else if (__reg0 == 1) 
	        {
		        __reg15[0] = __reg15[0] + 0;
		        __reg15[1] = __reg15[1] + 2;
		        __reg15[2] = __reg15[2] + 3;
	        }
	        else if (__reg0 == 2) 
	        {
		        __reg15[0] = __reg15[0] + 0;
		        __reg15[1] = __reg15[1] + 1;
		        __reg15[2] = __reg15[2] + 3;
	        }
	        else if (__reg0 == 3) 
	        {
		        __reg15[0] = __reg15[0] + 0;
		        __reg15[1] = __reg15[1] + 1;
		        __reg15[2] = __reg15[2] + 2;
	        }
	        type = kui != 0 ? 2 : 4;
	        hai1 = __reg15[0];
	        hai2 = __reg15[1];
	        hai3 = __reg15[2];
	        if (kui == 1) 
	        {
		        __reg14 = hai0;
		        hai0 = hai3;
		        hai3 = __reg14;
	        }
	        if (kui == 2) 
	        {
		        __reg14 = hai0;
		        hai0 = hai1;
		        hai1 = __reg14;
	        }
        }
    }
}
