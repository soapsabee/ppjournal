import 'package:flutter/material.dart';
import 'package:ppjournal/presentation/colors/colors.dart';

class JournalPage extends StatelessWidget {
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
                // Add your action here
              },
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(5.0),
            itemCount: journalEntries.length,
            itemBuilder: (context, index) {
              final entry = journalEntries[index];
              return Card(
                color: AppColors.primary,
                margin: EdgeInsets.all(8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),

                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Date : ${entry['Date']}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.onPrimary,
                            ),
                          ),
                          Text(
                            "${entry['Session']}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.onPrimary,
                            ),
                          ),
                          Text(
                            "Pair : ${entry['Pair']}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.onPrimary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(color: Colors.grey, height: 1),
                      SizedBox(height: 10),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5,
                        children: [
                          Text(
                            "Setup : ${entry['Setup']}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.onPrimary,
                            ),
                          ),
                          Text(
                            "POI : ${entry['POI']}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.onPrimary,
                            ),
                          ),
                          Text(
                            "Price Pattern : ${entry['Price Pattern']}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.onPrimary,
                            ),
                          ),
                          Text(
                            "Win Loss : Win",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.onPrimary,
                            ),
                          ),
                            Text(
                            "RR : 1.2",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.onPrimary,
                            ),
                          ),
                          Text(
                            "Profit : 1,000",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.onPrimary,
                            ),
                          ),
                           Text(
                            "Fee : 100",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.onPrimary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(color: Colors.grey, height: 1),
                      SizedBox(height: 10),
                      Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(onPressed: () => {}, icon: Icon(Icons.note), color: AppColors.onPrimary,),
                          IconButton(onPressed: () => {}, icon: Icon(Icons.edit),color: AppColors.onPrimary,),
                          Text(
                            "TF : ${entry['TimeFrame']}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.onPrimary,
                            ),
                          ),
                          Text(
                            "Position : ${entry['Position']}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.onPrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
