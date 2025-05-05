import '../local/database.dart';

class JournalRepository {
  final AppDatabase db;
  JournalRepository(this.db);

  Future<List<JournalData>> getAllJournals() => db.select(db.journal).get();

  Future<int> insertJournal(JournalCompanion data) =>
      db.into(db.journal).insert(data);

  Future<bool> updateJournal(JournalData data) =>
      db.update(db.journal).replace(data);

  Future<int> deleteJournal(int id) =>
      (db.delete(db.journal)..where((tbl) => tbl.id.equals(id))).go();
}