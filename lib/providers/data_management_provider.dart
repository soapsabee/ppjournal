import 'package:ppjournal/data/local/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ppjournal/data/repositories/poi_repository.dart';
import 'package:ppjournal/data/repositories/trade_setup_repository.dart';
import 'package:ppjournal/services/data_management_service.dart';


final dbProvider = Provider<AppDatabase>((ref)  {
   final db = AppDatabase();
   db.insertDataPrepared();
  return db;
});

final dataManagementServiceProvider = Provider<DataManagementService>((ref) {
  final db = ref.watch(dbProvider);
  return DataManagementService(TradeSetupRepository(db), PoiRepository(db));
});

final dataManagementListProvider = FutureProvider.family<List, String>((ref, typeForm) async {
  final dataManagementService = ref.watch(dataManagementServiceProvider);
  return await dataManagementService.getAllData(typeForm);
});