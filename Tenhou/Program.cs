using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;
using Tenhou.Models;

namespace Tenhou
{
    class Program
    {
        static TenhouClient client;
        static Monitor monitor;
        static Controller controller;
        static AutoResetEvent gameEnd = new AutoResetEvent(false);

        static void Init(string programPath)
        {
            client = new TenhouClient("NoName"); //ID073C5834-E2RTTUYN

            client.OnLogin += () =>
            {
                client.Join(GameType.North);
                client.Join(GameType.North_fast);
                client.Join(GameType.East);
                client.Join(GameType.East_fast);
            };
            client.OnGameEnd += () => { gameEnd.Set(); };
            client.OnClose += () => { gameEnd.Set(); };

            monitor = new Monitor(client);
            monitor.Start();

            controller = new Controller(client, programPath);
            controller.Start();

            client.Login();
        }

        static void Main(string[] args)
        {
            while (true)
            {
                Init(args[0]);

                gameEnd.WaitOne();
                client.Close();

                if (Console.ReadLine() == "q")
                {
                    break;
                }
            }
        }
    }
}
