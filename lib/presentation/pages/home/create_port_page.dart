import 'package:flutter/material.dart';
import '../../widgets/appbar_custom.dart';
class CreatePortPage extends StatefulWidget {
  @override
  _CreatePortPageState createState() => _CreatePortPageState();
}

class _CreatePortPageState extends State<CreatePortPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _portNameController = TextEditingController();
  final TextEditingController _portSizeController = TextEditingController();
  final TextEditingController _riskPerTradeController = TextEditingController();

  @override
  void dispose() {
    _portNameController.dispose();
    _portSizeController.dispose();
    _riskPerTradeController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission logic here
      final portName = _portNameController.text;
      final portSize = _portSizeController.text;
      final riskPerTrade = _riskPerTradeController.text;

      print('Port Name: $portName');
      print('Port Size: $portSize');
      print('Risk per Trade: $riskPerTrade');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Create Port" , shouldShowLeading: true),
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
                  onPressed: _onSubmit,
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