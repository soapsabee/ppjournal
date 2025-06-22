
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/data/repositories/note_repository.dart';
import 'package:ppjournal/services/note_service.dart';

final dbProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final noteServiceProvider = Provider<NoteService>((ref) {
  final db = ref.watch(dbProvider);
  return NoteService(NoteRepository(db));
});

final noteListProvider = FutureProvider<List<NoteData>>((ref) async {
  final noteService = ref.watch(noteServiceProvider);
  return await noteService.getAllNotes();
});

final noteByIdProvider = FutureProvider.family<NoteData?, int>((ref, id) async {
  final noteService = ref.watch(noteServiceProvider);
  return await noteService.getNoteById(id);
});