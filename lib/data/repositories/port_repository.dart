import '../local/database.dart';

class PortRepository {
  final AppDatabase db;
  PortRepository(this.db);

  Future<List<PortData>> getAllPorts() => db.select(db.port).get();

  Future<int> insertPort(PortCompanion data) =>
      db.into(db.port).insert(data);

  Future<bool> updatePort(PortData data) =>
      db.update(db.port).replace(data);

  Future<int> deletePort(int id) =>
      (db.delete(db.port)..where((tbl) => tbl.id.equals(id))).go();
}