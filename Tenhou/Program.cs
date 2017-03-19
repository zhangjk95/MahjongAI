using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;
using Tenhou.Models;
using System.Diagnostics;
using System.IO;

namespace Tenhou
{
    class Program
    {
        static TenhouClient client;
        static Monitor monitor;
        static AIController controller;
        static AutoResetEvent gameEnd = new AutoResetEvent(false);
        static bool running = true;

        static void Start(Config config)
        {
            client = new TenhouClient(config.Id);

            gameEnd.Reset();

            client.OnLogin += () =>
            {
                client.EnterLobby(config.Lobby);
                client.Join(config.GameType);
            };
            client.OnGameEnd += () => { gameEnd.Set(); };
            client.OnClose += () => { gameEnd.Set(); };

            monitor = new Monitor(client);
            monitor.Start();

            controller = new AIController(client);
            controller.Start();

            client.Login();
        }

        static void CheckKeyPress()
        {
            while (running)
            {
                ConsoleKeyInfo key = Console.ReadKey(true);
                switch (key.Key)
                {
                    case ConsoleKey.Q:
                        Console.WriteLine("Quiting...");
                        running = false;
                        break;
                    default:
                        break;
                }
            }
        }

        static Config GetConfig()
        {
            return new Config()
            {
                // AIxile.1: ID74C257FD-758dmYBe
                // AIxile.2: ID497C2FD2-NTaW5Ed3
                Id = "AIxile.t",
                Lobby = 0,
                GameType = GameType.Match_EastSouth | GameType.Level_High,
                Repeat = int.MaxValue
            };
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

            new Thread(CheckKeyPress).Start();
            
            while (running && config.Repeat-- > 0)
            {
                //Start(config);
                //gameEnd.WaitOne();
                Console.WriteLine("test");
                Thread.Sleep(10000);
                //client.Close();
            }
        }
    }
}
