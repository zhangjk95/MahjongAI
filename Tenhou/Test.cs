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
            var client = new TenhouClient(new Config());
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
            new TenhouClient(new Config()).decodeMeld(33039, out type, out kui, out hai0, out hai1, out hai2, out hai3);
            Console.WriteLine("{0}, {1}, {2}, {3}, {4}, {5}", type, kui, hai0, hai1, hai2, hai3);
            Console.ReadKey();
        }

        static void test4()
        {
            var client = new TenhouClient(new Config());
            client.gameData = new GameData();
            client.gameData.direction = Direction.E;
            client.gameData.players[2].direction = Direction.E;
            client.gameData.players[3].direction = Direction.S;
            client.gameData.players[0].direction = Direction.W;
            client.gameData.players[1].direction = Direction.N;
            client.gameData.dora = new Dora() { new Tile(84), new Tile(89), new Tile(104) };
            client.player.hand = new Hand() {
                new Tile(4), new Tile(8), new Tile(12), new Tile(28),
                new Tile(29), new Tile(96), new Tile(100)
            };
            client.player.fuuro = new Fuuro() {
                new FuuroGroup(FuuroType.pon) { new Tile(88), new Tile(90), new Tile(91) },
                new FuuroGroup(FuuroType.minkan) { new Tile(60), new Tile(61), new Tile(62), new Tile(63) },
            };
            var ai = new AIController(client);
            ai.OnWait(new Tile(105), client.gameData.players[3]);
        }

        static void test5()
        {
            var client = new TenhouClient(new Config());
            client.gameData = new GameData();
            client.gameData.direction = Direction.E;
            client.gameData.players[2].direction = Direction.E;
            client.gameData.players[3].direction = Direction.S;
            client.gameData.players[0].direction = Direction.W;
            client.gameData.players[1].direction = Direction.N;
            client.gameData.dora = new Dora() { new Tile(84), new Tile(89) };
            client.player.hand = new Hand() {
                new Tile(4), new Tile(8), new Tile(12), new Tile(28),
                new Tile(29), new Tile(60), new Tile(61), new Tile(62),
                new Tile(80), new Tile(88), new Tile(90), new Tile(96),
                new Tile(100)
            };
            client.player.fuuro = new Fuuro() { };
            var ai = new AIController(client);
            ai.OnWait(new Tile(91), client.gameData.players[3]);
        }

        static void test6()
        {
            var client = new TenhouClient(new Config());
            client.gameData = new GameData();
            client.gameData.direction = Direction.E;
            client.gameData.players[2].direction = Direction.E;
            client.gameData.players[3].direction = Direction.S;
            client.gameData.players[0].direction = Direction.W;
            client.gameData.players[1].direction = Direction.N;
            client.gameData.dora = new Dora() { new Tile(80), new Tile(0) };
            client.player.hand = new Hand() {
                new Tile(17), new Tile(20), new Tile(36), new Tile(37),
                new Tile(64), new Tile(68), new Tile(84), new Tile(85),
                new Tile(96), new Tile(100), new Tile(104), new Tile(132),
                new Tile(133)

            };
            client.player.fuuro = new Fuuro() { };
            var ai = new AIController(client);
            ai.OnWait(new Tile(86), client.gameData.players[2]);
        }

        static void test7()
        {
            var client = new TenhouClient(new Config());
            client.gameData = new GameData();
            client.gameData.direction = Direction.S;
            client.gameData.players[0].direction = Direction.N;
            client.gameData.players[1].direction = Direction.E;
            client.gameData.players[2].direction = Direction.S;
            client.gameData.players[3].direction = Direction.W;
            client.gameData.players[1].reached = true;
            client.gameData.players[1].graveyard = new Graveyard() { new Tile(133), new Tile(66) };
            client.gameData.dora = new Dora() { };
            client.player.hand = new Hand() {
                new Tile(44), new Tile(48), new Tile(53), new Tile(64),
                new Tile(65), new Tile(72), new Tile(76), new Tile(77),
                new Tile(80), new Tile(81), new Tile(92), new Tile(93),
                new Tile(96), new Tile(132)

            };
            client.player.fuuro = new Fuuro() { };
            var ai = new AIController(client);
            ai.OnDraw(new Tile(132));
        }

        static void Main2()
        {
            test7();
        }
    }
}
