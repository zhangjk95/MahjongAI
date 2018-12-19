using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MahjongAI.Models
{
    class Strategy
    {
        public enum DefenceLevelType
        {
            Default,
            DefendReachedPlayers,
            DefendReachedOya,
            NoDefence,
        }

        public DefenceLevelType DefenceLevel { get; set; } = DefenceLevelType.Default;
    }
}
