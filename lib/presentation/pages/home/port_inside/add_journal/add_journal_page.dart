import 'dart:io';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/presentation/widgets/appbar_custom.dart';
import 'package:ppjournal/providers/data_management_provider.dart';
import 'package:ppjournal/providers/journal_provider.dart';
import 'package:ppjournal/states/journal_note_state.dart';

class AddJournalPage extends ConsumerStatefulWidget {
  @override
  _AddJournalPageState createState() => _AddJournalPageState();
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
  bool _isInitialized = false;
  int? _noteId;

  @override
  void dispose() {
    _riskRewardRatioController.dispose();
    _feeController.dispose();
    _profitController.dispose();
    _tradeDateController.dispose();
    super.dispose();
  }

  Future<void> _saveJournal(int? journalId) async {
    if (_formKey.currentState!.validate()) {
      final state = ref.watch(journalNoteProvider);
      // final double rr = double.tryParse(_riskRewardRatioController.text) ?? 0.0;
      // final double fee = double.tryParse(_feeController.text) ?? 0.0;
      // final double profit = double.tryParse(_profitController.text) ?? 0.0;
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

      // final beforePictureBytes =
      //     state.beforeImage != null
      //         ? await File(state.beforeImage!.path).readAsBytes()
      //         : null;
      // final afterPictureBytes =
      //     state.afterImage != null
      //         ? await File(state.afterImage!.path).readAsBytes()
      //         : null;
      if (journalId != null) {
        // Update existing journal entry
        print('Updating journal with ID: $journalId');

        final update = await ref.read(journalUpdateProvider.future);
        if (!update) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to update journal')),
          );
          return;
        }
        ref.invalidate(journalByIdProvider(journalId));
      } else {
        // Insert new journal entry
        final insert = await ref.read(journalInsertProvider.future);
        if (insert == 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to save journal')),
          );
          return;
        }
      }

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
    final state = ref.watch(journalNoteProvider);
    final notifier = ref.watch(journalNoteProvider.notifier);

    final int? journalId = state.id;

    if (journalId != null) {
      // Load existing journal data if editing
      final journal = ref.watch(journalByIdProvider(journalId));
      print("journalId: $journalId");
      journal.when(
        data: (data) {
          if (data != null && !_isInitialized) {
            print("data1: ${data.journal.date}");

            // _tradeDateController.text =
            //     data.journal.date.toIso8601String().split('T')[0];
            // notifier.updateDate(data.journal.date);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              notifier.updateDate(data.journal.date);
              notifier.updateSessionTime(data.journal.session);
              notifier.updateCurrencyPair(
                DataItem(id: data.pair?.id ?? 0, name: data.pair?.name ?? ''),
              );
              notifier.updateSetup(
                DataItem(id: data.setup?.id ?? 0, name: data.setup?.name ?? ''),
              );
              notifier.updatePoi(
                DataItem(id: data.poi?.id ?? 0, name: data.poi?.name ?? ''),
              );
              notifier.updateSignal(
                DataItem(
                  id: data.signal?.id ?? 0,
                  name: data.signal?.name ?? '',
                ),
              );
              notifier.updatePricePattern(
                DataItem(
                  id: data.pricePattern?.id ?? 0,
                  name: data.pricePattern?.name ?? '',
                ),
              );
              notifier.updateTimeFrame(data.journal.timeFrame);
              notifier.updatePosition(data.journal.position);
              notifier.updateWinLose(data.journal.winLose);
              notifier.updateRR(data.journal.riskRewardRatio);
              notifier.updateFee(data.journal.fee);
              notifier.updateProfit(data.journal.profit);
              notifier.updateSetup(
                DataItem(id: data.setup?.id ?? 0, name: data.setup?.name ?? ''),
              );
              notifier.updatePoi(
                DataItem(id: data.poi?.id ?? 0, name: data.poi?.name ?? ''),
              );
              notifier.updateSignal(
                DataItem(
                  id: data.signal?.id ?? 0,
                  name: data.signal?.name ?? '',
                ),
              );
              notifier.updatePricePattern(
                DataItem(
                  id: data.pricePattern?.id ?? 0,
                  name: data.pricePattern?.name ?? '',
                ),
              );
            });
            // selectedSessionTime = data.journal.session;
            // selectedPair = DataItem(id: data.pair.id, name: data.pair.name);
            // selectedSetup = DataItem(id: data.setup.id, name: data.setup.name);
            // selectedPoi = DataItem(id: data.poi.id, name: data.poi.name);
            // selectedSignal = DataItem(
            //   id: data.signal.id,
            //   name: data.signal.name,
            // );
            // selectedPricePattern = DataItem(
            //   id: data.pricePattern.id,
            //   name: data.pricePattern.name,
            // );
            // selectedTimeFrame = data.journal.timeFrame;
            // selectedPosition = data.journal.position;
            // selectedWinLoss = data.journal.winLose;
            // _riskRewardRatioController.text =
            //     data.journal.riskRewardRatio.toString();
            // _feeController.text = data.journal.fee.toString();
            // _profitController.text = data.journal.profit.toString();
            // _noteId = data.journal.noteId;
            _isInitialized = true; // ✅ Only run once
          }
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error loading journal')),
      );
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add Journal',
        shouldShowLeading: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.note_add, color: Colors.white),
            onPressed: () {
              // Implement functionality here
              Navigator.pushNamed(
                context,
                '/note-journal-page',
                arguments: journalId,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.save, color: Colors.white),
            onPressed: () {
              _saveJournal(journalId);
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
                _buildDateField(
                  "Trade Date",
                  _tradeDateController,
                  state.date,
                  (date) {
                    notifier.updateDate(date);
                  },
                ),
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
                  state.sessionTime,
                  (value) {
                    notifier.updateSessionTime(value as String);
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
                  state.currencyPair,
                  (value) {
                    notifier.updateCurrencyPair(value as DataItem);
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
                  state.setup,
                  (value) {
                    notifier.updateSetup(value as DataItem?);
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
                  state.poi,
                  (value) {
                    notifier.updatePoi(value as DataItem?);
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
                  state.signal,
                  (value) {
                    notifier.updateSignal(value as DataItem?);
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
                  state.pricePattern,
                  (value) {
                    notifier.updatePricePattern(value as DataItem?);
                  },
                ),
                const SizedBox(height: 16.0),
                _buildDropdownField(
                  'Time Frame',
                  ['1H', '4H', '1D'],
                  state.timeFrame,
                  (value) {
                    notifier.updateTimeFrame(value as String);
                  },
                ),
                const SizedBox(height: 16.0),
                _buildDropdownField(
                  'Position',
                  ['Long', 'Short'],
                  state.position,
                  (value) {
                    notifier.updatePosition(value as String);
                  },
                ),
                const SizedBox(height: 16.0),
                _buildDropdownField(
                  'Win/Loss',
                  ['Win', 'Loss'],
                  state.winLose,
                  (value) {
                    notifier.updateWinLose(value as String);
                  },
                ),
                const SizedBox(height: 16.0),
                _buildSectionTitle('Trade Metrics'),
                const SizedBox(height: 8.0),
                _buildNumberField('RR', _riskRewardRatioController, state.rr, (
                  value,
                ) {
                  notifier.updateRR(value);
                }),
                const SizedBox(height: 16.0),
                _buildNumberField('Fee', _feeController, state.fee, (value) {
                  notifier.updateFee(value);
                }),
                const SizedBox(height: 16.0),
                _buildNumberField('Profit', _profitController, state.profit, (
                  value,
                ) {
                  notifier.updateProfit(value);
                }),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildDateField<T>(
    String label,
    TextEditingController controller,
    DateTime? value,
    void Function(DateTime? date) onDateSelected,
  ) {
    print("value: $value");
    controller.text = value != null ? "${value?.toLocal()}".split(' ')[0] : '';
    return TextFormField(
      controller: controller,
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
          onDateSelected(pickedDate);
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
    final T? validatedValue =
        dropdownItems.contains(selectedValue) ? selectedValue : null;

    return DropdownButtonFormField<T>(
      value: validatedValue,
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

  _buildNumberField<T>(
    String label,
    TextEditingController controller,
    T? selectedValue,
    void Function(double? value)? onChanged,
  ) {
    controller.text = selectedValue?.toString() ?? '';
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
      onChanged: (value) {
        if (onChanged != null) {
          final double? number = double.tryParse(value);
          onChanged(number);
        }
      },
    );
  }
}
