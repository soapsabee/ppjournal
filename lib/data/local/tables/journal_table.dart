import 'package:drift/drift.dart';

class Journal extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  TextColumn get session => text()();
  IntColumn get pairId => integer().nullable()();
  IntColumn get tradeSetupId => integer().nullable()(); // FK
  IntColumn get poiId => integer().nullable()();         // FK
  IntColumn get signalId => integer().nullable()();      // FK
  IntColumn get pricePatternId => integer().nullable()(); // FK
  TextColumn get timeFrame => text()();
  TextColumn get position => text()();
  TextColumn get winLose => text()();
  RealColumn get profit => real()();
  RealColumn get riskRewardRatio => real()();
  RealColumn get fee => real()();
  IntColumn get noteId => integer().nullable()();        // FK
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}