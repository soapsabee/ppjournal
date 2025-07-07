
class DashboardModel {
  final double portSize;
  final double totalProfit;
  final double riskRewardRatio;
  final double totalFee;
  final int totalLoss;
  final int totalWin;
  final double winRate;
  final double totalTrades;
  final int maxDrawdown;
  final int winStreak;
  final int lossStreak;

  DashboardModel({
    required this.totalProfit,
    required this.totalLoss,
    required this.winRate,
    required this.portSize,
    required this.riskRewardRatio,
    required this.totalFee,
    required this.totalWin,
    required this.totalTrades,
    required this.maxDrawdown,
    required this.winStreak,
    required this.lossStreak
  });
}