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
        const string server = "133.242.10.78";
        const int port = 10080;

        public event Action<Tile> OnDraw;
        public event Action<Tile> OnWait;
        public event Action<Player, Tile> OnDiscard;
        public event Action OnLogin;
        public event Action OnClose;
        public event Action<bool> OnGameStart;
        public event Action OnGameEnd;
        public event Action<string> OnUnknownEvent;

        public GameData GameData;
        public bool Connected;

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
            if (Connected)
            {
                if (OnClose != null)
                {
                    OnClose();
                }
                client.Close();
                Connected = false;
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
            Connected = true;
        }

        public void Join(GameType type)
        {
            string typeStr = null;
            switch (type)
            {
                case GameType.East:
                    typeStr = lobby.ToString() + ",1";
                    break;
                case GameType.East_fast:
                    typeStr = lobby.ToString() + ",65";
                    break;
                case GameType.North:
                    typeStr = lobby.ToString() + ",9";
                    break;
                case GameType.North_fast:
                    typeStr = lobby.ToString() + ",73";
                    break;
            }
            client.Send(string.Format("<JOIN t=\"{0}\" />", typeStr));
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
            GameData.hand.tile.Remove(tile);
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

        public void Reach(Tile tile)
        {
            client.Send("<REACH hai=\"" + tile.ToString() + "\" />");
            GameData.player[0].reached = true;
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
                    Close();
                    return;
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
                NextReady();
            }
            else if (reader.Name == "AGARI" || reader.Name == "RYUUKYOKU")
            {
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
                string logID = reader["log"];
                SaveTenhouLog(logID);
                GameData = new GameData();
                if (OnGameStart != null)
                {
                    OnGameStart(false);
                }
            }
            else if (reader.Name == "SAIKAI")
            {
                GameData = new GameData();
                if (OnGameStart != null)
                {
                    OnGameStart(true);
                }
            }
            else if (reader.Name == "INIT")
            {
                HandleInit(reader["seed"], reader["ten"], reader["oya"], reader["hai"]);
                if (OnUnknownEvent != null)
                {
                    OnUnknownEvent(str);
                }
            }
            else if ((match = new Regex(@"T(\d+)").Match(reader.Name)).Success)
            {
                Tile tile = new Tile(int.Parse(match.Groups[1].Value));
                GameData.hand.tile.Add(tile);
                GameData.lastTile = tile;
                if (OnDraw != null)
                {
                    OnDraw(tile);
                }
            }
            else if ((match = new Regex(@"([DEFGdefg])(\d+)").Match(reader.Name)).Success)
            {
                Player player = GameData.player[match.Groups[1].Value.ToLower()[0] - 'd'];
                Tile tile = new Tile(int.Parse(match.Groups[2].Value));
                player.graveyard.tile.Add(tile);
                GameData.lastTile = tile;
                if (OnDiscard != null)
                {
                    OnDiscard(player, tile);
                }
                if (reader["t"] != null)
                {
                    if (OnWait != null)
                    {
                        OnWait(tile);
                    }
                }
            }
            else if (reader.Name == "DORA")
            {
                Tile tile = new Tile(int.Parse(reader["hai"]));
                GameData.dora.tile.Add(tile);
            }
            else if (reader.Name == "N")
            {
                Player player = GameData.player[int.Parse(reader["who"])];

                int type;
                int[] hai = new int[4];
                decodeM(int.Parse(reader["m"]), out type, out hai[0], out hai[1], out hai[2], out hai[3]);

                List<Tile> tiles = new List<Tile>();
                foreach (int num in hai)
                {
                    if (num != -1)
                    {
                        tiles.Add(new Tile(num));
                    }
                }

                player.fuuro.tile.Add(tiles);
                GameData.lastTile.IsTakenAway = true;

                if (OnUnknownEvent != null)
                {
                    OnUnknownEvent(str);
                }
            }
            else if (reader.Name == "REACH")
            {
                Player player = GameData.player[int.Parse(reader["who"])];
                player.reached = true;
                if (OnUnknownEvent != null)
                {
                    OnUnknownEvent(str);
                }
            }
        }

        private void HandleInit(string seed, string ten, string oya, string hai)
        {
            GameData.dora.tile.Clear();
            int dora = int.Parse(new Regex(@"(\d+)$").Match(seed).Groups[1].Value);
            GameData.dora.tile.Add(new Tile(dora));

            MatchCollection pointCollection = new Regex(@"\d+").Matches(ten);
            for (int i = 0; i < 4; i++)
            {
                GameData.player[i].point = int.Parse(pointCollection[i].Value);
                GameData.player[i].reached = false;
                GameData.player[i].graveyard = new Graveyard();
                GameData.player[i].fuuro = new Fuuro();
            }

            int oyaNum = int.Parse(oya);
            GameData.player[oyaNum].position = "E";
            GameData.player[(oyaNum + 1) % 4].position = "S";
            GameData.player[(oyaNum + 2) % 4].position = "W";
            GameData.player[(oyaNum + 3) % 4].position = "N";

            GameData.hand.tile.Clear();
            MatchCollection haiCollection = new Regex(@"\d+").Matches(hai);
            foreach (Match haiMatch in haiCollection)
            {
                GameData.hand.tile.Add(new Tile(int.Parse(haiMatch.Value)));
            }
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

        private void SaveTenhouLog(string logID)
        {
            StreamWriter writer = new StreamWriter("TenhouLog.txt", true);
            writer.WriteLine("http://tenhou.net/0/?log=" + logID);
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

        public void decodeM(int m, out int type, out int hai0, out int hai1, out int hai2, out int hai3)
        {
            hai0 = hai1 = hai2 = hai3 = -1;
            var kui = m & 3;
            int __reg0;
	        if ((m & 1 << 2) != 0) 
	        {
		        var __reg3 = (m & 64512) >> 10;
		        var __reg4 = __reg3 % 3;
		        __reg3 = __reg3 / 3;
		        __reg3 = __reg3 / 7 * 9 + __reg3 % 7;
		        __reg3 = __reg3 * 4;
		        var __reg5 = new List<int> {__reg3 + 4 * 0 + ((m & 24) >> 3), __reg3 + 4 * 1 + ((m & 96) >> 5), __reg3 + 4 * 2 + ((m & 384) >> 7)};
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
		        hai0 = (hai0 & 3 ^ -1) + 3;
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
