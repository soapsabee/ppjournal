

import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/data/repositories/note_repository.dart';

class  NoteService {
  // This class will handle
  final NoteRepository noteRepository;
  NoteService(this.noteRepository);

  Future<List<NoteData>> getAllNotes() async {
    return await noteRepository.getAll();
  }

  Future<int> insertNote(NoteCompanion data, int? journalId) async {
    return await noteRepository.insert(data, journalId);
  }
  Future<bool> updateNote(NoteData data) async {
    return await noteRepository.update(data);
  }
  Future<int> deleteNote(int id) async {
    return await noteRepository.delete(id);
  }
  Future<NoteData?> getNoteById(int id) async {
    final notes = await noteRepository.getAll();
    return notes.firstWhere((note) => note.id == id);
  }
}