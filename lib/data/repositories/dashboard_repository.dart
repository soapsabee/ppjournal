import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/data/models/dashboard_model.dart';
import 'package:drift/drift.dart';
import 'package:ppjournal/data/models/top_three_port_profit.dart';
import 'package:ppjournal/data/models/top_three_win_model.dart';

class DashboardRepository {
  final AppDatabase db;

  DashboardRepository(this.db);

  Future<DashboardModel> getDashboardData(int portId) async {
    final port =
        await (db.select(db.port)
          ..where((tbl) => tbl.id.equals(portId))).getSingle();
    final portSize = port.portSize;

    final totalProfitQuery =
        await (db.selectOnly(db.journal)
              ..addColumns([db.journal.profit.sum()])
              ..where(db.journal.portId.equals(portId)))
            .getSingle();

    final totalProfit = totalProfitQuery.read(db.journal.profit.sum());
    final remainingBalance = portSize + (totalProfit ?? 0);

    final avgRiskQuery =
        await (db.selectOnly(db.journal)
              ..addColumns([db.journal.riskRewardRatio.avg()])
              ..where(db.journal.portId.equals(portId)))
            .getSingle();

    final avgRisk = avgRiskQuery.read(db.journal.riskRewardRatio.avg());

    final totalFeeQuery =
        await (db.selectOnly(db.journal)
              ..addColumns([db.journal.fee.sum()])
              ..where(db.journal.portId.equals(portId)))
            .getSingle();

    final totalFee = totalFeeQuery.read(db.journal.fee.sum());

    final countQuery =
        await (db.selectOnly(db.journal)
              ..addColumns([db.journal.id.count()])
              ..where(db.journal.portId.equals(portId)))
            .getSingle();

    final totalTrades = countQuery.read(db.journal.id.count());

    final winCountQuery =
        await (db.selectOnly(db.journal)
              ..addColumns([db.journal.id.count()])
              ..where(
                db.journal.portId.equals(portId) &
                    db.journal.winLose.equals('Win'),
              ))
            .getSingle();

    final winCount = winCountQuery.read(db.journal.id.count());

    final lossCountQuery =
        await (db.selectOnly(db.journal)
              ..addColumns([db.journal.id.count()])
              ..where(
                db.journal.portId.equals(portId) &
                    db.journal.winLose.equals('Loss'),
              ))
            .getSingle();

    final lossCount = lossCountQuery.read(db.journal.id.count());

    final double winRate =
        (totalTrades == 0) ? 0 : (winCount! / totalTrades!) * 100;

    final allProfits =
        await (db.select(db.journal)
              ..where((tbl) => tbl.portId.equals(portId))
              ..orderBy([(t) => OrderingTerm(expression: t.date)]))
            .get();

    double peak = 0;
    double trough = 0;
    double maxDrawdown = 0;
    double cumulativeProfit = 0;

    for (var row in allProfits) {
      final profit = row.profit ?? 0;
      cumulativeProfit += profit;

      if (cumulativeProfit > peak) {
        peak = cumulativeProfit;
        trough = cumulativeProfit;
      }

      if (cumulativeProfit < trough) {
        trough = cumulativeProfit;
        final drawdown = (peak - trough) / (peak == 0 ? 1 : peak);
        if (drawdown > maxDrawdown) {
          maxDrawdown = drawdown;
        }
      }
    }

    final allRows =
        await (db.select(db.journal)
              ..where((tbl) => tbl.portId.equals(portId))
              ..orderBy([(t) => OrderingTerm(expression: t.date)]))
            .get();

    int currentWinStreak = 0;
    int maxWinStreak = 0;
    int currentLossStreak = 0;
    int maxLossStreak = 0;

    for (final row in allRows) {
      final result = row.winLose;
      if (result == 'Win') {
        currentWinStreak++;
        currentLossStreak = 0;
        if (currentWinStreak > maxWinStreak) {
          maxWinStreak = currentWinStreak;
        }
      } else if (result == 'Loss') {
        currentLossStreak++;
        currentWinStreak = 0;
        if (currentLossStreak > maxLossStreak) {
          maxLossStreak = currentLossStreak;
        }
      } else {
        currentWinStreak = 0;
        currentLossStreak = 0;
      }
    }

    return DashboardModel(
      totalProfit: totalProfit ?? 0,
      portSize: portSize, // Assuming port size is not calculated here, set to 0
      remainingBalance: remainingBalance,
      riskRewardRatio: avgRisk ?? 0,
      totalFee: totalFee ?? 0,
      totalWin: winCount ?? 0,
      totalLoss: lossCount ?? 0,
      winRate: winRate,
      totalTrades: totalTrades ?? 0,
      maxDrawdown: maxDrawdown,
      winStreak: maxWinStreak,
      lossStreak: maxLossStreak,
    );
  }

  Future<List<TopThreeWinModel>> getTopThreeWins(int portId) async {
    final winCountExp = CustomExpression<int>(
      "COUNT(CASE WHEN win_lose = 'Win' THEN 1 END)",
    );
    final lossCountExp = CustomExpression<int>(
      "COUNT(CASE WHEN win_lose = 'Loss' THEN 1 END)",
    );

    final result =
        await (db.selectOnly(db.journal)
              ..addColumns([
                db.journal.tradeSetupId,
                db.journal.id.count(),
                winCountExp,
                lossCountExp,
              ])
              ..where(
                db.journal.portId.equals(portId) &
                    db.journal.tradeSetupId.isNotNull(),
              )
              ..groupBy([db.journal.tradeSetupId]))
            .get();

    final topSetups =
        result.map((row) {
          final tradeSetupId = row.read(db.journal.tradeSetupId)!;
          final winCount = row.read<int>(winCountExp) ?? 0;
          final lossCount = row.read<int>(lossCountExp) ?? 0;
          final total = winCount + lossCount;
          final winrate = total > 0 ? winCount / total : 0.0;

          return {
            'tradeSetupId': tradeSetupId,
            'win': winCount,
            'loss': lossCount,
            'winrate': winrate,
          };
        }).toList();

    // จัดอันดับจาก winrate มากไปน้อย แล้วเอา top 3
    topSetups.sort((a, b) => b['winrate']!.compareTo(a['winrate']!));
    final top3 = topSetups.take(3).toList();

    final tradeSetups = await db.select(db.tradeSetup).get();
    final nameMap = {for (var s in tradeSetups) s.id: s.name};

    final top3WithName =
        top3.map((e) => {...e, 'name': nameMap[e['tradeSetupId']]}).toList();

    return top3WithName.map((e) {
      return TopThreeWinModel(
        name: e['name'] as String,
        win: e['win'] as int,
        loss: e['loss'] as int,
        winRate: ((e['winrate'] as double) * 100),
      );
    }).toList();
  }

  Future<List<TopThreePortProfit>> getTopThreePortProfits() async {
    final result =
        await (db.selectOnly(db.journal)
              ..addColumns([
                db.journal.portId,
                db.journal.profit.sum(),
                db.port.name,
              ])
              ..groupBy([db.journal.portId])
              ..orderBy([
                OrderingTerm.desc(db.journal.profit.sum()),
              ])
              ..limit(3))
            .join([
              innerJoin(
                db.port,
                db.port.id.equalsExp(db.journal.portId),
              ),
            ])
            .get();
        
    final topPorts = result.map((row) {
      final portName = row.read<String>(db.port.name)!;
      final profit = row.read<double>(db.journal.profit.sum()) ?? 0.0;

      return TopThreePortProfit(
        portName: 'Port $portName', // Assuming port name is derived from ID
        profit: profit,
      );
    }).toList();

    return topPorts;
  }
}
