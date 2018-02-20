using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tenhou.Models
{
    class GameData
    {
        public const int initialRemainingTile = 69;
        public Dora dora = new Dora();
        public Player[] players = new Player[4];
        public Direction direction;
        public int seq;
        public int seq2;
        public Tile lastTile;
        public int remainingTile;

        public Player player
        {
            get
            {
                return players[0];
            }
        }

        public GameData()
        {
            for (int i = 0; i < 4; i++)
            {
                players[i] = new Player();
                players[i].id = i;
            }
        }
    }
}
