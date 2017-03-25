using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tenhou.Models;

namespace Tenhou
{
    class Test
    {
        static void test()
        {
            var client = new TenhouClient("");
            client.gameData = new GameData();
            client.gameData.direction = Direction.E;
            client.gameData.players[2].direction = Direction.E;
            client.gameData.players[3].direction = Direction.S;
            client.gameData.players[0].direction = Direction.W;
            client.gameData.players[1].direction = Direction.N;
            client.gameData.dora = new Dora() { new Tile(48) };
            client.player.hand = new Hand() {
                new Tile(16), new Tile(17), new Tile(20), new Tile(36),
                new Tile(37), new Tile(44), new Tile(45), new Tile(48),
                new Tile(68), new Tile(80), new Tile(92), new Tile(93),
                new Tile(96), new Tile(100)
            };
            client.player.fuuro = new Fuuro() { };
            var ai = new AIController(client);
            ai.chooseDiscardForAtk();
        }

        static void test2()
        {
            var point = MahjongHelper.getInstance().calcPoint(new Hand()
            {
                new Tile(0), new Tile(4), new Tile(8),
                new Tile(36), new Tile(40), new Tile(44),
                new Tile(48), new Tile(52), new Tile(56),
                new Tile(96), new Tile(100), new Tile(104),
                new Tile(124), new Tile(125)
            }, new Tile(40), Direction.E, Direction.E, new Fuuro(), new Dora { new Tile(68) }, false);
            Console.WriteLine(point);
            Console.ReadKey();
        }

        static void test3()
        {
            int type, kui, hai0, hai1, hai2, hai3;
            new TenhouClient("").decodeMeld(33039, out type, out kui, out hai0, out hai1, out hai2, out hai3);
            Console.WriteLine("{0}, {1}, {2}, {3}, {4}, {5}", type, kui, hai0, hai1, hai2, hai3);
            Console.ReadKey();
        }
    }
}
