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
                new Tile(0), new Tile(4), new Tile(20), new Tile(24),
                new Tile(48), new Tile(49), new Tile(56), new Tile(60),
                new Tile(76), new Tile(80), new Tile(100), new Tile(116),
                new Tile(124), new Tile(128)
            };
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
    }
}
