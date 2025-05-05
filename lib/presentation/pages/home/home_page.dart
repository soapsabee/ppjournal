import 'package:flutter/material.dart';
import 'package:ppjournal/presentation/colors/colors.dart';
import '../../widgets/appbar_custom.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: "Home",
        actions: [
          PopupMenuButton(
            iconColor: AppColors.onPrimary,
            itemBuilder:
                (context) => [
                   PopupMenuItem(
                    value: 'pair',
                    child: Text(
                      'Pair',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'setup',
                    child: Text(
                      'Setups',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'poi',
                    child: Text(
                      "POI",
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'signal',
                    child: Text(
                      "Signals",
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'price-pattern',
                    child: Text(
                      "Price Patterns",
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ],
            onSelected: (value) {
                final routes = {
                'pair': "Pair",
                'setup': "Setup",
                'poi': "POI",
                'signal': "Signal",
                'price-pattern': "Price Pattern",
                };

                if (routes.containsKey(value)) {
                Navigator.pushNamed(context, '/management-page', arguments: routes[value]);
                }
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            buildRankingCard(context),
            const Divider(
              height: 15,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Colors.black,
            ),
            SizedBox(height: 20),
            Text(
              'Your Port Selection',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.onBackground,
              ),
            ),
            SizedBox(height: 20),
            buildPortCardList(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create-port-page');
        },
        backgroundColor: AppColors.secondary,
        foregroundColor: AppColors.onSecondary,
        tooltip: 'Add Port',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildRankingCard(BuildContext context) {
    return Card(
      color: AppColors.primaryVariant,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Port Ranking',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.onPrimary,
              ),
            ),
            SizedBox(height: 10),
            // Add your ranking list or content here
            Text(
              '1. Port A   Profit: 1000',
              style: TextStyle(color: Color.fromRGBO(255, 255, 250, 1)),
            ),
            Text(
              '2. Port B   Profit: 800',
              style: TextStyle(color: Color.fromRGBO(255, 255, 250, 1)),
            ),
            Text(
              '3. Port C   Profit: 600',
              style: TextStyle(color: Color.fromRGBO(255, 255, 250, 1)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPortCardList(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Wrap(
        children: [
          buildPortCard(context, 'Port A'),
          buildPortCard(context, 'Port Bxxxxxxxxxxx'),
          buildPortCard(context, 'Port C'),
          buildPortCard(context, 'Port D'),
          buildPortCard(context, 'Port Exxxxxxxxxxxxxxxxxxxxxx'),
        ],
      ),
    );
  }

  Widget buildPortCard(BuildContext context, String portName) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/port-inside-page'),
      child: Card(
        elevation: 4,
        color: AppColors.secondaryVariant,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(
                Icons.account_balance_wallet,
                size: 50,
                color: AppColors.onPrimary,
              ), // Placeholder icon
              SizedBox(height: 10),
              Text(
                portName,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
