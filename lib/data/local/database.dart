import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ppjournal/data/models/poi_seed.dart';
import 'package:ppjournal/data/models/price_pattern_seed.dart';
import 'package:ppjournal/data/models/trade_setup_seed.dart';
// Import your tables
import 'tables/port_table.dart';
import 'tables/trade_setup_table.dart';
import 'tables/journal_table.dart';
import 'tables/poi_table.dart';
import 'tables/signal_table.dart';
import 'tables/price_pattern_table.dart';
import 'tables/note_table.dart';
import 'tables/currency_pairs_table.dart';

// Tell Drift what tables are in this database
part 'database.g.dart'; // <- will be generated

@DriftDatabase(
  tables: [
    Port,
    TradeSetup,
    Journal,
    Poi,
    Signal,
    PricePattern,
    Note,
    CurrencyPairs,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> insertDataPrepared() async {
    await transaction(() async {
      await insertTradeSetupsFromJson();
      await insertPoiDataFromJson();
      await insertPricePatternsFromJson();
      await insertSignalDataFromJson();
      await insertCurrencyPairsFromJson();
    });
  }

  Future<void> insertTradeSetupsFromJson() async {
    final existing = await select(tradeSetup).get();
    if (existing.isNotEmpty) return;

    final String jsonStr = await rootBundle.loadString(
      'assets/trade_setups.json',
    );
    final List<dynamic> jsonData = jsonDecode(jsonStr);

    final List<TradeSetupCompanion> entries =
        jsonData.map((e) {
          final data = TradeSetupSeed.fromJson(jsonDecode(jsonEncode(e)));
          return TradeSetupCompanion.insert(
            name: data.name,
            detail: data.detail,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );
        }).toList();

    await batch((batch) {
      batch.insertAll(tradeSetup, entries);
    });
  }

  Future<void> insertPoiDataFromJson() async {
    final existing = await select(poi).get();
    if (existing.isNotEmpty) return;

    final String jsonStr = await rootBundle.loadString('assets/poi.json');
    final List<dynamic> jsonData = jsonDecode(jsonStr);

    final List<PoiCompanion> entries =
        jsonData.map((e) {
          final data = PoiSeed.fromJson(jsonDecode(jsonEncode(e)));
          return PoiCompanion.insert(
            name: data.name,
            detail: data.detail,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );
        }).toList();

    await batch((batch) {
      batch.insertAll(poi, entries);
    });
  }

  Future<void> insertPricePatternsFromJson() async {
    final existing = await select(pricePattern).get();
    if (existing.isNotEmpty) return;

    final String jsonStr = await rootBundle.loadString(
      'assets/price_patterns.json',
    );
    final List<dynamic> jsonData = jsonDecode(jsonStr);

    final List<PricePatternCompanion> entries =
        jsonData.map((e) {
          final data = PricePatternSeed.fromJson(jsonDecode(jsonEncode(e)));
          return PricePatternCompanion.insert(
            name: data.name,
            detail: data.detail,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );
        }).toList();

    await batch((batch) {
      batch.insertAll(pricePattern, entries);
    });
  }

  Future<void> insertSignalDataFromJson() async {
    final existing = await select(signal).get();
    if (existing.isNotEmpty) return;

    final String jsonStr = await rootBundle.loadString('assets/signals.json');
    final List<dynamic> jsonData = jsonDecode(jsonStr);

    final List<SignalCompanion> entries =
        jsonData.map((e) {
          return SignalCompanion.insert(
            name: e['name'],
            detail: e['detail'],
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );
        }).toList();

    await batch((batch) {
      batch.insertAll(signal, entries);
    });
  }

  Future<void> insertCurrencyPairsFromJson() async {
    final existing = await select(currencyPairs).get();
    if (existing.isNotEmpty) return;

    final String jsonStr = await rootBundle.loadString(
      'assets/currency_pairs.json',
    );
    final List<dynamic> jsonData = jsonDecode(jsonStr);

    final List<CurrencyPairsCompanion> entries =
        jsonData.map((e) {
          return CurrencyPairsCompanion.insert(
            name: e['name'],
            detail: e['detail'],
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );
        }).toList();

    await batch((batch) {
      batch.insertAll(currencyPairs, entries);
    });
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.db'));
    return NativeDatabase(file);
  });
}
