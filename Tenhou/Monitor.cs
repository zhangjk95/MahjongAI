using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tenhou.Models;

namespace Tenhou
{
    class Monitor: Controller
    {
        public Monitor(TenhouClient client): base(client)
        {

        }

        protected override void OnLogin()
        {
            Trace.WriteLine("Login");
        }

        protected override void OnClose()
        {
            base.OnClose();
            Trace.WriteLine("Client closed.");
        }

        protected override void OnDraw(Tile tile)
        {
            Trace.WriteLine(string.Format("draw {0}", tile.Name));
            Trace.WriteLine(client.player.hand.ToString(" ", t => t.Name) + " | " + client.player.fuuro.Tiles.ToString(" ", t => t.Name));
        }

        protected override void OnWait(Tile tile, Player fromPlayer)
        {
            Trace.WriteLine(string.Format("wait {0} from {1}", tile.Name, fromPlayer.id));
        }

        protected override void OnDiscard(Player player, Tile tile)
        {
            if (player.id == 0)
            {
                Trace.WriteLine(string.Format("discard {0}", tile.Name));
                Trace.WriteLine(client.player.hand.ToString(" ", (handTile) => handTile.Name) + " | " + client.player.fuuro.Tiles.ToString(" ", t => t.Name));
            }
        }

        protected override void OnGameStart(bool continued)
        {
            if (!continued)
            {
                Trace.WriteLine("Game started.");
            }
            else
            {
                Trace.WriteLine("Game continued.");
            }
        }

        protected override void OnGameEnd()
        {
            Trace.WriteLine("Game ended.");
        }

        protected override void OnUnknownEvent(string str)
        {
            Trace.WriteLine(str);
        }
    }
}
