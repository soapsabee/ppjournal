import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/data/models/journal_model.dart';
import 'package:ppjournal/presentation/colors/colors.dart';
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
    print("journalAsyncValue: $journalAsyncValue");
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Filter',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {
                // Add filter logic
              },
            ),
          ],
        ),
        Expanded(
          child: journalAsyncValue.when(
            data: (journalList) {
              if (journalList.isEmpty) {
                return Center(child: Text("No journal entries found."));
              }
              return ListView.builder(
                padding: EdgeInsets.all(5.0),
                itemCount: journalList.length,
                itemBuilder: (context, index) {
                  final entry = journalList[index];
                  return _buildJournalCard(entry); // <== move card to a method
                },
              );
            },
            loading: () => Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
          ),
        ),
      ],
    );
  }

  Widget _buildJournalCard(JournalFull entry) {
    print("journal entry: ${entry.journal.id}");
    final date = entry.journal.date;
    String formattedDate = "-";
    if (date != null) {
       formattedDate = "${date.year.toString().padLeft(4, '0')}-"
                     "${date.month.toString().padLeft(2, '0')}-"
                     "${date.day.toString().padLeft(2, '0')}";
    }
    
    return Card(
      color: AppColors.primary,
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Date : ${formattedDate ?? "-"}", style: _style()),
                Text("${entry.journal.session ?? "-"}", style: _style()),
                Text("Pair : ${entry.pair?.name ?? "-"}", style: _style()),
              ],
            ),
            SizedBox(height: 10),
            Divider(color: Colors.grey, height: 1),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Setup : ${entry.setup?.name ?? "-"}", style: _style()),
                Text("POI : ${entry.poi?.name ?? "-"}", style: _style()),
                Text("Price Pattern : ${entry.pricePattern?.name ?? "-"}", style: _style()),
                Text("Win Loss : ${entry.journal.winLose ?? "-"}", style: _style()),
                Text("RR : ${entry.journal.riskRewardRatio ?? "-"}", style: _style()),
                Text("Profit : ${entry.journal.profit ?? "-"}", style: _style()),
                Text("Fee : ${entry.journal.fee}", style: _style()),
              ],
            ),
            SizedBox(height: 10),
            Divider(color: Colors.grey, height: 1),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => {
                    ref.invalidate(journalNoteProvider), // Reset state when view a journal
                    ref.read(journalNoteProvider.notifier).updateId(entry.journal.id),
                    Navigator.pushNamed(
                      context,
                      '/note-journal-page'
                    )
                  },
                  icon: Icon(Icons.note),
                  color: AppColors.onPrimary,
                ),
                IconButton(
                  onPressed: () => {
                    ref.invalidate(journalNoteProvider), // Reset state when adding a new journal
                    ref.read(journalNoteProvider.notifier).updateId(entry.journal.id),
                    Navigator.pushNamed(
                      context,
                      '/add-journal-page'
                    )
                  },
                  icon: Icon(Icons.edit),
                  color: AppColors.onPrimary,
                ),
                Text("TF : ${entry.journal.timeFrame ?? "-"} ", style: _style()),
                Text("Position : ${entry.journal.position ?? "-"}", style: _style()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _style() => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.onPrimary,
  );
}
