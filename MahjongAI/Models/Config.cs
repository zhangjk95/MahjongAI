using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MahjongAI.Models
{
    class Config
    {
        public Platform Platform { get; set; }
        public string TenhouID { get; set; }
        public string MajsoulUsername { get; set; }
        public string MajsoulPassword { get; set; }
        public int PrivateRoom { get; set; }
        public GameType GameType { get; set; }
        public int Repeat { get; set; }
        public Strategy strategy { get; set; }
    }
}
