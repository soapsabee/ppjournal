import '../local/database.dart';

class TradeSetupRepository {
  final AppDatabase db;
  TradeSetupRepository(this.db);

  Future<List<TradeSetupData>> getAll() => db.select(db.tradeSetup).get();

  Future<List<TradeSetupData>> getById(int id) =>
      (db.select(db.tradeSetup)..where((tbl) => tbl.id.equals(id))).get();

  Future<int> insert(TradeSetupCompanion data) =>
      db.into(db.tradeSetup).insert(data);

  Future<bool> update(TradeSetupData data) =>
      db.update(db.tradeSetup).replace(data);

  Future<int> delete(int id) =>
      (db.delete(db.tradeSetup)..where((tbl) => tbl.id.equals(id))).go();
}