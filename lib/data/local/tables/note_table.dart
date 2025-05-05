import 'package:drift/drift.dart';

class Note extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get detail => text()();
  BlobColumn get beforePicture => blob().nullable()(); // for image storage
  BlobColumn get afterPicture => blob().nullable()();  // for image storage
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}