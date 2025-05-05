import '../local/database.dart';

class PricePatternRepository {
  final AppDatabase db;
  PricePatternRepository(this.db);

  Future<List<PricePatternData>> getAll() => db.select(db.pricePattern).get();

  Future<int> insert(PricePatternCompanion data) =>
      db.into(db.pricePattern).insert(data);

  Future<bool> update(PricePatternData data) =>
      db.update(db.pricePattern).replace(data);

  Future<int> delete(int id) =>
      (db.delete(db.pricePattern)..where((tbl) => tbl.id.equals(id))).go();
}