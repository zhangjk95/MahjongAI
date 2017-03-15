using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tenhou.Models;

namespace Tenhou
{
    class Monitor
    {
        TenhouClient client;
        bool isRunning;

        public Monitor(TenhouClient client)
        {
            this.client = client;
            this.isRunning = false;
        }

        ~Monitor()
        {
            if (isRunning)
            {
                Stop();
            }
        }

        public void Start() 
        {
            client.OnDraw += OnDraw;
            client.OnWait += OnWait;
            client.OnDiscard += OnDiscard;
            client.OnGameStart += OnGameStart;
            client.OnGameEnd += OnGameEnd;
            client.OnLogin += OnLogin;
            client.OnClose += OnClose;
            client.OnUnknownEvent += OnUnknownEvent;
            isRunning = true;
        }

        void OnLogin()
        {
            Console.WriteLine("Login");
        }

        public void Stop()
        {
            client.OnDraw -= OnDraw;
            client.OnWait -= OnWait;
            client.OnDiscard -= OnDiscard;
            client.OnGameStart -= OnGameStart;
            client.OnClose -= OnClose;
            client.OnGameEnd -= OnGameEnd;
            client.OnUnknownEvent -= OnUnknownEvent;
            isRunning = false;
        }

        private void OnClose()
        {
            Stop();
            Console.WriteLine("Client closed.");
        }

        private void OnDraw(Tile tile)
        {
            Console.WriteLine("draw {0}", tile.Name);
            Console.WriteLine(client.player.hand.ToString(" ", (handTile) => handTile.Name));
        }

        private void OnWait(Tile tile, Player fromPlayer)
        {
            Console.WriteLine("wait {0} from {1}", tile.Name, fromPlayer.id);
        }

        private void OnDiscard(Player player, Tile tile)
        {
            if (player.id == 0)
            {
                Console.WriteLine("discard {0}", tile.Name);
                Console.WriteLine(client.player.hand.ToString(" ", (handTile) => handTile.Name));
            }
        }

        private void OnGameStart(bool continued)
        {
            if (!continued)
            {
                Console.WriteLine("Game started.");
            }
            else
            {
                Console.WriteLine("Game continued.");
            }
        }

        private void OnGameEnd()
        {
            Console.WriteLine("Game ended.");
        }

        private void OnUnknownEvent(string str)
        {
            Console.WriteLine(str);
        }
    }
}
