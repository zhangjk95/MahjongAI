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

        protected override void OnConnectionException()
        {
            Trace.WriteLine("Unexpectedly disconnected.");
        }

        protected override void OnDraw(Tile tile)
        {
            Trace.WriteLine(string.Format("draw {0}", tile.Name));
            showCurrentState();
        }

        protected override void OnWait(Tile tile, Player fromPlayer)
        {
            Trace.WriteLine(string.Format("wait {0} from player({1})", tile.Name, fromPlayer.id));
            showCurrentState();
        }

        protected override void OnDiscard(Player player, Tile tile)
        {
            Trace.WriteLine(string.Format("player({0}) discard {1}", player.id, tile.Name));
            if (player.id == 0)
            {
                showCurrentState();
            }
        }

        protected override void OnReach(Player player)
        {
            Trace.WriteLine(string.Format("player({0}) reach", player.id));
        }

        protected override void OnNaki(Player player, FuuroGroup fuuro)
        {
            Trace.WriteLine(string.Format("player({0}) {1}: {2}", player.id, fuuro.type.ToString(), fuuro.ToString(" ", t => t.Name)));
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

        private void showCurrentState()
        {
            Trace.WriteLine(client.player.hand.ToString(" ", (handTile) => handTile.Name) + " | " + client.player.fuuro.Tiles.ToString(" ", t => t.Name));
        }
    }
}
