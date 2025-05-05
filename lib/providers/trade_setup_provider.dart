import 'package:ppjournal/data/local/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ppjournal/data/repositories/trade_setup_repository.dart';
import 'package:ppjournal/services/trade_setup_service.dart';


final dbProvider = Provider<AppDatabase>((ref) {
   final db = AppDatabase();
  db.insertTradeSetupsFromJson();
  return db;
});

final tradeSetupServiceProvider = Provider<TradeSetupService>((ref) {
  final db = ref.watch(dbProvider);
  return TradeSetupService(TradeSetupRepository(db));
});

final tradeSetupListProvider = FutureProvider<List<TradeSetupData>>((ref) async {
  final tradeSetupService = ref.watch(tradeSetupServiceProvider);
  return await tradeSetupService.getAllTradeSetups();
});