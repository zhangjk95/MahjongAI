using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tenhou.Models
{
    class Fuuro: List<FuuroGroup>
    {
        public IEnumerable<Tile> Tiles
        {
            get
            {
                return this.SelectMany(group => group);
            }
        }

        public int VisibleCount
        {
            get
            {
                return this.Where(group => group.type != FuuroType.ankan).Count();
            }
        }
    }

    class FuuroGroup : List<Tile>
    {
        public FuuroType type;
    }

    enum FuuroType
    {
        chii,
        pon,
        minkan,
        ankan,
        kakan
    }
}
