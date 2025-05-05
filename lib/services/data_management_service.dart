import 'package:drift/drift.dart';
import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/data/repositories/poi_repository.dart';
import 'package:ppjournal/data/repositories/trade_setup_repository.dart';

class DataManagementService {
  final TradeSetupRepository tradeSetupRepository;
  final PoiRepository poiRepository;
  DataManagementService(this.tradeSetupRepository, this.poiRepository);

  Future<List> getAllData(typeForm) async {
    if (typeForm == 'Setup') {
      return await tradeSetupRepository.getAll();
    }
    if (typeForm == 'POI') {
      return await poiRepository.getAll();
    }
    return [];
  }

Future<int> insertData(String typeForm, Map<String, dynamic> data) async {
  if (typeForm == 'Setup') {
    return await tradeSetupRepository.insert(TradeSetupCompanion(
      name: Value(data['name']),
      detail: Value(data['detail']),
      createdAt: Value(data['createdAt']),
      updatedAt: Value(data['updatedAt']),
    ));
  }
  if (typeForm == 'POI') {
    return await poiRepository.insert(PoiCompanion(
      name: Value(data['name']),
      detail: Value(data['detail']),
      createdAt: Value(data['createdAt']),
      updatedAt: Value(data['updatedAt']),
    ));
  }
  return 0;
}

  Future<bool> updateData(typeForm, data) async {
    if (typeForm == 'Setup') {
      return await tradeSetupRepository.update(TradeSetupData(
        id: data['id'],
        name: data['name'],
        detail: data['detail'],
        createdAt: data['createdAt'],
        updatedAt: data['updatedAt'],
      ));
    }
    if (typeForm == 'POI') {
      return await poiRepository.update(PoiData(
        id: data['id'],
        name: data['name'],
        detail: data['detail'],
        createdAt: data['createdAt'],
        updatedAt: data['updatedAt'],
      ));
    }
    return false;
  }

  Future<int> deleteData(typeForm, id) async {
    if (typeForm == 'Setup') {
      return await tradeSetupRepository.delete(id);
    }
    if (typeForm == 'POI') {
      return await poiRepository.delete(id);
    }
    return 0;
  }

  // Future<int> insertTradeSetup(TradeSetupCompanion data) async {
  //   return await tradeSetupRepository.insert(data);
  // }

  // Future<bool> updateTradeSetup(TradeSetupData data) async {
  //   return await tradeSetupRepository.update(data);
  // }

  // Future<int> deleteTradeSetup(int id) async {
  //   return await tradeSetupRepository.delete(id);
  // }
}
