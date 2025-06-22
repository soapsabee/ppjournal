import 'package:drift/drift.dart';
import '../local/database.dart';

class NoteRepository {
  final AppDatabase db;
  NoteRepository(this.db);

  Future<List<NoteData>> getAll() => db.select(db.note).get();

  Future<int> insert(NoteCompanion data , int? journalId) async {

    if (journalId == null) {
      // If no journalId is provided, just insert the note
      return 0;
    }
    // Insert the note
    final noteId = await db.into(db.note).insert(data);

    // Update the journal with the new noteId
    await (db.update(db.journal)..where(
      (tbl) => tbl.id.equals(journalId),
    )).write(JournalCompanion(noteId: Value(noteId)));

    return noteId;
  }

  Future<bool> update(NoteData data) => db.update(db.note).replace(data);

  Future<int> delete(int id) =>
      (db.delete(db.note)..where((tbl) => tbl.id.equals(id))).go();
}
