using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tenhou.Models
{
    class Config
    {
        public string Id { get; set; }
        public int Lobby { get; set; }
        public GameType GameType { get; set; }
        public int Repeat { get; set; }
    }
}
