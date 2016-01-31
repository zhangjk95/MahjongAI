using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tenhou.Models
{
    class GameData
    {
        public Hand hand = new Hand();
        public Dora dora = new Dora();
        public Player[] player = new Player[4];
        public string direction;
        public Tile lastTile;

        public GameData()
        {
            for (int i = 0; i < 4; i++)
            {
                player[i] = new Player();
                player[i].num = i;
            }
        }
    }
}
