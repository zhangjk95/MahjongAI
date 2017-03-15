using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tenhou.Models
{
    class GameData
    {
        public Dora dora = new Dora();
        public Player[] players = new Player[4];
        public Player player;
        public string direction;
        public Tile lastTile;

        public GameData()
        {
            for (int i = 0; i < 4; i++)
            {
                players[i] = new Player();
                players[i].id = i;
            }
            player = players[0];
        }
    }
}
