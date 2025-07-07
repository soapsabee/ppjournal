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
                  children: dashboardWidgets
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
              ],
            ),
          ),
        ),
      ),
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
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(toY: 10, color: colorScheme.primary, width: 16),
                BarChartRodData(toY: 5, color: Colors.redAccent, width: 16),
              ],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(toY: 20, color: colorScheme.primary, width: 16),
                BarChartRodData(toY: 5, color: Colors.redAccent, width: 16),
              ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(toY: 30, color: colorScheme.primary, width: 16),
                BarChartRodData(toY: 5, color: Colors.redAccent, width: 16),
              ],
            ),
          ],
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(sideTitles: _bottomTitles),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
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
