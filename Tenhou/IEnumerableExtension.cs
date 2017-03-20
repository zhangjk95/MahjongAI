using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tenhou.Models;

namespace Tenhou
{
    static class IEnumerableExtension
    {
        public static string ToString<T>(this IEnumerable<T> list, string separator, Func<T, string> convert = null)
        {
            if (convert == null)
            {
                convert = (item) => item.ToString();
            }
            IEnumerable<string> strList = list.Select((item) => convert(item));
            return string.Join(separator, strList);
        }

        public static double Product<T>(this IEnumerable<T> list, Func<T, double> selector)
        {
            double res = 1;
            foreach (var item in list)
            {
                res *= selector(item);
            }
            return res;
        }

        public static int Count(this IEnumerable<Tile> tileList, Tile tile)
        {
            return tileList.Count(t => t.GenaralId == tile.GenaralId);
        }

        public static bool Exists(this IEnumerable<Tile> tileList, Tile tile)
        {
            return tileList.Any(t => t.GenaralId == tile.GenaralId);
        }
    }
}
