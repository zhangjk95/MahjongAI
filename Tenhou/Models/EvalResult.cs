using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tenhou.Models
{
    class EvalResult
    {
        public bool Furiten { get; set; }
        public int Distance { get; set; }
        public int VisibleFuuroCount { get; set; }
        public int DiscardedDoraCount { get; set; }
        public int DoraCount { get; set; }
        public int DoraInFuuroCount { get; set; }
        public int KanCount { get; set; }
        public List<double> E_PromotionCount { get; set; }
        public int E_Point { get; set; }
    }
}
