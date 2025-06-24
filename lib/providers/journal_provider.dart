import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/data/models/journal_model.dart';
import 'package:ppjournal/data/repositories/journal_repository.dart';
import 'package:ppjournal/services/journal_service.dart';
import 'package:ppjournal/states/journal_note_state.dart';

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

final journalByIdProvider = FutureProvider.family<JournalFull?, int>((
  ref,
  id,
) async {
  final journalService = ref.watch(journalServiceProvider);
  return await journalService.getJournalById(id);
});


class JournalNoteNotifier extends StateNotifier<JournalNoteState> {
  JournalNoteNotifier() : super(JournalNoteState());

  void updateSessionTime(String value) =>
      state = state.copyWith(sessionTime: value);

  void updateCurrencyPair(DataItem value) =>
      state = state.copyWith(currencyPair: value);

  void updateSetup(DataItem? value) =>
      state = state.copyWith(setup: value);

  void updatePoi(DataItem? value) =>
      state = state.copyWith(poi: value);

  void updateSignal(DataItem? value) =>
      state = state.copyWith(signal: value);

  void updatePricePattern(DataItem? value) =>
      state = state.copyWith(pricePattern: value);

  void updateTimeFrame(String? value) =>
      state = state.copyWith(timeFrame: value);

  void updatePosition(String? value) =>
      state = state.copyWith(position: value);

  void updateWinLose(String? value) =>
      state = state.copyWith(winLose: value);

  void updateProfit(double? value) =>
      state = state.copyWith(profit: value);

  void updateRR(double? value) =>
      state = state.copyWith(rr: value);

  void updateFee(double? value) =>
      state = state.copyWith(fee: value);

  void updateDate(DateTime? value) =>
      state = state.copyWith(date: value);

  void updateNoteDetail(String value) =>
      state = state.copyWith(noteDetail: value);

  void updateBeforeImage(XFile? value) =>
      state = state.copyWith(beforeImage: value);

  void updateAfterImage(XFile? value) =>
      state = state.copyWith(afterImage: value);
}

final journalNoteProvider = StateNotifierProvider<JournalNoteNotifier, JournalNoteState>(
  (ref) => JournalNoteNotifier(),
);