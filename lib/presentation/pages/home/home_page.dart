import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/presentation/colors/colors.dart';
import 'package:ppjournal/providers/dashboard_provider.dart';
import 'package:ppjournal/providers/journal_provider.dart';
import 'package:ppjournal/providers/port_provider.dart';
import '../../widgets/appbar_custom.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final portList = ref.watch(portListProvider);
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: CustomAppBar(
        title: "Home",
        actions: [
          PopupMenuButton(
            iconColor: colorScheme.primary,
            itemBuilder:
                (context) => [
                  PopupMenuItem(
                    value: 'pair',
                    child: Text(
                      'Pair',
                      style: TextStyle(color: colorScheme.primary),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'setup',
                    child: Text(
                      'Setups',
                      style: TextStyle(color: colorScheme.primary),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'poi',
                    child: Text(
                      "POI",
                      style: TextStyle(color: colorScheme.primary),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'signal',
                    child: Text(
                      "Signals",
                      style: TextStyle(color: colorScheme.primary),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'price-pattern',
                    child: Text(
                      "Price Patterns",
                      style: TextStyle(color: colorScheme.primary),
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
                Navigator.pushNamed(
                  context,
                  '/management-page',
                  arguments: routes[value],
                );
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
                color: colorScheme.primary,
              ),
            ),
            SizedBox(height: 20),
            portList.when(
              data: (ports) => buildPortCardList(context, ports.cast()),
              loading: () => CircularProgressIndicator(),
              error: (err, stack) => Text('Error: $err'),
            ),
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final topThreePortProit = ref.read(topThreePortProfitsProvider);
    return Card(
      color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.7),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '📊 Port Ranking',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
            SizedBox(height: 16),
            topThreePortProit.when(
              data:
                  (ports) => Column(
                    children: List.generate(3, (index) {
                      final port = index < ports.length ? ports[index] : null;
                      final portName = port?.portName ?? '-';
                      final profit = port?.profit.toInt() ?? 0;
                      return buildRankingRow(index + 1, portName, profit);
                    }),
                  ),
              loading: () => Center(child: CircularProgressIndicator()),
              error: (err, stack) => Text('Error: $err'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRankingRow(int rank, String name, int profit) {
    Icon? rankIcon;
    switch (rank) {
      case 1:
        rankIcon = Icon(Icons.emoji_events, color: Colors.amber, size: 20);
        break;
      case 2:
        rankIcon = Icon(Icons.emoji_events, color: Colors.grey, size: 20);
        break;
      case 3:
        rankIcon = Icon(Icons.emoji_events, color: Colors.brown, size: 20);
        break;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if (rankIcon != null) rankIcon,
            SizedBox(width: 8),
            Text(
              '$rank. $name',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.onPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Text(
          '฿$profit',
          style: TextStyle(
            fontSize: 16,
            color: Colors.greenAccent[100],
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildPortCardList(BuildContext context, List<PortData> portList) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    if (portList.isEmpty) {
      return Center(
        child: Text(
          'No ports available',
          style: TextStyle(fontSize: 16, color: colorScheme.onSurface),
        ),
      );
    }
    return Container(
      padding: EdgeInsets.all(16),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          for (PortData port in portList) buildPortCard(context, port),
        ],
      ),
    );
  }

  Future<void> _deletePort(BuildContext context, int portId) async {
    final portRepository = ref.read(portServiceProvider);
    await portRepository.deletePort(portId);
    ref.invalidate(portListProvider);
  }

  Widget buildPortCard(BuildContext context, PortData port) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final notifier = ref.watch(journalNoteProvider.notifier);
    return GestureDetector(
      onTap: () {
        notifier.updatePortId(port.id);
        // Navigate to the port inside page
        Navigator.pushNamed(context, '/port-inside-page');
      },
      child: Card(
        elevation: 4,
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          width: 160,
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.account_balance_wallet,
                    size: 36,
                    color: AppColors.onPrimary,
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      // Add your delete logic here
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: Text('Confirm Delete'),
                              content: Text(
                                'Are you sure you want to delete "${port.name}"?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () async {
                                    Navigator.of(context).pop();
                                    await _deletePort(context, port.id);
                                  },
                                  child: Text(
                                    'Delete',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('Cancel'),
                                ),
                              ],
                            ),
                      );
                      print('Delete ${port.name}');
                    },
                    child: Icon(
                      Icons.delete_outline,
                      size: 20,
                      color: Colors.red[300],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                port.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.onPrimary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
