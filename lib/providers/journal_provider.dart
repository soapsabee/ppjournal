

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/data/models/journal_model.dart';
import 'package:ppjournal/data/repositories/journal_repository.dart';
import 'package:ppjournal/services/journal_service.dart';

final dbProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final journalServiceProvider = Provider<JournalService>((ref) {
  final db = ref.watch(dbProvider);
  return JournalService(JournalRepository(db));
});

final journalListProvider = FutureProvider<List<JournalFull>>((ref) async {
  final journalService = ref.watch(journalServiceProvider);
  return await journalService.getAllJournalsFull();
});

final journalByIdProvider = FutureProvider.family<JournalFull?, int>((ref, id) async {
  final journalService = ref.watch(journalServiceProvider);
  return await journalService.getJournalById(id);
});