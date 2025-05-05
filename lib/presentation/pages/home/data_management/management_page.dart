import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/presentation/widgets/appbar_custom.dart';
import 'package:ppjournal/providers/data_management_provider.dart';
import 'package:ppjournal/providers/trade_setup_provider.dart';

class ManagementPage extends ConsumerWidget {
  final List<Map<String, dynamic>> _items = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  void _addItems(typeForm, service, WidgetRef ref) {
    if (_nameController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      service.insertData(typeForm, {
        "name": _nameController.text,
        "detail": _descriptionController.text,
        "createdAt": DateTime.now(),
        "updatedAt": DateTime.now(),
      });

      _nameController.clear();
      _descriptionController.clear();
      ref.invalidate(dataManagementListProvider(typeForm));
    }
  }

  void _editItem(
    BuildContext context,
    String? typeForm,
    service,
    Map<String, dynamic> detail,
    WidgetRef ref,
  ) {
    _nameController.text = detail['name'];
    _descriptionController.text = detail['description'];
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Edit Item'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  await service.updateData(typeForm, {
                    'id': detail['id'],
                    'name': _nameController.text,
                    'detail': _descriptionController.text,
                    'createdAt': detail['createdAt'],
                    'updatedAt': DateTime.now(),
                  });

                  _nameController.clear();
                  _descriptionController.clear();
                  Navigator.of(context).pop();
                  ref.invalidate(
                    dataManagementListProvider(typeForm ?? 'defaultType'),
                  );
                },
                child: Text('Save'),
              ),
              TextButton(
                onPressed: () {
                  _nameController.clear();
                  _descriptionController.clear();
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
            ],
          ),
    );
  }

  void _deleteItem(
    BuildContext context,
    String? typeForm,
    int id,
    service,
    WidgetRef ref,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Item'),
          content: Text('Are you sure you want to delete this item?'),
          actions: [
            TextButton(
              onPressed: () {
                service.deleteData(typeForm, id);
                Navigator.of(context).pop();
                ref.invalidate(
                  dataManagementListProvider(typeForm ?? 'defaultType'),
                );
              },
              child: Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataService = ref.watch(dataManagementServiceProvider);
    final String? typeForm =
        ModalRoute.of(context)?.settings.arguments as String?;
    final dataLists = ref.watch(
      dataManagementListProvider(typeForm ?? 'defaultType'),
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: '${typeForm} Management',
        shouldShowLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(labelText: 'Description'),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => _addItems(typeForm, dataService, ref),
                  child: Text('Add'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: dataLists.when(
                data: (data) {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(data[index].name),
                          subtitle: Text(data[index].detail),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed:
                                    () => _editItem(
                                      context,
                                      typeForm,
                                      dataService,
                                      {
                                        'id': data[index].id,
                                        'name': data[index].name,
                                        'description': data[index].detail,
                                        'createdAt': data[index].createdAt,
                                      },
                                      ref,
                                    ),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed:
                                    () => _deleteItem(
                                      context,
                                      typeForm,
                                      data[index].id,
                                      dataService,
                                      ref,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                error: (error, stack) => Center(child: Text('Error')),
                loading: () => Center(child: CircularProgressIndicator()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
