import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/presentation/widgets/appbar_custom.dart';
import 'package:ppjournal/providers/data_management_provider.dart';
import 'package:ppjournal/providers/journal_provider.dart';

class AddJournalPage extends ConsumerStatefulWidget {
  @override
  _AddJournalPageState createState() => _AddJournalPageState();
}

class DataItem {
  final int id;
  final String name;

  DataItem({required this.id, required this.name});

  @override
  String toString() => name; // So it shows nicely in the dropdown

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataItem && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class _AddJournalPageState extends ConsumerState<AddJournalPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _riskRewardRatioController =
      TextEditingController();
  final TextEditingController _feeController = TextEditingController();
  final TextEditingController _profitController = TextEditingController();
  final TextEditingController _tradeDateController = TextEditingController();
  String? selectedSessionTime;
  DataItem? selectedPair;
  DataItem? selectedSetup;
  DataItem? selectedPoi;
  DataItem? selectedSignal;
  DataItem? selectedPricePattern;
  String? selectedTimeFrame;
  String? selectedPosition;
  String? selectedWinLoss;

  @override
  void dispose() {
    _riskRewardRatioController.dispose();
    _feeController.dispose();
    _profitController.dispose();
    _tradeDateController.dispose();
    super.dispose();
  }

  void _saveJournal() {
    if (_formKey.currentState!.validate()) {
      final double rr = double.tryParse(_riskRewardRatioController.text) ?? 0.0;
      final double fee = double.tryParse(_feeController.text) ?? 0.0;
      final double profit = double.tryParse(_profitController.text) ?? 0.0;
      final insert = ref.watch(journalServiceProvider);
      DateTime? getSelectedTradeDate() {
        String text = _tradeDateController.text;
        if (text.isEmpty) return null;

        try {
          return DateTime.parse(text); // Format is yyyy-MM-dd
        } catch (e) {
          return null; // or handle error
        }
      }

      DateTime? tradeDate = getSelectedTradeDate();

      insert.insertJournal(
        JournalCompanion(
          date: drift.Value(tradeDate ?? DateTime.now()),
          session: drift.Value(selectedSessionTime ?? ''),
          pairId: drift.Value(selectedPair?.id ?? 0),
          tradeSetupId: drift.Value(selectedSetup?.id ?? 0),
          poiId: drift.Value(selectedPoi?.id ?? 0),
          signalId: drift.Value(selectedSignal?.id ?? 0),
          pricePatternId: drift.Value(selectedPricePattern?.id ?? 0),
          timeFrame: drift.Value(selectedTimeFrame ?? ''),
          position: drift.Value(selectedPosition ?? ''),
          winLose: drift.Value(selectedWinLoss ?? ''),
          riskRewardRatio: drift.Value(rr),
          fee: drift.Value(fee),
          profit: drift.Value(profit),
          createdAt: drift.Value(DateTime.now()),
          updatedAt: drift.Value(DateTime.now()),
        ),
      );
      print('--- Journal Entry ---');
      print('Date: $tradeDate');
      print('Session: $selectedSessionTime');
      print('Pair: ${selectedPair?.id}');
      print('Setup: ${selectedSetup?.id}');
      print('POI: ${selectedPoi?.id}');
      print('Signal: ${selectedSignal?.id}');
      print('Price Pattern: ${selectedPricePattern?.id}');
      print('Time Frame: $selectedTimeFrame');
      print('Position: $selectedPosition');
      print('Win/Loss: $selectedWinLoss');
      print('RR: $rr');
      print('Fee: $fee');
      print('Profit: $profit');

      // Save the journal logic here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Journal saved successfully!')),
      );

      ref.invalidate(journalListProvider);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currencyPairs = ref.watch(dataManagementListProvider("Pair"));
    final setups = ref.watch(dataManagementListProvider("Setup"));
    final pois = ref.watch(dataManagementListProvider("POI"));
    final signals = ref.watch(dataManagementListProvider("Signal"));
    final pricePatterns = ref.watch(
      dataManagementListProvider("Price Pattern"),
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add Journal',
        shouldShowLeading: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.note_add, color: Colors.white),
            onPressed: () {
              // Implement functionality here
              Navigator.pushNamed(context, '/note-journal-page');
            },
          ),
          IconButton(
            icon: const Icon(Icons.save, color: Colors.white),
            onPressed: () {
              _saveJournal();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16.0),
                _buildSectionTitle('Trade Details'),
                const SizedBox(height: 8.0),
                _buildDateField(),
                const SizedBox(height: 16.0),
                _buildDropdownField(
                  'Session Time',
                  [
                    "00:00 - 03:00",
                    "03:00 - 06:00",
                    "06:00 - 09:00",
                    "09:00 - 12:00",
                    "12:00 - 15:00",
                    "15:00 - 18:00",
                    "18:00 - 21:00",
                    "21:00 - 00:00",
                  ],
                  selectedSessionTime,
                  (value) {
                    setState(() {
                      selectedSessionTime = value;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                _buildDropdownField(
                  'Pair',
                  currencyPairs.when(
                    data:
                        (data) =>
                            data
                                .map(
                                  (pair) =>
                                      DataItem(id: pair.id, name: pair.name),
                                )
                                .toList(),
                    loading: () => ['Loading...'],
                    error: (error, stack) => ['Error loading pairs'],
                  ),
                  selectedPair,
                  (value) {
                    setState(() {
                      selectedPair = value as DataItem?;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                _buildDropdownField(
                  'Setup',
                  setups.when(
                    data:
                        (data) =>
                            data
                                .map(
                                  (setup) =>
                                      DataItem(id: setup.id, name: setup.name),
                                )
                                .toList(),
                    loading: () => ['Loading...'],
                    error: (error, stack) => ['Error loading setups'],
                  ),
                  selectedSetup,
                  (value) {
                    setState(() {
                      selectedSetup = value as DataItem?;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                _buildDropdownField(
                  'POI',
                  pois.when(
                    data:
                        (data) =>
                            data
                                .map(
                                  (poi) => DataItem(id: poi.id, name: poi.name),
                                )
                                .toList(),
                    loading: () => ['Loading...'],
                    error: (error, stack) => ['Error loading POIs'],
                  ),
                  selectedPoi,
                  (value) {
                    setState(() {
                      selectedPoi = value as DataItem?;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                _buildDropdownField(
                  'Signal',
                  signals.when(
                    data:
                        (data) =>
                            data
                                .map(
                                  (signal) => DataItem(
                                    id: signal.id,
                                    name: signal.name,
                                  ),
                                )
                                .toList(),
                    loading: () => ['Loading...'],
                    error: (error, stack) => ['Error loading signals'],
                  ),
                  selectedSignal,
                  (value) {
                    setState(() {
                      selectedSignal = value as DataItem?;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                _buildSectionTitle('Trade Analysis'),
                const SizedBox(height: 8.0),
                _buildDropdownField(
                  'Price Pattern',
                  pricePatterns.when(
                    data:
                        (data) =>
                            data
                                .map(
                                  (pattern) => DataItem(
                                    id: pattern.id,
                                    name: pattern.name,
                                  ),
                                )
                                .toList(),
                    loading: () => ['Loading...'],
                    error: (error, stack) => ['Error loading patterns'],
                  ),
                  selectedPricePattern,
                  (value) {
                    setState(() {
                      selectedPricePattern = value as DataItem?;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                _buildDropdownField(
                  'Time Frame',
                  ['1H', '4H', '1D'],
                  selectedTimeFrame,
                  (value) {
                    setState(() {
                      selectedTimeFrame = value;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                _buildDropdownField(
                  'Position',
                  ['Long', 'Short'],
                  selectedPosition,
                  (value) {
                    setState(() {
                      selectedPosition = value;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                _buildDropdownField(
                  'Win/Loss',
                  ['Win', 'Loss'],
                  selectedWinLoss,
                  (value) {
                    setState(() {
                      selectedWinLoss = value;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                _buildSectionTitle('Trade Metrics'),
                const SizedBox(height: 8.0),
                _buildNumberField('RR', _riskRewardRatioController),
                const SizedBox(height: 16.0),
                _buildNumberField('Fee', _feeController),
                const SizedBox(height: 16.0),
                _buildNumberField('Profit', _profitController),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildDateField() {
    return TextFormField(
      controller: _tradeDateController,
      decoration: const InputDecoration(
        labelText: 'Trade Date',
        border: OutlineInputBorder(),
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null) {
          setState(() {
            _tradeDateController.text = "${pickedDate.toLocal()}".split(' ')[0];
          });
        }
      },
    );
  }

  _buildDropdownField<T>(
    String label,
    List<T> items,
    T? selectedValue,
    void Function(T?)? onChanged,
  ) {
    final List<T> dropdownItems = [...items];

    return DropdownButtonFormField<T>(
      value: selectedValue,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      items:
          dropdownItems.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(item.toString()), // `toString()` should return name
            );
          }).toList(),
      onChanged: onChanged,
    );
  }

  _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  _buildTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }

  _buildNumberField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        final number = num.tryParse(value);
        if (number == null) {
          return 'Please enter a valid number for $label';
        }
        return null;
      },
    );
  }
}
