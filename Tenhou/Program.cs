using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;
using Tenhou.Models;
using System.Diagnostics;
using System.IO;
using System.Configuration;

namespace Tenhou
{
    class Program
    {
        static TenhouClient client;
        static Monitor monitor;
        static AIController controller;
        static AutoResetEvent gameEnd = new AutoResetEvent(false);

        static void Start(Config config)
        {
            client = new TenhouClient(config.Id);

            gameEnd.Reset();

            client.OnLogin += () =>
            {
                client.EnterLobby(config.Lobby);
                client.Join(config.GameType);
            };
            client.OnGameEnd += () => 
            {
                config.Repeat--;
                gameEnd.Set();
            };
            client.OnConnectionException += () => 
            {
                if (config.Id.Length <= 8) // 如果没有天凤账号，无法断线重连
                {
                    config.Repeat--;
                }
                gameEnd.Set();
            };

            monitor = new Monitor(client);
            monitor.Start();

            controller = new AIController(client);
            controller.Start();

            client.Login();
        }

        static void HandleInput(Config config)
        {
            while (true)
            {
                string input = Console.ReadLine();
                switch (input.ToLower())
                {
                    case "q":
                        Console.WriteLine("Quiting...");
                        config.Repeat = 1;
                        break;
                }
            }
        }

        static Config GetConfig()
        {
            var config = new Config();

            config.Id = ConfigurationManager.AppSettings["TenhouID"];

            config.Lobby = int.Parse(ConfigurationManager.AppSettings["Lobby"]);

            config.GameType = new GameType();
            var gameType_Match = ConfigurationManager.AppSettings["GameType_Match"];
            var matchName = Enum.GetNames(typeof(GameType)).FirstOrDefault(n => n == "Match_" + gameType_Match);
            config.GameType |= matchName != null ? (GameType)Enum.Parse(typeof(GameType), matchName) : 0;

            var gameType_Level = ConfigurationManager.AppSettings["GameType_Level"];
            var levelName = Enum.GetNames(typeof(GameType)).FirstOrDefault(n => n == "Level_" + gameType_Level);
            config.GameType |= levelName != null ? (GameType)Enum.Parse(typeof(GameType), levelName) : 0;

            var gameType_Mode = ConfigurationManager.AppSettings["GameType_Mode"];
            var modeName = Enum.GetNames(typeof(GameType)).FirstOrDefault(n => n == "Mode_" + gameType_Mode);
            config.GameType |= modeName != null ? (GameType)Enum.Parse(typeof(GameType), modeName) : 0;

            var repeat = ConfigurationManager.AppSettings["Repeat"];
            config.Repeat = repeat == "INF" ? int.MaxValue : int.Parse(repeat);

            return config;
        }

        static void Main(string[] args)
        {
            var listener = new ConsoleTraceListener();
            listener.Filter = new EventTypeFilter(SourceLevels.Off);
            Trace.Listeners.Add(listener);
            StreamWriter writer = File.CreateText("log.txt");
            writer.AutoFlush = true;
            Trace.Listeners.Add(new TextWriterTraceListener(writer));
            Config config = GetConfig();
            
            var handleInputThread = new Thread(() => HandleInput(config));
            handleInputThread.Start();

            while (config.Repeat > 0)
            {
                Start(config);
                gameEnd.WaitOne();
                client.Close();
            }

            handleInputThread.Abort();
        }
    }
}
