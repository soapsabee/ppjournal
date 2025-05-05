import 'package:flutter/material.dart';
import 'package:ppjournal/presentation/colors/colors.dart';
import '../../../widgets/appbar_custom.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dashboard',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildDashboardCard('Portsize', '\$10,000'),
                  _buildDashboardCard('Profit', '\$2,000'),
                  _buildDashboardCard('Risk Per Trade', '2%'),
                  _buildDashboardCard('Fee', '\$50'),
                  _buildDashboardCard('Total Trades', '150'),
                  _buildDashboardCard('Win', '90'),
                  _buildDashboardCard('Loss', '60'),
                  _buildDashboardCard('Winrate', '60%'),
                  _buildDashboardCard('Max DrawDown', '15%'),
                  _buildDashboardCard('Win Streak', '10'),
                  _buildDashboardCard('Loss Streak', '5'),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Top 3 Trade Setups',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildBarChart(),
            ],
          ),
        ),
      );
  }

  Widget _buildDashboardCard(String title, String value) {
    return Card(
      color: AppColors.secondaryVariant,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(color: AppColors.onSecondary, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                color: AppColors.onSecondary,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart() {
    return Container(
      height: 200,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(toY: 10, color: AppColors.primary),
                BarChartRodData(toY: 5, color: Colors.red),
              ],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(toY: 20, color: AppColors.primary),
                BarChartRodData(toY: 5, color: Colors.red),
                ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(toY: 30, color: AppColors.primary),
                BarChartRodData(toY: 5, color: Colors.red),
              ],
            )
          ],
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(sideTitles: _leftTitles),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
        
      ),
    )
    );
  }

  SideTitles get _leftTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '';
      switch (value.toInt()) {
        case 0:
          text = 'xxxxxxx';
          break;
        case 1:
          text = 'xxxxxxx';
          break;
        case 2:
          text = 'xxxxxxx';
          break;
      }

      return Text(text);
    },
  );

}
