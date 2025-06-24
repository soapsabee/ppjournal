import 'package:image_picker/image_picker.dart';

class DataItem {
  final int id;
  final String name;

  const DataItem({required this.id, required this.name});

  @override
  String toString() => name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataItem && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class JournalNoteState {
  final String? sessionTime;
  final DataItem? currencyPair;
  final DataItem? setup;
  final DataItem? poi;
  final DataItem? signal;
  final DataItem? pricePattern;
  final String? timeFrame;
  final String? position;
  final String? winLose;
  final double? profit;
  final double? rr;
  final double? fee;
  final DateTime? date;
  final DateTime createdAt;
  final String noteDetail;
  final XFile? beforeImage;
  final XFile? afterImage;

  JournalNoteState({
    this.sessionTime,
    this.currencyPair,
    this.setup,
    this.poi,
    this.signal,
    this.pricePattern,
    this.timeFrame,
    this.position,
    this.winLose,
    this.profit,
    this.rr,
    this.fee,
    this.date,
    DateTime? createdAt,
    this.noteDetail = '',
    this.beforeImage,
    this.afterImage,
  }) : createdAt = createdAt ?? DateTime.now();

  JournalNoteState copyWith({
    String? sessionTime,
    DataItem? currencyPair,
    DataItem? setup,
    DataItem? poi,
    DataItem? signal,
    DataItem? pricePattern,
    String? timeFrame,
    String? position,
    String? winLose,
    double? profit,
    double? rr,
    double? fee,
    DateTime? date,
    DateTime? createdAt,
    String? noteDetail,
    XFile? beforeImage,
    XFile? afterImage,
  }) {
    return JournalNoteState(
      sessionTime: sessionTime ?? this.sessionTime,
      currencyPair: currencyPair ?? this.currencyPair,
      setup: setup ?? this.setup,
      poi: poi ?? this.poi,
      signal: signal ?? this.signal,
      pricePattern: pricePattern ?? this.pricePattern,
      timeFrame: timeFrame ?? this.timeFrame,
      position: position ?? this.position,
      winLose: winLose ?? this.winLose,
      profit: profit ?? this.profit,
      rr: rr ?? this.rr,
      fee: fee ?? this.fee,
      date: date ?? this.date,
      createdAt: createdAt ?? this.createdAt,
      noteDetail: noteDetail ?? this.noteDetail,
      beforeImage: beforeImage ?? this.beforeImage,
      afterImage: afterImage ?? this.afterImage,
    );
  }
}