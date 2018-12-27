using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;
using System.Diagnostics;
using System.IO;
using System.Configuration;

using MahjongAI.Models;

namespace MahjongAI
{
    class Program
    {
        static PlatformClient client;
        static Monitor monitor;
        static AIController controller;
        static AutoResetEvent gameEnd = new AutoResetEvent(false);

        static void Start(Config config)
        {
            if (config.Platform == Platform.Tenhou)
            {
                client = new TenhouClient(config);
            }
            else if (config.Platform == Platform.Majsoul)
            {
                client = new MajsoulClient(config);
            }

            gameEnd.Reset();

            client.OnLogin += (resume, succeeded) =>
            {
                if (!resume && succeeded)
                {
                    client.EnterPrivateRoom(config.PrivateRoom);
                    client.Join(config.GameType);
                }
            };
            client.OnGameEnd += () =>
            {
                config.Repeat--;
                gameEnd.Set();
            };
            client.OnConnectionException += () =>
            {
                if (config.Platform == Platform.Tenhou && config.TenhouID.Length <= 8) // 如果没有天凤账号，无法断线重连
                {
                    config.Repeat--;
                }
                gameEnd.Set();
            };

            monitor = new Monitor(client);
            monitor.Start();

            controller = new AIController(client, config.strategy);
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

            config.Platform = (Platform)Enum.Parse(typeof(Platform), ConfigurationManager.AppSettings["Platform"]);
            config.PrivateRoom = int.Parse(ConfigurationManager.AppSettings["PrivateRoom"]);
            var repeat = ConfigurationManager.AppSettings["Repeat"];
            config.Repeat = repeat == "INF" ? int.MaxValue : int.Parse(repeat);

            config.GameType = new GameType();

            var gameType_Match = ConfigurationManager.AppSettings["GameType_Match"];
            var matchName = Enum.GetNames(typeof(GameType)).FirstOrDefault(n => n == "Match_" + gameType_Match);
            config.GameType |= matchName != null ? (GameType)Enum.Parse(typeof(GameType), matchName) : 0;

            var gameType_Level = ConfigurationManager.AppSettings["GameType_Level"];
            var levelName = Enum.GetNames(typeof(GameType)).FirstOrDefault(n => n == "Level_" + gameType_Level);
            config.GameType |= levelName != null ? (GameType)Enum.Parse(typeof(GameType), levelName) : 0;

            config.strategy = new Strategy();

            var strategy_DefenceLevel = ConfigurationManager.AppSettings["Strategy_DefenceLevel"];
            if (strategy_DefenceLevel != null)
            {
                config.strategy.DefenceLevel = (Strategy.DefenceLevelType)Enum.Parse(typeof(Strategy.DefenceLevelType), strategy_DefenceLevel);
            }

            if (config.Platform == Platform.Tenhou)
            {
                config.TenhouID = ConfigurationManager.AppSettings["TenhouID"];

                var gameType_Mode = ConfigurationManager.AppSettings["GameType_Mode"];
                var modeName = Enum.GetNames(typeof(GameType)).FirstOrDefault(n => n == "Mode_" + gameType_Mode);
                config.GameType |= modeName != null ? (GameType)Enum.Parse(typeof(GameType), modeName) : 0;
            }
            else if (config.Platform == Platform.Majsoul)
            {
                config.MajsoulUsername = ConfigurationManager.AppSettings["MajsoulUsername"];
                config.MajsoulPassword = ConfigurationManager.AppSettings["MajsoulPassword"];
            }

            return config;
        }

        static void SelfCheck(Config config)
        {
            try
            {
                MahjongHelper.getInstance();
                if (config.Platform == Platform.Majsoul)
                {
                    new MajsoulHelper();
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
                Console.ReadKey();
                Environment.Exit(2);
            }
        }

        static void Main(string[] args)
        {
            var listener = new ConsoleTraceListener();
            listener.Filter = new EventTypeFilter(SourceLevels.Warning);
            Trace.Listeners.Add(listener);
            StreamWriter writer = File.CreateText("log.txt");
            writer.AutoFlush = true;
            Trace.Listeners.Add(new TextWriterTraceListener(writer));
            Config config = GetConfig();

            SelfCheck(config);

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
