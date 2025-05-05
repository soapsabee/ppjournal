import '../local/database.dart';

class NoteRepository {
  final AppDatabase db;
  NoteRepository(this.db);

  Future<List<NoteData>> getAll() => db.select(db.note).get();

  Future<int> insert(NoteCompanion data) => db.into(db.note).insert(data);

  Future<bool> update(NoteData data) => db.update(db.note).replace(data);

  Future<int> delete(int id) =>
      (db.delete(db.note)..where((tbl) => tbl.id.equals(id))).go();
}