using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tenhou.Models;
using System.Diagnostics;

namespace Tenhou
{
    partial class AIController
    {
        private DefEvalResultComp defEvalResultComp = new DefEvalResultComp();

        private bool shouldDef(EvalResult evalResult)
        {
            return gameData.players.Any(p => defLevel(p) >= 2)
                    && (evalResult.Distance >= 2 && evalResult.E_Point < 8000 || evalResult.Distance == 1 && evalResult.E_Point < 4000 || evalResult.Distance == 0 && evalResult.E_Point < 2000 || gameData.remainingTile / 4 <= evalResult.Distance * 2)
                || gameData.players.Any(p => defLevel(p) >= 1)
                    && (evalResult.Distance >= 2 && evalResult.E_Point < 4000 || evalResult.Distance == 1 && evalResult.E_Point < 2000 || evalResult.Distance == 0 && evalResult.E_Point < 1000 || evalResult.Distance > 0 && gameData.remainingTile / 4 <= evalResult.Distance * 2);
        }

        private int defLevel(Player forPlayer)
        {
            if (forPlayer == player)
            {
                return 0;
            }
            else if (forPlayer.reached)
            {
                return 2;
            }
            else if (forPlayer.fuuro.VisibleCount > 0 && forPlayer.fuuro.VisibleCount * 3 + forPlayer.graveyard.Count >= 15)
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }

        public Tile chooseDiscardForDef()
        {
            DefEvalResult defEvalResult;
            var res = chooseDiscardForDef(out defEvalResult);
            return res;
        }

        private Tile chooseDiscardForDef(out DefEvalResult defEvalResult)
        {
            var evalResults = new Dictionary<string, DefEvalResult>();
            Tuple<Tile, DefEvalResult> bestResult = null;
            Trace.WriteLine("Defense: " + gameData.players.Where(p => defLevel(p) > 0).ToString(", ", p => string.Format("player({0}):{1}", p.id, defLevel(p))));
            Trace.WriteLine(string.Format("Visible tiles: {0}" , getVisibleTiles().ToString(" ", t => t.Name)));
            foreach (var p in gameData.players.Where(p => defLevel(p) > 0))
            {
                Trace.WriteLine(string.Format("Safe tiles for player({0}): {1}", p.id, p.safeTiles.Get().ToString(" ", t => t.Name)));
            }

            foreach (var tile in player.hand)
            {
                if (!evalResults.ContainsKey(tile.Name))
                {
                    var result = evalResults[tile.Name] = evalDef(tile);
                    Trace.WriteLine(string.Format("Option: discard {0}, Risk: {1}{2}", tile.Name, result.Risk, result.Risk == 0 ? "(" + result.RiskForOthers + ")" : ""));
                    if (bestResult == null
                        || defEvalResultComp.Compare(result, bestResult.Item2) > 0)
                    {
                        bestResult = new Tuple<Tile, DefEvalResult>(tile, result);
                    }
                }
            }

            Trace.WriteLine(string.Format("BestResult: discard {0}, Risk: {1}{2}", bestResult.Item1.Name, bestResult.Item2.Risk, bestResult.Item2.Risk == 0 ? "(" + bestResult.Item2.RiskForOthers + ")" : ""));
            defEvalResult = bestResult.Item2;
            return bestResult.Item1;
        }

        public DefEvalResult evalDef(Tile tile)
        {
            var res = new DefEvalResult();
            var defTargets = gameData.players.Where(p => defLevel(p) > 0);
            res.Risk = defTargets.Sum(p => evalDef(tile, p).Risk * defLevel(p)) / defTargets.Sum(p => defLevel(p));
            var others = gameData.players.Where(p => p != player && defLevel(p) == 0);
            res.RiskForOthers = others.Count() > 0 ? others.Average(p => evalDef(tile, p).Risk) : 0;
            return res;
        }

        private DefEvalResult evalDef(Tile tile, Player forPlayer)
        {
            var res = new DefEvalResult();

            if (forPlayer.safeTiles.Get().TileExists(tile))
            {
                res.Risk = 0;
            }
            else if (tile.Type == "z")
            {
                res.Risk = evalDefZ(tile, forPlayer);
            }
            else if (tile.Number == 1 || tile.Number == 9)
            {
                res.Risk = evalDef19(tile, forPlayer, tile.Number);
            }
            else if (tile.Number == 2 || tile.Number == 8)
            {
                res.Risk = evalDef28(tile, forPlayer, tile.Number);
            }
            else if (tile.Number == 3 || tile.Number == 7)
            {
                res.Risk = evalDef37(tile, forPlayer, tile.Number);
            }
            else
            {
                res.Risk = evalDefMid(tile, forPlayer);
            }

            var tmp = forPlayer.graveyard.Where(t => t.Type != "z" && t.Number != 1 && t.Number != 9).Take(2).ToList();
            if (tmp.Count >= 1 && isOutsideOf(tile, tmp[0]))
            {
                res.Risk /= 4;
            }
            if (tmp.Count >= 2 && isOutsideOf(tile, tmp[1]))
            {
                res.Risk /= 2;
            }

            if (doraValue(tile) > 0)
            {
                res.Risk += 5;
            }
            else if (res.Risk > 0 && gameData.dora.Exists(t => t.Type == tile.Type && t.Type != "z" && t.getNextGeneralId() + 1 == tile.GenaralId && t.getNextGeneralId() - 1 == tile.GenaralId))
            {
                res.Risk += 3;
            }
            else if (res.Risk > 0 && gameData.dora.Exists(t => t.Type == tile.Type && t.Type != "z" && t.getNextGeneralId() + 2 == tile.GenaralId && t.getNextGeneralId() - 2 == tile.GenaralId))
            {
                res.Risk += 2;
            }
            else if (res.Risk > 0 && gameData.dora.Exists(t => t.Type == tile.Type && t.Type != "z" && t.getNextGeneralId() + 3 == tile.GenaralId && t.getNextGeneralId() - 3 == tile.GenaralId))
            {
                res.Risk += 1;
            }

            return res;
        }

        private double evalDefZ(Tile tile, Player forPlayer)
        {
            var visibleCount = getVisibleTiles().TilesCount(tile);
            if (visibleCount == 4)
            {
                return 0;
            }
            else if (visibleCount == 3)
            {
                return 2;
            }
            else if (visibleCount == 2)
            {
                if (getWeight(tile, forPlayer) == 0)
                {
                    return 5;
                }
                else
                {
                    return 6;
                }
            }
            else
            {
                if (getWeight(tile, forPlayer) == 0)
                {
                    return 15;
                }
                else
                {
                    return 16;
                }
            }
        }

        private double evalDef19(Tile tile, Player forPlayer, int side)
        {
            if (side != 1 && side != 9)
            {
                throw new ArgumentException();
            }

            var delta = side == 1 ? 1 : -1;
            var visibleCount = getVisibleTiles().TilesCount(tile);
            var res = 0;

            switch (visibleCount)
            {
                case 4:
                    res = 0;
                    break;
                case 3:
                    res = 1;
                    break;
                case 2:
                    res = 3;
                    break;
                default:
                    res = 8;
                    break;
            }

            if (getVisibleTiles().TilesCount(tile, delta) == 4 || getVisibleTiles().TilesCount(tile, delta * 2) == 4 || forPlayer.safeTiles.Get().TileExists(tile, delta * 3))
            {
                res += 0;
            }
            else if (getVisibleTiles().TilesCount(tile, delta) == 3 && getVisibleTiles().TilesCount(tile, delta * 2) == 3)
            {
                res += 6;
            }
            else if (getVisibleTiles().TilesCount(tile, delta) == 3 || getVisibleTiles().TilesCount(tile, delta * 2) == 3)
            {
                res += 15;
            }
            else
            {
                res += 30;
            }

            return res;
        }

        private double evalDef28(Tile tile, Player forPlayer, int side)
        {
            if (side != 2 && side != 8)
            {
                throw new ArgumentException();
            }

            var delta = side == 2 ? 1 : -1;
            var visibleCount = getVisibleTiles().TilesCount(tile);

            if (getVisibleTiles().TilesCount(tile, -delta) == 4)
            {
                return evalDef19(tile, forPlayer, side == 2 ? 1 : 9);
            }
            else if (getVisibleTiles().TilesCount(tile, delta) == 4)
            {
                switch (visibleCount)
                {
                    case 4:
                        return 0;
                    case 3:
                        return 1;
                    case 2:
                        return 3;
                    default:
                        return 8;
                }
            }

            var res = 0;

            switch (visibleCount)
            {
                case 4:
                    res = 1;
                    break;
                case 3:
                    res = 3;
                    break;
                case 2:
                    res = 8;
                    break;
                default:
                    res = 15;
                    break;
            }

            if (getVisibleTiles().TilesCount(tile, delta * 2) == 4 || forPlayer.safeTiles.Get().TileExists(tile, delta * 3))
            {
                res += 0;
            }
            else if (getVisibleTiles().TilesCount(tile, delta) == 3 && getVisibleTiles().TilesCount(tile, delta * 2) == 3)
            {
                res += 8;
            }
            else if (getVisibleTiles().TilesCount(tile, delta) == 3 || getVisibleTiles().TilesCount(tile, delta * 2) == 3)
            {
                res += 20;
            }
            else
            {
                res += 40;
            }

            return res;
        }

        private double evalDef37(Tile tile, Player forPlayer, int side)
        {
            if (side != 3 && side != 7)
            {
                throw new ArgumentException();
            }

            var delta = side == 3 ? 1 : -1;
            var visibleCount = getVisibleTiles().TilesCount(tile);

            if (getVisibleTiles().TilesCount(tile, -delta) == 4)
            {
                return evalDef19(tile, forPlayer, side == 3 ? 1 : 9);
            }
            else if (getVisibleTiles().TilesCount(tile, -delta * 2) == 4)
            {
                return evalDef28(tile, forPlayer, side == 3 ? 2 : 8);
            }
            else if (getVisibleTiles().TilesCount(tile, delta) == 4)
            {
                switch (visibleCount)
                {
                    case 4:
                        return 1;
                    case 3:
                        return 3;
                    case 2:
                        return 8;
                    default:
                        return 15;
                }
            }

            var res = 0;

            switch (visibleCount)
            {
                case 4:
                    res = 3;
                    break;
                case 3:
                    res = 8;
                    break;
                case 2:
                    res = 15;
                    break;
                default:
                    res = 30;
                    break;
            }

            if (getVisibleTiles().TilesCount(tile, delta * 2) == 4 || forPlayer.safeTiles.Get().TileExists(tile, delta * 3))
            {
                res += 0;
            }
            else if (getVisibleTiles().TilesCount(tile, delta) == 3 && getVisibleTiles().TilesCount(tile, delta * 2) == 3)
            {
                res += 10;
            }
            else if (getVisibleTiles().TilesCount(tile, delta) == 3 || getVisibleTiles().TilesCount(tile, delta * 2) == 3)
            {
                res += 25;
            }
            else
            {
                res += 50;
            }

            return res;
        }

        private double evalDefMid(Tile tile, Player forPlayer)
        {
            var visibleCount = getVisibleTiles().TilesCount(tile);

            if (getVisibleTiles().TilesCount(tile, -1) == 4)
            {
                return evalDef19(tile, forPlayer, 1);
            }
            else if (getVisibleTiles().TilesCount(tile, 1) == 4)
            {
                return evalDef19(tile, forPlayer, 9);
            }
            else if (getVisibleTiles().TilesCount(tile, -2) == 4 || forPlayer.safeTiles.Get().TileExists(tile, -3))
            {
                return evalDef28(tile, forPlayer, 2);
            }
            else if (getVisibleTiles().TilesCount(tile, 2) == 4 || forPlayer.safeTiles.Get().TileExists(tile, 3))
            {
                return evalDef28(tile, forPlayer, 8);
            }
            else if (getVisibleTiles().TilesCount(tile, -3) == 4)
            {
                return evalDef37(tile, forPlayer, 3);
            }
            else if (getVisibleTiles().TilesCount(tile, 3) == 4)
            {
                return evalDef37(tile, forPlayer, 7);
            }
            else
            {
                return 100;
            }
        }

        private bool isOutsideOf(Tile x, Tile y)
        {
            if (x.Type != y.Type || x.Type == "z")
            {
                return false;
            }

            if (y.Number < 5)
            {
                return x.Number < y.Number && x.Number > y.Number - 3;
            }
            else if (y.Number > 5)
            {
                return x.Number > y.Number && x.Number < y.Number + 3;
            }
            else
            {
                return x.Number == 3 || x.Number == 7;
            }
        }

        private class DefEvalResultComp : IComparer<DefEvalResult>
        {
            public int Compare(DefEvalResult x, DefEvalResult y)
            {
                int res = 0;
                if ((y == null) && (x == null))
                {
                    return 0;
                }
                if ((res = (y == null).CompareTo(x == null)) != 0)
                {
                    return res;
                }
                else if ((res = y.Risk.CompareTo(x.Risk)) != 0)
                {
                    return res;
                }
                else if (x.Risk == 0 && y.Risk == 0 && (res = x.RiskForOthers.CompareTo(y.RiskForOthers)) != 0)
                {
                    return res;
                }
                else
                {
                    return 0;
                }
            }
        }
    }
}
