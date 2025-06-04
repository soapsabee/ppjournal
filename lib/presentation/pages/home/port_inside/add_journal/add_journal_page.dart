import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/presentation/widgets/appbar_custom.dart';
import 'package:ppjournal/providers/data_management_provider.dart';

class AddJournalPage extends ConsumerStatefulWidget {
  @override
  _AddJournalPageState createState() => _AddJournalPageState();
}

class _AddJournalPageState extends ConsumerState<AddJournalPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _riskRewardRatioController = TextEditingController();
  final TextEditingController _feeController = TextEditingController();
  final TextEditingController _profitController = TextEditingController();
  final TextEditingController _tradeDateController = TextEditingController();

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
      // Save the journal logic here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Journal saved successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currencyPairs = ref.watch(dataManagementListProvider("Pair"));
    final setups = ref.watch(dataManagementListProvider("Setup"));
    final pois = ref.watch(dataManagementListProvider("POI"));
    final signals = ref.watch(dataManagementListProvider("Signal"));
    final pricePatterns = ref.watch(dataManagementListProvider("Price Pattern"));

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
              //_saveJournal();
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
            _buildDropdownField('Session Time', ['Morning', 'Afternoon', 'Evening']),
            const SizedBox(height: 16.0),
            _buildDropdownField('Pair', currencyPairs.when(
              data: (data) => data.map((pair) => pair.name as String).toList(),
              loading: () => ['Loading...'],
              error: (error, stack) => ['Error loading pairs'],
            )),
            const SizedBox(height: 16.0),
            _buildDropdownField('Setup', setups.when(
              data: (data) => data.map((setup) => setup.name as String).toList(),
              loading: () => ['Loading...'],
              error: (error, stack) => ['Error loading setups'],
            )),
            const SizedBox(height: 16.0),
            _buildDropdownField('POI', pois.when(
              data: (data) => data.map((poi) => poi.name as String).toList(),
              loading: () => ['Loading...'],
              error: (error, stack) => ['Error loading POIs'],
            )),
            const SizedBox(height: 16.0),
            _buildDropdownField('Signal', signals.when(
              data: (data) => data.map((signal) => signal.name as String).toList(),
              loading: () => ['Loading...'],
              error: (error, stack) => ['Error loading signals'],
            )),
            const SizedBox(height: 16.0),
            _buildSectionTitle('Trade Analysis'),
            const SizedBox(height: 8.0),
            _buildDropdownField('Price Pattern', pricePatterns.when(
              data: (data) => data.map((pattern) => pattern.name as String).toList(),
              loading: () => ['Loading...'],
              error: (error, stack) => ['Error loading patterns'],
            )),
            const SizedBox(height: 16.0),
            _buildDropdownField('Time Frame', ['1H', '4H', '1D']),
            const SizedBox(height: 16.0),
            _buildDropdownField('Position', ['Long', 'Short']),
            const SizedBox(height: 16.0),
            _buildDropdownField('Win/Loss', ['Win', 'Loss']),
            const SizedBox(height: 16.0),
            _buildSectionTitle('Trade Metrics'),
            const SizedBox(height: 8.0),
            _buildTextField('RR', _riskRewardRatioController),
            const SizedBox(height: 16.0),
            _buildTextField('Fee', _feeController),
            const SizedBox(height: 16.0),
            _buildTextField('Profit', _profitController),
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
  _buildDropdownField(String label, List<String> items) {
      final List<String> dropdownItems = ['-- N/A --', ...items];

    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      items: dropdownItems.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (String? newValue) {},
    );
  }
  _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
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
}
