using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using Tenhou.Models;
using System.Threading;

namespace Tenhou
{
    class MahjongHelper
    {
        private static List<string> programPaths = new List<string> { "MahjongLib.exe", @"..\..\..\Release\MahjongLib.exe", "../source/MahjongLib/MahjongLib" };
        private static List<string> workingDirectories = new List<string> { ".", @"..\..\..\MahjongLib", "../source/MahjongLib" };
        private static List<string> resourceFiles = new List<string> { "syanten.dat" };

        private static List<MahjongHelper> instances = null;
        private static int currentInstanceIndex = 0;
        private static object indexLock = new object();
        private Process process;

        public MahjongHelper()
        {
            var programPath = Path.GetFullPath(programPaths.First(path => File.Exists(path)));
            var workingDirectory = Path.GetFullPath(workingDirectories.First(dir => resourceFiles.All(file => File.Exists(Path.Combine(dir, file)))));

            process = new Process()
            {
                StartInfo = new ProcessStartInfo()
                {
                    FileName = programPath,
                    WorkingDirectory = workingDirectory,
                    CreateNoWindow = true,
                    UseShellExecute = false,
                    RedirectStandardInput = true,
                    RedirectStandardOutput = true,
                    RedirectStandardError = true
                }
            };

            process.Start();
            process.StandardInput.AutoFlush = true;
        }

        ~MahjongHelper()
        {
            try
            {
                process.Kill();
            }
            catch { }
        }

        public static MahjongHelper getInstance()
        {
            lock (indexLock)
            {
                if (instances == null)
                {
                    instances = new List<MahjongHelper>() {
                        new MahjongHelper(),
                        new MahjongHelper(),
                        new MahjongHelper(),
                        new MahjongHelper()
                    };
                }

                currentInstanceIndex = currentInstanceIndex == 3 ? 0 : currentInstanceIndex + 1;
            }
            
            return instances[currentInstanceIndex];
        }

        public int calcDistance(Hand hand, int fuuroCount, out int normalDistance)
        {
            lock (process)
            {
                send("syanten");

                int[] handTmp = new int[38];
                foreach (var tile in hand)
                {
                    handTmp[tile.GenaralId]++;
                }
                send(string.Join(" ", handTmp));

                send(fuuroCount);

                var output = process.StandardOutput.ReadLine().Split();
                var res = int.Parse(output[0]);
                normalDistance = int.Parse(output[1]);
                return res;
            }
        }

        public int calcPoint(Hand hand, Tile lastTile, Direction gameDirection, Direction playerDirection, Fuuro fuuro, Dora dora, bool isRiichi)
        {
            lock (process)
            {
                send("mjscore");

                int[] handTmp = new int[41];
                foreach (var tile in hand)
                {
                    handTmp[getTileId(tile)]++;
                }
                send(string.Join(" ", handTmp));

                send(getTileId(lastTile));
                send((int)gameDirection + 30);
                send((int)playerDirection + 30);

                send(fuuro.Count);
                foreach (var group in fuuro)
                {
                    send(getFuuroType(group), group.Min(t => t.GenaralId));
                }

                int[] doraTmp = new int[10];
                for (int i = 0; i < dora.Count; i++)
                {
                    doraTmp[i] = dora[i].GenaralId;
                }
                send(string.Join(" ", doraTmp));

                send(isRiichi ? 1 : 0);

                var res = int.Parse(process.StandardOutput.ReadLine());
                return res;
            }
        }

        private void send(params object[] obj)
        {
            var str = string.Join(" ", obj);
            //Console.WriteLine(str);
            process.StandardInput.WriteLine(str);
        }

        private string recv()
        {
            return process.StandardOutput.ReadLine();
        }

        private int getTileId(Tile tile)
        {
            if (tile.Name == "5m*")
            {
                return 38;
            }
            else if (tile.Name == "5p*")
            {
                return 39;
            }
            else if (tile.Name == "5s*")
            {
                return 40;
            }
            else
            {
                return tile.GenaralId;
            }
        }

        private string getFuuroType(FuuroGroup group)
        {
            var hasRedDora = group.Any(t => t.isRedDora);
            if (hasRedDora && group.type == FuuroType.chii)
            {
                return "aka_chii";
            }
            else if (hasRedDora && group.type == FuuroType.pon)
            {
                return "aka_pon1";
            }
            else
            {
                return group.type.ToString();
            }
        }
    }
}
