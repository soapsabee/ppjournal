import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ppjournal/data/models/dashboard_model.dart';
import 'package:ppjournal/providers/dashboard_provider.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardPage extends ConsumerStatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final dashboardData = ref.watch(dashboardDataProvider);
    final dashboardWidgets = dashboardData.when(
      data:
          (data) => [
            _buildDashboardCard(
              context,
              'Portsize',
              '\$${data.portSize.toStringAsFixed(2)}',
            ),
            _buildDashboardCard(
              context,
              'Profit',
              '\$${data.totalProfit.toStringAsFixed(2)}',
            ),
            _buildDashboardCard(
              context,
              'Balance',
              '\$${data.remainingBalance.toStringAsFixed(2)}',
            ),
            _buildDashboardCard(
              context,
              'Risk / Trade',
              '${data.riskRewardRatio.toStringAsFixed(2)}%',
            ),
            _buildDashboardCard(
              context,
              'Fee',
              '\$${data.totalFee.toStringAsFixed(2)}',
            ),
            _buildDashboardCard(
              context,
              'Total Trades',
              data.totalTrades.toString(),
            ),
            _buildDashboardCard(context, 'Win', data.totalWin.toString()),
            _buildDashboardCard(context, 'Loss', data.totalLoss.toString()),
            _buildDashboardCard(
              context,
              'Winrate',
              '${data.winRate.toStringAsFixed(2)}%',
            ),
            _buildDashboardCard(
              context,
              'Max DrawDown',
              '${data.maxDrawdown.toStringAsFixed(2)}%',
            ),
            _buildDashboardCard(
              context,
              'Win Streak',
              data.winStreak.toString(),
            ),
            _buildDashboardCard(
              context,
              'Loss Streak',
              data.lossStreak.toString(),
            ),
          ],
      loading: () => [const Center(child: CircularProgressIndicator())],
      error: (error, stack) => [Center(child: Text('Error: $error'))],
    );
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '📈 Dashboard',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 20),

                /// Metric Cards Grid
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.4,
                  children: dashboardWidgets,
                ),

                const SizedBox(height: 24),

                Text(
                  '🏆 Top 3 Trade Setups',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 16),
                _buildBarChart(context),
                Row(
                  children: [
                    _buildLegendItem(color: colorScheme.primary, label: 'Win'),
                    const SizedBox(width: 16),
                    _buildLegendItem(color: Colors.redAccent, label: 'Loss'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem({required Color color, required String label}) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildDashboardCard(BuildContext context, String title, String value) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.7),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Theme.of(context).dividerColor.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, color: colorScheme.onSurface),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final topThreeWins = ref.watch(topThreeWinsProvider);
    print(
      topThreeWins.when(
        data: (data) => 'Top Three Wins: ${data.length}',
        loading: () => 'Loading Top Three Wins...',
        error: (error, stack) => 'Error fetching top three wins: $error',
      ),
    );

    return Container(
      height: 220,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHigh.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).dividerColor.withValues(alpha: 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: BarChart(
        BarChartData(
          barGroups: topThreeWins.when(
            data:
                (data) =>
                    data.map((e) {
                      print(
                        'Top Three Win: ${e.name}, Win: ${e.win}, Loss: ${e.loss}, WinRate: ${e.winRate}',
                      );
                      return BarChartGroupData(
                        x: data.indexOf(e),
                        barRods: [
                          BarChartRodData(
                            toY: e.win.toDouble(),
                            color: colorScheme.primary,
                            width: 16,
                          ),
                          BarChartRodData(
                            toY: e.loss.toDouble(),
                            color: Colors.redAccent,
                            width: 16,
                          ),
                        ],
                      );
                    }).toList(),
            loading: () => [],
            error: (error, stack) => [],
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(sideTitles: _bottomTitles),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40, // เผื่อพื้นที่ตัวเลขมากขึ้น
                interval: 10, // ปรับช่วงตัวเลขให้พอดี เช่น ทุก 10 หน่วย
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                    textAlign: TextAlign.left,
                  );
                },
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: true, drawVerticalLine: false),
        ),
      ),
    );
  }

  SideTitles get _bottomTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '';
      switch (value.toInt()) {
        case 0:
          text = 'Setup A';
          break;
        case 1:
          text = 'Setup B';
          break;
        case 2:
          text = 'Setup C';
          break;
      }
      return Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(text, style: TextStyle(fontWeight: FontWeight.w600)),
      );
    },
  );
}
