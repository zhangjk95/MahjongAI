using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tenhou.Models
{
    class DefEvalResult
    {
        public double Risk { get; set; }
        public double RiskForOthers { get; set; }
        public double Bonus { get; set; }
        public EvalResult AtkEvalResult { get; set; }
    }
}
