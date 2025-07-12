import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ppjournal/data/local/database.dart';

final dbProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  db.insertDataPrepared();
  db.insertTradeSetupsFromJson();

  return db;
});
