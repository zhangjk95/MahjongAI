using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tenhou.Models;

namespace Tenhou
{
    class AIController
    {
        TenhouClient client;
        bool isRunning;

        public AIController(TenhouClient client)
        {
            this.client = client;
            this.isRunning = false;
        }

        ~AIController()
        {
            Stop();
        }

        public void Start()
        {
            client.OnDraw += OnDraw;
            client.OnWait += OnWait;
            client.OnClose += OnClose;

            isRunning = true;
        }

        public void Stop()
        {
            if (isRunning)
            {
                try
                {
                    client.OnDraw -= OnDraw;
                    client.OnWait -= OnWait;
                    client.OnClose -= OnClose;

                    isRunning = false;
                }
                catch { }
            }
        }

        private void OnClose()
        {
            Stop();
        }

        private void OnDraw(Tile tile)
        {
            
        }

        private void OnWait(Tile tile, Player fromPlayer)
        {
            
        }
    }
}
