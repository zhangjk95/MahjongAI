using System;
using System.Collections.Generic;
using MahjongAI.Models;

namespace MahjongAI
{
    static class Constants
    {
        public const string CN_GAME_SERVER_HOST = "https://game.maj-soul.com/1";

        public static readonly IReadOnlyDictionary<MajsoulRegion, string> MAJSOUL_API_URL_PRIFIX = new Dictionary<MajsoulRegion, string>()
        {
            { MajsoulRegion.CN_INTERNATIONAL_1, "https://lb-hw.maj-soul.com/api/v0" },
            { MajsoulRegion.CN_INTERNATIONAL_2, "https://lb-v2.maj-soul.com:4443/api/v0" },
            { MajsoulRegion.CN_INTERNATIONAL_3, "https://lb-cdn.maj-soul.com/api/v0" },
            { MajsoulRegion.CN_INTERNATIONAL_4, "https://lb-hw.maj-soul.com/api/v0" },
            { MajsoulRegion.CN_INTERNATIONAL_5, "https://lb-sy.maj-soul.com/api/v0" },
        };

        public const string TENHOU_SERVER_HOST = "133.242.10.78";

        public const int TENHOU_SERVER_PORT = 10080;
    }
}