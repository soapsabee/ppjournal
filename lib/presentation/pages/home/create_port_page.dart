import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/providers/port_provider.dart';
import '../../widgets/appbar_custom.dart';

class CreatePortPage extends ConsumerStatefulWidget {
  @override
  _CreatePortPageState createState() => _CreatePortPageState();
}

class _CreatePortPageState extends ConsumerState<CreatePortPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _portNameController = TextEditingController();
  final TextEditingController _portSizeController = TextEditingController();
  final TextEditingController _riskPerTradeController = TextEditingController();
  double costPerTrade = 0;

  @override
  void initState() {
    super.initState();
   costPerTrade = 0;
  }
  
  void _onSubmit(BuildContext context, WidgetRef ref) {
    if (_formKey.currentState!.validate()) {
      // Handle form submission logic here

      final service = ref.watch(portServiceProvider);
      final portName = _portNameController.text;
      final portSize = _portSizeController.text;
      final riskPerTrade = _riskPerTradeController.text;

      service
          .insertPort(
            PortCompanion(
              name: drift.Value(portName),
              portSize: drift.Value(
                portSize.isNotEmpty ? double.tryParse(portSize) ?? 0.0 : 0.0,
              ),
              riskPerTrade: drift.Value(double.tryParse(riskPerTrade) ?? 0.0),
              costPerTrade: drift.Value(
                (double.tryParse(portSize) ?? 0.0) *
                    (double.tryParse(riskPerTrade) ?? 0.0) /
                    100,
              ),
              createdAt: drift.Value(DateTime.now()),
              updatedAt: drift.Value(DateTime.now()),
            ),
          )
          .then((_) {
            // Success: show a snackbar and maybe pop the page
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Portfolio created successfully!')),
            );
            ref.invalidate(portListProvider);
            Navigator.of(context).pop();
          })
          .catchError((error) {
            // Error: show a snackbar with the error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to create portfolio: $error')),
            );
          });
    }
  }

 void calculatedCostPerTrade() {
  final portSizeText = _portSizeController.text.trim();
  final riskPerTradeText = _riskPerTradeController.text.trim();

  final portSize = double.tryParse(portSizeText);
  final riskPerTrade = double.tryParse(riskPerTradeText);

  if (portSize != null && riskPerTrade != null) {
    setState(() {
    costPerTrade = portSize * riskPerTrade;      
    });
  } else {
    setState(() {
          costPerTrade = 0; // หรือ null ถ้าคุณใช้ nullable type      
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Create Port", shouldShowLeading: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _portNameController,
                decoration: InputDecoration(
                  labelText: 'Port Name',
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a port name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              _buildNumberField("Port Size", _portSizeController),
              SizedBox(height: 16),
              _buildNumberField("Risk per Trade (%)", _riskPerTradeController),
              SizedBox(height: 32),
              Text("Cost Per Trade (Port Size * Risk per Trade)"),
              Text("= ${costPerTrade}"),
              SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () => _onSubmit(context, ref),
                  child: Text('Create Port'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildNumberField<T>(String label, TextEditingController controller) {
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
      onChanged: (_) => calculatedCostPerTrade(),
    );
  }
}
