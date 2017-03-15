using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tenhou.Models
{
    class Fuuro: List<List<Tile>>
    {
        public List<Tile> Tiles
        {
            get
            {
                return this.SelectMany(group => group).ToList();
            }
        }
    }
}
