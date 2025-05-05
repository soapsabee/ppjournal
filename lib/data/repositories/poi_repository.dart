import '../local/database.dart';

class PoiRepository {
  final AppDatabase db;
  PoiRepository(this.db);

  Future<List<PoiData>> getAll() => db.select(db.poi).get();

  Future<int> insert(PoiCompanion data) => db.into(db.poi).insert(data);

  Future<bool> update(PoiData data) => db.update(db.poi).replace(data);

  Future<int> delete(int id) =>
      (db.delete(db.poi)..where((tbl) => tbl.id.equals(id))).go();
}