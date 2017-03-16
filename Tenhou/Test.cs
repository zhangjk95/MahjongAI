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
            client.gameData.dora = new Dora() { new Tile(81) };
            client.player.hand = new Hand() {
                new Tile(4), new Tile(5), new Tile(48), new Tile(49),
                new Tile(53), new Tile(69), new Tile(81), new Tile(85),
                new Tile(86), new Tile(120), new Tile(121)
            };
            client.player.fuuro = new Fuuro() { new FuuroGroup() { new Tile(124), new Tile(125), new Tile(126) } };
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
            int type, hai0, hai1, hai2, hai3;
            new TenhouClient("").decodeM(21504, out type, out hai0, out hai1, out hai2, out hai3);
            Console.WriteLine("{0}, {1}, {2}, {3}, {4}", type, hai0, hai1, hai2, hai3);
            Console.ReadKey();
        }
    }
}
