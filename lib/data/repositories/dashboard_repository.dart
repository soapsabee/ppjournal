
import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/data/models/dashboard_model.dart';

class DashboardRepository {
  final AppDatabase db;

  DashboardRepository(this.db);

  Future<DashboardModel> getDashboardData() async {
    // Fetch and return dashboard data from the database
    //  final totalProfit = await db.select(db.journal)
      return DashboardModel(
        totalTrades: 0,
        winRate: 0,
        totalProfit: 100,
        totalLoss: 10,
        portSize: 1000,
        riskRewardRatio: 1.5,
        totalFee: 50,
        totalWin: 90,
        maxDrawdown: -20,
        winStreak: 5,
        lossStreak: 3,
      );
    
  }
}