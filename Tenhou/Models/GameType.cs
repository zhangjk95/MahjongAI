using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tenhou.Models
{
    [Flags]
    enum GameType
    {
        Match_East = 1,
        Match_South = 9,
        Mode_Fast = 64,
        Level_High = 128,
        Level_Toku = 32,
        Level_Houo = 160
    }
}
