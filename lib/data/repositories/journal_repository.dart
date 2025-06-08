import 'package:drift/drift.dart';
import 'package:ppjournal/data/models/journal_model.dart';

import '../local/database.dart';

class JournalRepository {
  final AppDatabase db;
  JournalRepository(this.db);

  Future<List<JournalFull>> getAllJournalsFull() async {
    final query = db.select(db.journal).join([
      innerJoin(db.tradeSetup, db.tradeSetup.id.equalsExp(db.journal.tradeSetupId)),
      innerJoin(db.poi, db.poi.id.equalsExp(db.journal.poiId)),
      innerJoin(db.signal, db.signal.id.equalsExp(db.journal.signalId)),
      innerJoin(db.currencyPairs, db.currencyPairs.id.equalsExp(db.journal.pairId)),
      innerJoin(
          db.pricePattern, db.pricePattern.id.equalsExp(db.journal.pricePatternId)),
    ]);

    final results = await query.get();

    return results.map((row) {
      return JournalFull(
        journal: row.readTable(db.journal),
        setup: row.readTable(db.tradeSetup),
        poi: row.readTable(db.poi),
        signal: row.readTable(db.signal),
        pair: row.readTable(db.currencyPairs),
        pricePattern: row.readTable(db.pricePattern),
      );
    }).toList();
  }

  Future<List<JournalData>> getAllJournals() => db.select(db.journal).get();

  Future<int> insertJournal(JournalCompanion data) =>
      db.into(db.journal).insert(data);

  Future<bool> updateJournal(JournalData data) =>
      db.update(db.journal).replace(data);

  Future<int> deleteJournal(int id) =>
      (db.delete(db.journal)..where((tbl) => tbl.id.equals(id))).go();
}