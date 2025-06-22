import 'dart:io';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/presentation/widgets/appbar_custom.dart';
import 'package:ppjournal/providers/note_provider.dart';

class NoteJournalPage extends ConsumerStatefulWidget {
  @override
  _NoteJournalPageState createState() => _NoteJournalPageState();
}

class _NoteJournalPageState extends ConsumerState<NoteJournalPage> {
  final TextEditingController _noteController = TextEditingController();
  XFile? _beforeImage;
  XFile? _afterImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(bool isBefore) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (isBefore) {
          _beforeImage = pickedFile;
        } else {
          _afterImage = pickedFile;
        }
      });
    }
  }

  Future<void> _insertNote(int? journalId , int? noteId) async {
    // Implement the logic to insert the note into the database
    // This is where you would typically call your service or repository
    // to save the note along with the images.
    String noteText = _noteController.text;
    if (noteText.isEmpty && _beforeImage == null && _afterImage == null) {
      // Show a message or handle the case where no data is provided
      return;
    }

    drift.Uint8List? beforeBytes;
    drift.Uint8List? afterBytes;
    if (_beforeImage != null) {
      beforeBytes = await File(_beforeImage!.path).readAsBytes();
    }
    if (_afterImage != null) {
      afterBytes = await File(_afterImage!.path).readAsBytes();
    }

    final insert = ref.watch(noteServiceProvider);
    insert.insertNote(
      NoteCompanion(
        detail: drift.Value(noteText),
        beforePicture: drift.Value(beforeBytes),
        afterPicture: drift.Value(afterBytes),
        createdAt: drift.Value(DateTime.now()),
        updatedAt: drift.Value(DateTime.now()),
      ), journalId
    );
  }

  @override
  Widget build(BuildContext context) {
    final int? journalId = ModalRoute.of(context)?.settings.arguments as int?;
    if (journalId != null) {
      final note = ref.watch(noteByIdProvider(journalId));

    }
    return Scaffold(
      appBar: CustomAppBar(
        title: "Note",
        shouldShowLeading: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.save, color: Colors.white),
            onPressed: () {
              // Implement functionality here
              // Navigator.pop(context);
              _insertNote(journalId);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _noteController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Write your note',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text('Before Image:'),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => _pickImage(true),
              child:
                  _beforeImage == null
                      ? Container(
                        height: 150,
                        width: double.infinity,
                        color: Colors.grey[300],
                        child: Icon(Icons.add_a_photo, size: 50),
                      )
                      : Image.file(
                        File(_beforeImage!.path),
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
            ),
            SizedBox(height: 20),
            Text('After Image:'),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => _pickImage(false),
              child:
                  _afterImage == null
                      ? Container(
                        height: 150,
                        width: double.infinity,
                        color: Colors.grey[300],
                        child: Icon(Icons.add_a_photo, size: 50),
                      )
                      : Image.file(
                        File(_afterImage!.path),
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
