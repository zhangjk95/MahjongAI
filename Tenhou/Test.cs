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
            client.gameData.dora = new Dora() { new Tile(91) };
            client.player.hand = new Hand() {
                new Tile(30), new Tile(37), new Tile(24), new Tile(134),
                new Tile(26), new Tile(19), new Tile(106), new Tile(1),
                new Tile(4), new Tile(83), new Tile(59), new Tile(10),
                new Tile(99), new Tile(20)
            };
            var ai = new AIController(client);
            ai.chooseDiscardForAtk();
        }
    }
}
