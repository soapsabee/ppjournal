import 'package:drift/drift.dart';
import 'package:ppjournal/data/models/journal_model.dart';

import '../local/database.dart';

class JournalRepository {
  final AppDatabase db;
  JournalRepository(this.db);

  Future<List<JournalFull>> getAllJournalsFull() async {
    final testSelect = db.select(db.journal);
    print("Test Select: $testSelect");
    final query = db.select(db.journal).join([
      leftOuterJoin(
        db.tradeSetup,
        db.tradeSetup.id.equalsExp(db.journal.tradeSetupId),
      ),
      leftOuterJoin(db.poi, db.poi.id.equalsExp(db.journal.poiId)),
      leftOuterJoin(db.signal, db.signal.id.equalsExp(db.journal.signalId)),
      leftOuterJoin(
        db.currencyPairs,
        db.currencyPairs.id.equalsExp(db.journal.pairId),
      ),
      leftOuterJoin(
        db.pricePattern,
        db.pricePattern.id.equalsExp(db.journal.pricePatternId),
      ),
    ]);

    final results = await query.get();

    return results.map((row) {
      return JournalFull(
        journal: row.readTable(db.journal),
        setup: row.readTableOrNull(db.tradeSetup), // ใช้ readTableOrNull
        poi: row.readTableOrNull(db.poi),
        signal: row.readTableOrNull(db.signal),
        pair: row.readTableOrNull(db.currencyPairs),
        pricePattern: row.readTableOrNull(db.pricePattern),
      );
    }).toList();
  }

  Future<List<JournalData>> getAllJournals() => db.select(db.journal).get();

  Future<JournalFull?> getJournalById(int id) {
    final query = db.select(db.journal).join([
      leftOuterJoin(
        db.tradeSetup,
        db.tradeSetup.id.equalsExp(db.journal.tradeSetupId),
      ),
      leftOuterJoin(db.poi, db.poi.id.equalsExp(db.journal.poiId)),
      leftOuterJoin(db.signal, db.signal.id.equalsExp(db.journal.signalId)),
      leftOuterJoin(
        db.currencyPairs,
        db.currencyPairs.id.equalsExp(db.journal.pairId),
      ),
      leftOuterJoin(
        db.pricePattern,
        db.pricePattern.id.equalsExp(db.journal.pricePatternId),
      ),
    ])..where(db.journal.id.equals(id));

    return query.getSingleOrNull().then((row) {
      if (row == null) return null;

      return JournalFull(
        journal: row.readTable(db.journal),
        setup: row.readTableOrNull(db.tradeSetup),
        poi: row.readTableOrNull(db.poi),
        signal: row.readTableOrNull(db.signal),
        pair: row.readTableOrNull(db.currencyPairs),
        pricePattern: row.readTableOrNull(db.pricePattern),
      );
    });
  }

  Future<int> insertJournal(JournalCompanion data) async {
    try {
      final result = db.into(db.journal).insert(data);
      return result;
    } catch (e) {
      print('Insert failed: $e');
      return 0;
    }
  }

  Future<bool> updateJournal(int journalId, JournalCompanion updates) async {
    final result = await (db.update(db.journal)
      ..where((tbl) => tbl.id.equals(journalId))).write(updates);
    return result == 1;
  }

  Future<int> deleteJournal(int id) =>
      (db.delete(db.journal)..where((tbl) => tbl.id.equals(id))).go();
}
