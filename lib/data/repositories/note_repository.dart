import 'package:drift/drift.dart';
import '../local/database.dart';

class NoteRepository {
  final AppDatabase db;
  NoteRepository(this.db);

  Future<List<NoteData>> getAll() => db.select(db.note).get();

  Future<int> insert(NoteCompanion data, int? journalId) async {
    if (journalId == null) {
      // If no journalId is provided, just insert the note
      return 0;
    }
    // Insert the note
    int noteId = 0;
    try {
      noteId = await db.into(db.note).insert(data);
      final affectedRows = await (db.update(db.journal)..where(
        (tbl) => tbl.id.equals(journalId),
      )).write(JournalCompanion(noteId: Value(noteId)));
    } catch (e) {
      return 0;
    }

    return noteId;
  }

  Future<bool> update(NoteData data) {
    print("data: $data");
    try {
      final update = db.update(db.note).replace(data);
      return update;
    } catch (e) {
      print('Update failed: $e');
      return Future.value(false);
    }
  }

  Future<int> delete(int id) =>
      (db.delete(db.note)..where((tbl) => tbl.id.equals(id))).go();
}
