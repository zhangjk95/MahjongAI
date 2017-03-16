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

        static void Init()
        {
            client = new TenhouClient("AIxile");

            gameEnd.Reset();

            client.OnLogin += () =>
            {
                client.EnterLobby(0);
                client.Join(GameType.South);
                //client.Join(GameType.South_fast);
                //client.Join(GameType.East);
                //client.Join(GameType.East_fast);
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
            if (Console.KeyAvailable)
            {
                ConsoleKeyInfo key = Console.ReadKey(true);
                switch (key.Key)
                {
                    case ConsoleKey.Q:
                        running = false;
                        break;
                    default:
                        break;
                }
            }
        }

        static void Main(string[] args)
        {
            var listener = new ConsoleTraceListener();
            listener.Filter = new EventTypeFilter(SourceLevels.Off);
            Trace.Listeners.Add(listener);
            StreamWriter writer = File.CreateText("log.txt");
            writer.AutoFlush = true;
            Trace.Listeners.Add(new TextWriterTraceListener(writer));

            
            while (running)
            {
                Init();
                gameEnd.WaitOne();
                client.Close();
                CheckKeyPress();
            }
        }
    }
}
