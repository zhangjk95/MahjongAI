using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tenhou.Models
{
    class Player
    {
        public int id;
        public string name;
        public int level;
        public string direction;
        public int point;
        public bool reached;
        public Hand hand = new Hand();
        public Graveyard graveyard = new Graveyard();
        public Fuuro fuuro = new Fuuro();
    }
}
