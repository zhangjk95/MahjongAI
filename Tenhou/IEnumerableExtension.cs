using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
    }
}
