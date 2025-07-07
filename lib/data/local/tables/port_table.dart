import 'package:drift/drift.dart';

class Port extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  RealColumn get portSize => real()();
  RealColumn get riskPerTrade => real()();
  RealColumn get costPerTrade => real()();
  // IntColumn get journalId => integer().nullable()(); // foreign key
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  String get tableName => 'port';
}