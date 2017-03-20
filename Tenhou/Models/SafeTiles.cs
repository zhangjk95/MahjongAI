using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tenhou.Models
{
    class SafeTiles: List<Tile>
    {
        Player player = null;

        public SafeTiles(): base()
        {

        }

        public SafeTiles(Player player)
        {
            this.player = player;
        }

        public IEnumerable<Tile> Get(bool includingGraveyard = true)
        {
            if (includingGraveyard && player != null)
            {
                foreach (var tile in player.graveyard)
                {
                    yield return tile;
                }
            }

            foreach (var tile in this)
            {
                yield return tile;
            }
        }
    }
}
