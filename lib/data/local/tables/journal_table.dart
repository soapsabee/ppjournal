import 'package:drift/drift.dart';

class Journal extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime().nullable()();
  TextColumn get session => text().nullable()();
  IntColumn get pairId => integer().nullable()();
  IntColumn get tradeSetupId => integer().nullable()(); // FK
  IntColumn get poiId => integer().nullable()();         // FK
  IntColumn get signalId => integer().nullable()();      // FK
  IntColumn get pricePatternId => integer().nullable()(); // FK
  TextColumn get timeFrame => text().nullable()();
  TextColumn get position => text().nullable()();
  TextColumn get winLose => text().nullable()();
  RealColumn get profit => real().nullable()();
  RealColumn get riskRewardRatio => real().nullable()();
  RealColumn get fee => real().nullable()();
  TextColumn get noteDetail => text().nullable()();
  BlobColumn get beforePicture => blob().nullable()(); // for image storage
  BlobColumn get afterPicture => blob().nullable()();  // for image storage
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}