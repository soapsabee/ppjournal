import '../local/database.dart';

class SignalRepository {
  final AppDatabase db;
  SignalRepository(this.db);

  Future<List<SignalData>> getAll() => db.select(db.signal).get();

  Future<int> insert(SignalCompanion data) => db.into(db.signal).insert(data);

  Future<bool> update(SignalData data) => db.update(db.signal).replace(data);

  Future<int> delete(int id) =>
      (db.delete(db.signal)..where((tbl) => tbl.id.equals(id))).go();
}