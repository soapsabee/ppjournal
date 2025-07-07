import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ppjournal/data/models/journal_model.dart';
import 'package:ppjournal/providers/journal_provider.dart';

class JournalPage extends ConsumerStatefulWidget {
  @override
  _JournalPageState createState() => _JournalPageState();
}

class _JournalPageState extends ConsumerState<JournalPage> {
  final List<Map<String, String>> journalEntries = [
    {
      "Date": "2023-10-01",
      "Session": "Morning",
      "Pair": "EUR/USD",
      "Setup": "Breakout",
      "POI": "1.1000",
      "Signal": "Bullish",
      "Price Pattern": "Ascending Triangle",
      "TimeFrame": "1H",
      "Position": "Long",
    },
    {
      "Date": "2023-10-02",
      "Session": "Afternoon",
      "Pair": "GBP/USD",
      "Setup": "Reversal",
      "POI": "1.2500",
      "Signal": "Bearish",
      "Price Pattern": "Head and Shoulders",
      "TimeFrame": "4H",
      "Position": "Short",
    },
    {
      "Date": "2023-10-03",
      "Session": "Evening",
      "Pair": "USD/JPY",
      "Setup": "Pullback",
      "POI": "110.50",
      "Signal": "Bullish",
      "Price Pattern": "Flag",
      "TimeFrame": "1D",
      "Position": "Long",
    },
    {
      "Date": "2023-10-03",
      "Session": "Evening",
      "Pair": "USD/JPY",
      "Setup": "Pullback",
      "POI": "110.50",
      "Signal": "Bullish",
      "Price Pattern": "Flag",
      "TimeFrame": "1D",
      "Position": "Long",
    },
    {
      "Date": "2023-10-03",
      "Session": "Evening",
      "Pair": "USD/JPY",
      "Setup": "Pullback",
      "POI": "110.50",
      "Signal": "Bullish",
      "Price Pattern": "Flag",
      "TimeFrame": "1D",
      "Position": "Long",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final journalAsyncValue = ref.watch(journalListProvider);

    return Scaffold(
      body: journalAsyncValue.when(
        data: (journalList) {
          if (journalList.isEmpty) {
            return Center(child: Text("No journal entries found."));
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            itemCount: journalList.length,
            itemBuilder: (context, index) {
              final entry = journalList[index];
              return _buildJournalCard(context, entry);
            },
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildJournalCard(BuildContext context, JournalFull entry) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final journal = entry.journal;
    final formattedDate =
        journal.date != null
            ? "${journal.date!.year.toString().padLeft(4, '0')}-${journal.date!.month.toString().padLeft(2, '0')}-${journal.date!.day.toString().padLeft(2, '0')}"
            : "-";

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("📅 Date: $formattedDate", style: _style(theme)),
        Text("📊 Pair: ${entry.pair?.name ?? '-'}", style: _style(theme)),
        Text("🧪 Setup: ${entry.setup?.name ?? '-'}", style: _style(theme)),
        Text("🎯 POI: ${entry.poi?.name ?? '-'}", style: _style(theme)),
        Text(
          "💰 Profit: ${journal.profit ?? '-'} | Fee: ${journal.fee ?? '-'}",
          style: _style(theme),
        ),
        Text(
          "📉 RR: ${journal.riskRewardRatio ?? '-'} | Win/Loss: ${journal.winLose ?? '-'}",
          style: _style(theme),
        ),
        Text(
          "⏱️ TF: ${journal.timeFrame ?? '-'} | Position: ${journal.position ?? '-'}",
          style: _style(theme),
        ),
      ],
    );

    return Stack(
      children: [
        Card(
          color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.7),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: Theme.of(context).dividerColor.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                content,
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.note,
                        color:colorScheme.primary,
                      ),
                      onPressed: () {
                        ref.invalidate(journalNoteProvider);
                        ref
                            .read(journalNoteProvider.notifier)
                            .updateId(journal.id);
                        Navigator.pushNamed(context, '/view-note-journal-page');
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: colorScheme.secondary,
                      ),
                      onPressed: () {
                        ref.invalidate(journalNoteProvider);
                        ref
                            .read(journalNoteProvider.notifier)
                            .updateId(journal.id);
                        Navigator.pushNamed(context, '/add-journal-page');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        /// 🔥 ปุ่ม Delete มุมขวาบน
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            icon: Icon(Icons.delete, color: Colors.redAccent, size: 22),
            onPressed: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder:
                    (ctx) => AlertDialog(
                      title: Text('Confirm Delete'),
                      content: Text(
                        'Do you really want to delete this journal?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx, false),
                          child: Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(ctx, true),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: Text('Delete'),
                        ),
                      ],
                    ),
              );

              if (confirmed == true) {
                // ลบจริง
                ref.read(journalServiceProvider)
                    .deleteJournal(journal.id)
                    .then((result) {
                  if (result > 0) {
                    // ลบสำเร็จ
                    ref.invalidate(journalListProvider);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Journal deleted successfully.'),
                      ),
                    );
                  } else {
                    // ลบไม่สำเร็จ
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Failed to delete journal.'),
                      ),
                    );
                  }
                });
                print('Confirmed delete: ${journal.id}');
              }
            },
            tooltip: 'Delete',
          ),
        ),
      ],
    );
  }

  TextStyle _style(ThemeData theme) => TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: theme.colorScheme.onSurface,
  );
}
