import 'dart:io';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/presentation/widgets/appbar_custom.dart';
import 'package:ppjournal/providers/journal_provider.dart';
import 'package:ppjournal/providers/note_provider.dart';
import 'package:ppjournal/states/journal_note_state.dart';

class NoteJournalPage extends ConsumerStatefulWidget {
  @override
  _NoteJournalPageState createState() => _NoteJournalPageState();
}

class _NoteJournalPageState extends ConsumerState<NoteJournalPage> {
  final TextEditingController _noteController = TextEditingController();
  XFile? _beforeImage;
  XFile? _afterImage;
  final ImagePicker _picker = ImagePicker();
  bool _isInitialized = false;
  Future<void> _pickImage(bool isBefore, JournalNoteNotifier notifier) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (isBefore) {
          // _beforeImage = pickedFile;
          notifier.updateBeforeImage(pickedFile);
        } else {
          // _afterImage = pickedFile;
          notifier.updateAfterImage(pickedFile);
        }
      });
    }
  }

  Future<void> _insertNote(int? journalId, JournalNoteState state) async {
    // Implement the logic to insert the note into the database
    // This is where you would typically call your service or repository
    // to save the note along with the images.
    String noteText = _noteController.text;

    drift.Uint8List? beforeBytes;
    drift.Uint8List? afterBytes;
    if (state.beforeImage != null) {
      beforeBytes = await File(state.beforeImage!.path).readAsBytes();
    }
    if (state.afterImage != null) {
      afterBytes = await File(state.afterImage!.path).readAsBytes();
    }

    if (journalId == null) {
      final insert = ref.read(journalInsertProvider);
      print("insert: $insert");
    } else {
      final update = ref.watch(journalServiceProvider);
      final result = await update.updateJournal(
        journalId,
        JournalCompanion(
          noteDetail: drift.Value(noteText),
          beforePicture: drift.Value(beforeBytes),
          afterPicture: drift.Value(afterBytes),
          updatedAt: drift.Value(DateTime.now()),
        ),
      );
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Journal saved successfully!')),
    );
    ref.invalidate(journalListProvider);

    // if (noteId == null) {
    //   final insert = ref.watch(noteServiceProvider);
    //   final result = await insert.insertNote(
    //     NoteCompanion(
    //       detail: drift.Value(noteText),
    //       beforePicture: drift.Value(beforeBytes),
    //       afterPicture: drift.Value(afterBytes),
    //       createdAt: drift.Value(DateTime.now()),
    //       updatedAt: drift.Value(DateTime.now()),
    //     ),
    //     journalId,
    //   );
    //   ref.invalidate(noteByIdProvider(result));
    //   return;
    // }

    // final update = ref.watch(noteServiceProvider);
    // update.updateNote(
    //   NoteData(
    //     id: noteId,
    //     detail: noteText,
    //     beforePicture: beforeBytes,
    //     afterPicture: afterBytes,
    //     createdAt: _createdAt ?? DateTime.now(),
    //     updatedAt: DateTime.now(),
    //   ),
    // );
    // ref.invalidate(noteByIdProvider(noteId));
  }

  @override
  Widget build(BuildContext context) {
    final int? journalId = ModalRoute.of(context)?.settings.arguments as int?;

    int? noteId;
    final notifier = ref.watch(journalNoteProvider.notifier);
    final state = ref.watch(journalNoteProvider);
    // If you need to debug, use debugPrint or a logging framework, and check for keys if state is a Map.
    // Example:

    print('Journal ID: $journalId');

    if (journalId != null) {
      final journal = ref.watch(journalByIdProvider(journalId));
      journal.when(
        data: (data) {
          print("data2: ${data?.journal.noteDetail}");
          if (data != null && !_isInitialized) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              notifier.updateNoteDetail(data.journal.noteDetail ?? '');
              notifier.updateBeforeImage(
                data.journal.beforePicture != null
                    ? XFile(
                      (() {
                        final tempDir = Directory.systemTemp;
                        final tempFile = File(
                          '${tempDir.path}/before_${data.journal.id}.jpg',
                        );
                        tempFile.writeAsBytesSync(data.journal.beforePicture!);
                        return tempFile.path;
                      })(),
                    )
                    : null,
              );
              notifier.updateAfterImage(
                data.journal.afterPicture != null
                    ? XFile(
                      (() {
                        final tempDir = Directory.systemTemp;
                        final tempFile = File(
                          '${tempDir.path}/after_${data.journal.id}.jpg',
                        );
                        tempFile.writeAsBytesSync(data.journal.afterPicture!);
                        return tempFile.path;
                      })(),
                    )
                    : null,
              );
            });
            _isInitialized = true;
          }
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error loading journal')),
      );
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
              _insertNote(journalId,state);
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
              controller: TextEditingController(text: state.noteDetail),
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Write your note',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) => notifier.updateNoteDetail(value),
            ),
            SizedBox(height: 20),
            Text('Before Image:'),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => _pickImage(true, notifier),
              child:
                  state.beforeImage == null
                      ? Container(
                        height: 150,
                        width: double.infinity,
                        color: Colors.grey[300],
                        child: Icon(Icons.add_a_photo, size: 50),
                      )
                      : Image.file(
                        File(state.beforeImage!.path),
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
            ),
            SizedBox(height: 20),
            Text('After Image:'),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => _pickImage(false, notifier),
              child:
                  state.afterImage == null
                      ? Container(
                        height: 150,
                        width: double.infinity,
                        color: Colors.grey[300],
                        child: Icon(Icons.add_a_photo, size: 50),
                      )
                      : Image.file(
                        File(state.afterImage!.path),
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
