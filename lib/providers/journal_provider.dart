import 'dart:io';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/data/models/dashboard_model.dart';
import 'package:ppjournal/data/models/journal_model.dart';
import 'package:ppjournal/data/repositories/journal_repository.dart';
import 'package:ppjournal/services/journal_service.dart';
import 'package:ppjournal/states/journal_note_state.dart';
import 'package:ppjournal/providers/open_database.dart';

final journalServiceProvider = Provider<JournalService>((ref) {
  final db = ref.watch(dbProvider);
  return JournalService(JournalRepository(db));
});

final journalListProvider = FutureProvider<List<JournalFull>>((ref) async {
  final journalService = ref.watch(journalServiceProvider);
  final state = ref.watch(journalNoteProvider);
  print("Port ID: ${state.portId}");
  if (state.portId == null) {
    throw Exception("Port ID is not set, cannot fetch journals.");
  }
  return await journalService.getAllJournalsFull(state.portId);
});

final journalByIdProvider = FutureProvider.family<JournalFull?, int>((
  ref,
  id,
) async {
  final journalService = ref.watch(journalServiceProvider);
  return await journalService.getJournalById(id);
});

final journalInsertProvider = FutureProvider<int>((ref) async {
  final state = ref.watch(journalNoteProvider);
  print("state: ${state.portId}");
  final journalService = ref.watch(journalServiceProvider);
  final insertedId = await journalService.insertJournal(
    JournalCompanion(
      portId: Value(state.portId),
      session: Value(state.sessionTime),
      pairId: Value(state.currencyPair?.id),
      tradeSetupId: Value(state.setup?.id),
      poiId: Value(state.poi?.id),
      signalId: Value(state.signal?.id),
      pricePatternId: Value(state.pricePattern?.id),
      timeFrame: Value(state.timeFrame),
      position: Value(state.position),
      winLose: Value(state.winLose),
      riskRewardRatio: Value(state.rr),
      fee: Value(state.fee),
      profit: Value(state.profit),
      date: Value(state.date),
      noteDetail: Value(state.noteDetail),
      beforePicture:
          state.beforeImage != null
              ? Value(await File(state.beforeImage!.path).readAsBytes())
              : const Value(null),
      afterPicture:
          state.afterImage != null
              ? Value(await File(state.afterImage!.path).readAsBytes())
              : const Value(null),
      createdAt: Value(DateTime.now()),
      updatedAt: Value(DateTime.now()),
    ),
  );
  return insertedId;
});

final journalUpdateProvider = FutureProvider<bool>((ref) async {
  print("comein");

  final state = ref.watch(journalNoteProvider);
  if (state.id == null) {
    throw Exception("Journal ID is null, cannot update.");
  }

  final beforeImagePath = state.beforeImage?.path;
  var beforeImg = null;
  if (beforeImagePath != null) {
    beforeImg = await File(beforeImagePath).readAsBytes();
  }

  final afterImagePath = state.afterImage?.path;
  var afterImg = null;
  if (afterImagePath != null) {
    afterImg = await File(afterImagePath).readAsBytes();
  }

  final journalService = ref.watch(journalServiceProvider);
  final updatedRows = await journalService.updateJournal(
    state.id ?? 0,
    JournalCompanion(
      portId: Value(state.portId),
      session: Value(state.sessionTime),
      pairId: Value(state.currencyPair?.id),
      tradeSetupId: Value(state.setup?.id),
      poiId: Value(state.poi?.id),
      signalId: Value(state.signal?.id),
      pricePatternId: Value(state.pricePattern?.id),
      timeFrame: Value(state.timeFrame),
      position: Value(state.position),
      winLose: Value(state.winLose),
      riskRewardRatio: Value(state.rr),
      fee: Value(state.fee),
      profit: Value(state.profit),
      date: Value(state.date),
      noteDetail: Value(state.noteDetail),
      beforePicture:Value(beforeImg),
      afterPicture:Value(afterImg),
      updatedAt: Value(DateTime.now()),
    ),
  );
  return updatedRows;
});

class JournalNoteNotifier extends StateNotifier<JournalNoteState> {
  JournalNoteNotifier() : super(JournalNoteState());

  void updateId(int? value) => state = state.copyWith(id: value);

  void updatePortId(int value) => state = state.copyWith(portId: value);

  void updateSessionTime(String? value) =>
      state = state.copyWith(sessionTime: value);

  void updateCurrencyPair(DataItem? value) =>
      state = state.copyWith(currencyPair: value);

  void updateSetup(DataItem? value) => state = state.copyWith(setup: value);

  void updatePoi(DataItem? value) => state = state.copyWith(poi: value);

  void updateSignal(DataItem? value) => state = state.copyWith(signal: value);

  void updatePricePattern(DataItem? value) =>
      state = state.copyWith(pricePattern: value);

  void updateTimeFrame(String? value) =>
      state = state.copyWith(timeFrame: value);

  void updatePosition(String? value) => state = state.copyWith(position: value);

  void updateWinLose(String? value) => state = state.copyWith(winLose: value);

  void updateProfit(double? value) => state = state.copyWith(profit: value);

  void updateRR(double? value) => state = state.copyWith(rr: value);

  void updateFee(double? value) => state = state.copyWith(fee: value);

  void updateDate(DateTime? value) => state = state.copyWith(date: value);

  void updateNoteDetail(String? value) =>
      state = state.copyWith(noteDetail: value);

  void updateBeforeImage(XFile? value) =>
      state = state.copyWith(beforeImage: value);

  void updateAfterImage(XFile? value) =>
      state = state.copyWith(afterImage: value);

  void resetStateJournalExceptPortId() {
    final currentPortId = state.portId;
    state = JournalNoteState().copyWith(portId: currentPortId);
  }
}

final journalNoteProvider =
    StateNotifierProvider<JournalNoteNotifier, JournalNoteState>(
      (ref) => JournalNoteNotifier(),
    );
