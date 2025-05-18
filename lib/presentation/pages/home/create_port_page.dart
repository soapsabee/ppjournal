import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/providers/port_provider.dart';
import '../../widgets/appbar_custom.dart';

class CreatePortPage extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _portNameController = TextEditingController();
  final TextEditingController _portSizeController = TextEditingController();
  final TextEditingController _riskPerTradeController = TextEditingController();

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
      print('Port Name: $portName');
      print('Port Size: $portSize');
      print('Risk per Trade: $riskPerTrade');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                decoration: InputDecoration(labelText: 'Port Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a port name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _portSizeController,
                decoration: InputDecoration(labelText: 'Port Size'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a port size';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _riskPerTradeController,
                decoration: InputDecoration(labelText: 'Risk per Trade (%)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the risk per trade';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              Text("Cost Per Trade (Port Size * Risk per Trade)"),
              Text("= 0.0"),
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
}
