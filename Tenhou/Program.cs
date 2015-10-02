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
        static TenhouClient client = new TenhouClient("v1.0");
        static AutoResetEvent gameEnd = new AutoResetEvent(false);

        static void Main(string[] args)
        {
            //client.Join(GameType.North);
            client.Join(GameType.East_fast);
            client.OnGameEnd += () => { gameEnd.Set(); };

            Monitor monitor = new Monitor(client);
            monitor.Start();

            Controller controller = new Controller(client, args[0]);
            controller.Start();

            gameEnd.WaitOne();
            client.Close();
        }
    }
}
