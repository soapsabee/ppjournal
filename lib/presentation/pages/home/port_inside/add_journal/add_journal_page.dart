import 'package:flutter/material.dart';
import 'package:ppjournal/presentation/widgets/appbar_custom.dart';

class AddJournalPage extends StatefulWidget {
  const AddJournalPage({Key? key}) : super(key: key);

  @override
  _AddJournalPageState createState() => _AddJournalPageState();
}

class _AddJournalPageState extends State<AddJournalPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _tradeDateController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
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
            _buildDropdownField('Pair', ['BTC/USD', 'ETH/USD']),
            const SizedBox(height: 16.0),
            _buildDropdownField('Setup', ['xxxxxx', 'xxxxxxx']),
            const SizedBox(height: 16.0),
            _buildDropdownField('POI', ['xxxxxx', 'xxxxxxx']),
            const SizedBox(height: 16.0),
            _buildDropdownField('Signal', ['xxxxxx', 'xxxxxxx']),
            const SizedBox(height: 16.0),
            _buildSectionTitle('Trade Analysis'),
            const SizedBox(height: 8.0),
            _buildDropdownField('Price Pattern', ['Pattern 1', 'Pattern 2', 'Pattern 3']),
            const SizedBox(height: 16.0),
            _buildDropdownField('Time Frame', ['1H', '4H', '1D']),
            const SizedBox(height: 16.0),
            _buildDropdownField('Position', ['Long', 'Short']),
            const SizedBox(height: 16.0),
            _buildDropdownField('Win/Loss', ['Win', 'Loss']),
            const SizedBox(height: 16.0),
            _buildSectionTitle('Trade Metrics'),
            const SizedBox(height: 8.0),
            _buildTextField('RR', _titleController),
            const SizedBox(height: 16.0),
            _buildTextField('Fee', _descriptionController),
            const SizedBox(height: 16.0),
            _buildTextField('Profit', _descriptionController),
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
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      items: items.map((String item) {
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
