using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tenhou.Models;
using System.Diagnostics;
using System.Threading;

namespace Tenhou
{
    partial class AIController : Controller
    {
        private const int defaultDepth = 3;

        private EvalResultComp evalResultComp = new EvalResultComp();

        public AIController(TenhouClient client): base(client)
        {
            MahjongHelper.getInstance();
        }

        protected override void OnDraw(Tile tile)
        {
            int distance = calcDistance();
            if (distance == -1)
            {
                client.Tsumo();
            }
            else if (player.reached)
            {
                if (shouldAnKan(tile))
                {
                    client.Ankan(tile);
                }
                else
                {
                    client.Discard(tile);
                }
            }
            else {
                EvalResult evalResult;
                Tile discardTile = chooseDiscardForAtk(out evalResult);
                if (!shouldDef(evalResult))
                {
                    if (shouldAnKan(discardTile))
                    {
                        client.Ankan(discardTile);
                    }
                    else if (shouldKaKan(discardTile))
                    {
                        client.Kakan(discardTile);
                    }
                    else if (shouldReach(discardTile, evalResult))
                    {
                        client.Reach(discardTile);
                        client.Discard(discardTile);
                    }
                    else {
                        client.Discard(discardTile);
                    }
                }
                else
                {
                    Tile newDiscardTile = chooseDiscardForDef();
                    client.Discard(newDiscardTile);
                }
            }
        }

        protected override void OnWait(Tile tile, Player fromPlayer)
        {
            EvalResult currentEvalResult = eval13();
            player.hand.Add(tile);
            EvalResult currentEvalResult14 = eval14(tile, 1);
            player.hand.Remove(tile);
            if (currentEvalResult14.Distance == -1 && !currentEvalResult.Furiten && currentEvalResult14.ePoint > 0)
            {
                client.Ron();
            }
            else
            {
                Trace.WriteLine("Distance: " + currentEvalResult.Distance);
                Trace.WriteLine(string.Format("Option: pass, ePromotionCount: [{0}], ePoint: {1}", currentEvalResult.ePromotionCount.ToString(", ", c => c.ToString("F0")), currentEvalResult.ePoint));
                player.hand.Add(tile);

                List<FuuroGroup> candidates = new List<FuuroGroup>()
                {
                    tryGetFuuroGroup(FuuroType.pon, new[] { Tuple.Create(tile.GenaralId, 2) }, tile)
                };
                if (gameData.remainingTile > 0)
                {
                    candidates.Add(tryGetFuuroGroup(FuuroType.minkan, new[] { Tuple.Create(tile.GenaralId, 3) }, tile));
                }
                if (fromPlayer.id == 3 && tile.Type != "z")
                {
                    candidates.AddRange(new List<FuuroGroup>()
                    {
                        tryGetFuuroGroup(FuuroType.chii, new[] { Tuple.Create(tile.GenaralId + 1, 1), Tuple.Create(tile.GenaralId + 2, 1) }, tile),
                        tryGetFuuroGroup(FuuroType.chii, new[] { Tuple.Create(tile.GenaralId - 1, 1), Tuple.Create(tile.GenaralId + 1, 1) }, tile),
                        tryGetFuuroGroup(FuuroType.chii, new[] { Tuple.Create(tile.GenaralId - 2, 1), Tuple.Create(tile.GenaralId - 1, 1) }, tile)
                    });
                }
                Tuple<FuuroGroup, Tile, EvalResult> bestResult = Tuple.Create<FuuroGroup, Tile, EvalResult>(null, null, currentEvalResult);

                foreach (var candidate in candidates)
                {
                    if (candidate == null)
                    {
                        continue;
                    }

                    Trace.WriteLine(string.Format("Option: {0}", candidate.type.ToString()));
                    player.hand.RemoveRange(candidate);
                    player.fuuro.Add(candidate);
                    Tile discardTile = null;
                    EvalResult tmpResult;
                    if (candidate.type != FuuroType.minkan)
                    {
                        discardTile = chooseDiscardForAtk(out tmpResult);

                        // 不能食替
                        if (discardTile.GenaralId == tile.GenaralId 
                            || discardTile.Type == tile.Type && discardTile.GenaralId == tile.GenaralId - 3 && candidate.Exists(t => t.GenaralId == tile.GenaralId - 2) && candidate.Exists(t => t.GenaralId == tile.GenaralId - 1)
                            || discardTile.Type == tile.Type && discardTile.GenaralId == tile.GenaralId + 3 && candidate.Exists(t => t.GenaralId == tile.GenaralId + 2) && candidate.Exists(t => t.GenaralId == tile.GenaralId + 1))
                        {
                            tmpResult = null;
                        }
                    }
                    else
                    {
                        tmpResult = eval13();
                    }
                    if (tmpResult != null && shouldNaki(currentEvalResult, tmpResult) && evalResultComp.Compare(tmpResult, bestResult.Item3) > 0)
                    {
                        bestResult = Tuple.Create(candidate, discardTile, tmpResult);
                    }
                    player.fuuro.Remove(candidate);
                    player.hand.AddRange(candidate);
                }

                player.hand.Remove(tile);
                Trace.WriteLine(string.Format("BestResult: {0}, ePromotionCount: [{1}], ePoint: {2}", bestResult.Item1 != null ? bestResult.Item1.type.ToString() : "pass", bestResult.Item3.ePromotionCount.ToString(", ", c => c.ToString("F0")), bestResult.Item3.ePoint));

                if (bestResult.Item1 != null)
                {
                    switch (bestResult.Item1.type)
                    {
                        case FuuroType.chii:
                            client.Chii(bestResult.Item1[0], bestResult.Item1[1]);
                            break;
                        case FuuroType.pon:
                            client.Pon(bestResult.Item1[0], bestResult.Item1[1]);
                            break;
                        case FuuroType.minkan:
                            client.Minkan();
                            break;
                    }
                    if (bestResult.Item1.type == FuuroType.chii || bestResult.Item1.type == FuuroType.pon)
                    {
                        Thread.Sleep(5000); // 等待其他玩家响应
                        Console.WriteLine(player.hand.Count + " " + player.fuuro.Count);
                        if (player.hand.Count + player.fuuro.Count * 3 == 14) // 等待之后如果手牌数多出来了表示鸣牌成功
                        {
                            client.Discard(bestResult.Item2);
                        }
                    }
                }
                else
                {
                    client.Pass();
                }
            }
        }

        private bool shouldReach(Tile discardTile, EvalResult evalResult)
        {
            player.hand.Remove(discardTile);
            player.graveyard.Add(discardTile);
            EvalResult evalResultWithoutReach = eval13(1, false);
            player.graveyard.Remove(discardTile);
            player.hand.Add(discardTile);

            return !player.reached && player.fuuro.VisibleCount == 0 && gameData.remainingTile >= 4 && evalResult.Distance == 0
                && (evalResultWithoutReach.ePoint < 7700 || gameData.players.Count(p => p.reached) >= 2) // 期望得点<7700 或 立直人数 >=2
                && evalResult.ePromotionCount[0] > 0; // 没有空听
        }

        private bool shouldAnKan(Tile tile)
        {
            FuuroGroup group = tryGetFuuroGroup(FuuroType.ankan, new[] { Tuple.Create(tile.GenaralId, 4) });
            if (group == null || gameData.remainingTile <= 0)
            {
                return false;
            }

            int distance = calcDistance();
            player.fuuro.Add(group);
            player.hand.RemoveRange(group);

            int newDistance = calcDistance();
            bool res = false;
            if (newDistance == distance)
            {
                res = true;
            }

            player.fuuro.Remove(group);
            player.hand.AddRange(group);

            return res;
        }

        private bool shouldKaKan(Tile tile)
        {
            return gameData.remainingTile > 0 && player.fuuro.Any(group => group.type == FuuroType.pon && group.All(t => t.GenaralId == tile.GenaralId));
        }

        private bool shouldNaki(EvalResult resultBefore, EvalResult resultAfter)
        {
            return resultBefore.Distance >= 3 && hasYakuhai()
                || resultBefore.Distance <= 2 && (resultBefore.ePoint - resultAfter.ePoint) <= 0 && resultAfter.ePoint > 0
                || resultBefore.Distance <= 2 && ((resultBefore.ePoint - resultAfter.ePoint) < resultBefore.ePoint * 3 / 5 || (resultBefore.ePoint - resultAfter.ePoint) < 2000) && resultAfter.ePoint > 0
                    && resultBefore.Distance > resultAfter.Distance && (resultBefore.ePromotionCount[1] <= resultAfter.ePromotionCount[0] || resultBefore.VisibleFuuroCount > 0);
        }

        private bool shouldDef(EvalResult evalResult)
        {
            return false;
        }

        public Tile chooseDiscardForAtk(int depth = -1)
        {
            EvalResult evalResult;
            var res = chooseDiscardForAtk(out evalResult, depth);
            return res;
        }

        private Tile chooseDiscardForAtk(out EvalResult evalResult, int depth = -1)
        {
            var handTmp = new List<Tile>(player.hand);
            var evalResults = new Dictionary<string, EvalResult>();
            Tuple<Tile, EvalResult> bestResult = null;
            var currentDistance = calcDistance();
            if (depth == -1)
            {
                Trace.WriteLine("Distance: " + currentDistance);
            }

            foreach (var tile in handTmp)
            {
                if (!evalResults.ContainsKey(tile.Name))
                {
                    player.hand.Remove(tile);
                    player.graveyard.Add(tile);
                    var tmpDistance = calcDistance();
                    if (tmpDistance > currentDistance) // 打掉后向听数增加
                    {
                        evalResults[tile.Name] = null;
                    }
                    else
                    {
                        var result = evalResults[tile.Name] = eval13(depth);
                        result.DiscardedDoraCount = doraValue(tile);
                        if (depth == -1)
                        {
                            Trace.WriteLine(string.Format("Option: discard {0}, ePromotionCount: [{1}], ePoint: {2}", tile.Name, result.ePromotionCount.ToString(", ", c => c.ToString("F0")), result.ePoint));
                        }
                    }
                    player.hand.Add(tile);
                    player.graveyard.Remove(tile);
                }
            }

            foreach (var tile in handTmp)
            {
                var result = evalResults[tile.Name];

                if (result == null)
                {
                    continue;
                }

                if (bestResult == null 
                    || evalResultComp.Compare(result, bestResult.Item2) > 0 
                    || evalResultComp.Compare(result, bestResult.Item2) == 0 && getWeight(tile) < getWeight(bestResult.Item1))
                {
                    bestResult = new Tuple<Tile, EvalResult>(tile, result);
                }
            }

            if (depth == -1)
            {
                Trace.WriteLine(string.Format("BestResult: discard {0}, ePromotionCount: [{1}], ePoint: {2}", bestResult.Item1.Name, bestResult.Item2.ePromotionCount.ToString(", ", c => c.ToString("F0")), bestResult.Item2.ePoint));
            }
            evalResult = bestResult.Item2;
            return bestResult.Item1;
        }

        private EvalResult eval13(int depth = -1, bool riichi = true)
        {
            var res = new EvalResult();
            res.Distance = calcDistance();
            if (depth == -1)
            {
                if (res.Distance > defaultDepth - 1) // 如果向听数高就减少搜索深度
                {
                    depth = defaultDepth - 1;
                }
                else
                {
                    depth = defaultDepth;
                }
            }
            res.DoraInFuuroCount = player.fuuro.Tiles.Sum(t => doraValue(t));
            res.DoraCount = player.hand.Sum(t => doraValue(t)) + res.DoraInFuuroCount;
            res.VisibleFuuroCount = player.fuuro.VisibleCount;
            res.KanCount = player.fuuro.Count(f => f.type == FuuroType.ankan || f.type == FuuroType.kakan || f.type == FuuroType.minkan);
            var promotionTiles = new List<Tuple<Tile, EvalResult>>();
            var evalResults = new Dictionary<string, EvalResult>();
            var candidates = new HashSet<string>();
            var visibleTiles = getVisibleTiles().ToList();
            for (var i = 0; i < Tile.TotalCount; i++)
            {
                if (!visibleTiles.Exists(t => t.Id == i))
                {
                    var tile = new Tile(i);
                    EvalResult currentResult;
                    if (!evalResults.TryGetValue(tile.Name, out currentResult))
                    {
                        player.hand.Add(tile);
                        if (calcDistance() < res.Distance)
                        {
                            currentResult = evalResults[tile.Name] = eval14(tile, depth, riichi);
                        }
                        else
                        {
                            currentResult = evalResults[tile.Name] = null;
                        }
                        player.hand.Remove(tile);
                    }
                    if (currentResult != null)
                    {
                        promotionTiles.Add(Tuple.Create(tile, currentResult));
                    }
                }
            }

            res.Furiten = promotionTiles.Exists(tuple => player.graveyard.Exists(t => t.GenaralId == tuple.Item1.GenaralId));

            if (res.Distance < depth) // 在可以算出得点的情况下
            {
                promotionTiles.RemoveAll(tuple => tuple.Item2.ePoint <= 0); // 把得点为0的情况去掉（不算进张）
            }
            
            res.ePromotionCount = new List<double>() { promotionTiles.Count };
            for (var i = 0; i < Math.Min(depth - 1, res.Distance); i++)
            {
                res.ePromotionCount.Add(promotionTiles.Count > 0 ? promotionTiles.Sum(tuple => tuple.Item2.ePromotionCount[i]) / promotionTiles.Count : 0);
            }
            if (promotionTiles.Count > 0)
            {
                res.ePoint = promotionTiles.Sum(tuple => tuple.Item2.ePoint) / promotionTiles.Count;
            }
            
            return res;
        }

        private EvalResult eval14(Tile lastTile, int depth, bool riichi = true)
        {
            var res = new EvalResult();
            res.Distance = calcDistance();
            if (depth <= 1 || res.Distance == -1)
            {
                if (res.Distance == -1)
                {
                    res.ePoint = calcPoint(lastTile, riichi);
                }
                res.ePromotionCount = new List<double>();
            }
            else
            {
                EvalResult tmpResult;
                chooseDiscardForAtk(out tmpResult, depth - 1);
                res.ePoint = tmpResult.ePoint;
                res.ePromotionCount = tmpResult.ePromotionCount;
            }
            return res;
        }

        private Tile chooseDiscardForDef()
        {
            throw new NotImplementedException();
        }

        private class EvalResultComp : IComparer<EvalResult>
        {
            private EPromotionCountComp ePromotionComp = new EPromotionCountComp();

            public int Compare(EvalResult x, EvalResult y)
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
                else if ((res = y.Distance.CompareTo(x.Distance)) != 0) // 向听数
                {
                    return res;
                }
                else if ((res = y.Furiten.CompareTo(x.Furiten)) != 0) // 是否振听
                {
                    return res;
                }
                else if ((res = (x.ePoint * x.ePromotionCount.Product(n => n)).CompareTo(y.ePoint * y.ePromotionCount.Product(n => n))) != 0) // 期望得点数 * 进张数的积
                {
                    return res;
                }
                else if ((res = (y.VisibleFuuroCount > 0).CompareTo(x.VisibleFuuroCount > 0)) != 0) // 是否门清
                {
                    return res;
                }
                else if (x.ePromotionCount.Count > 0 && (res = (x.ePromotionCount[0] - (x.DiscardedDoraCount.CompareTo(y.DiscardedDoraCount) > 0 ? 1 : 0)).CompareTo(y.ePromotionCount[0])) != 0) // 进张数（如果打掉的牌是dora，打掉的话视为进张数少1）
                {
                    return res;
                }
                else if ((res = x.DoraCount.CompareTo(y.DoraCount)) != 0) // dora数
                {
                    return res;
                }
                else if ((res = x.DoraInFuuroCount.CompareTo(y.DoraInFuuroCount)) != 0) // 副露中的dora数
                {
                    return res;
                }
                else if ((res = ePromotionComp.Compare(x.ePromotionCount, y.ePromotionCount)) != 0) // 后几层的进张数
                {
                    return res;
                }
                else if ((res = x.KanCount.CompareTo(y.KanCount)) != 0) // 杠的数量
                {
                    return res;
                }
                else
                {
                    return 0;
                }
            }
        }

        private class EPromotionCountComp : IComparer<List<double>>
        {
            public int Compare(List<double> x, List<double> y)
            {
                for (int i = 0; i < x.Count; i++)
                {
                    if (x[i].CompareTo(y[i]) != 0)
                    {
                        return x[i].CompareTo(y[i]);
                    }
                }

                return 0;
            }
        }
    }
}
