import 'package:ppjournal/data/local/database.dart';

class JournalFull {
  final JournalData journal;
  final TradeSetupData setup;
  final PoiData poi;
  final SignalData signal;
  final CurrencyPair pair;
  final PricePatternData pricePattern;

  JournalFull({
    required this.journal,
    required this.setup,
    required this.poi,
    required this.signal,
    required this.pair,
    required this.pricePattern,
  });
}
