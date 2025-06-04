import '../local/database.dart';

class CurrencyPairsRepository {
  final AppDatabase db;
  CurrencyPairsRepository(this.db);

  Future<List<CurrencyPair>> getAllCurrencyPairs() => db.select(db.currencyPairs).get();

  Future<int> insertCurrencyPairs(CurrencyPairsCompanion data) =>
      db.into(db.currencyPairs).insert(data);

  Future<bool> updateCurrencyPairs(CurrencyPairsCompanion data) =>
      db.update(db.currencyPairs).replace(data);

  Future<int> deleteCurrencyPairs(int id) =>
      (db.delete(db.currencyPairs)..where((tbl) => tbl.id.equals(id))).go();
}