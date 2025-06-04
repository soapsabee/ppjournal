import 'package:drift/drift.dart';
import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/data/local/tables/signal_table.dart';
import 'package:ppjournal/data/repositories/currency_pairs_repository.dart';
import 'package:ppjournal/data/repositories/poi_repository.dart';
import 'package:ppjournal/data/repositories/price_pattern_repository.dart';
import 'package:ppjournal/data/repositories/signal_repository.dart';
import 'package:ppjournal/data/repositories/trade_setup_repository.dart';

class DataManagementService {
  final TradeSetupRepository tradeSetupRepository;
  final PoiRepository poiRepository;
  final CurrencyPairsRepository currencyPairsRepository;
  final PricePatternRepository pricePatternRepository;
  final SignalRepository signalRepository;
  DataManagementService(
    this.tradeSetupRepository,
    this.poiRepository,
    this.currencyPairsRepository,
    this.pricePatternRepository,
    this.signalRepository
  );

  Future<List> getAllData(typeForm) async {
    if (typeForm == 'Setup') {
      return await tradeSetupRepository.getAll();
    }
    if (typeForm == 'POI') {
      return await poiRepository.getAll();
    }
    if (typeForm == 'Pair') {
      return await currencyPairsRepository.getAllCurrencyPairs();
    }
    if (typeForm == 'Price Pattern') {
      return await pricePatternRepository.getAll();
    }
    if (typeForm == 'Signal') {
      return await signalRepository.getAll();
    }
    return [];
  }

  Future<int> insertData(String typeForm, Map<String, dynamic> data) async {
    if (typeForm == 'Setup') {
      return await tradeSetupRepository.insert(
        TradeSetupCompanion(
          name: Value(data['name']),
          detail: Value(data['detail']),
          createdAt: Value(data['createdAt']),
          updatedAt: Value(data['updatedAt']),
        ),
      );
    }
    if (typeForm == 'POI') {
      return await poiRepository.insert(
        PoiCompanion(
          name: Value(data['name']),
          detail: Value(data['detail']),
          createdAt: Value(data['createdAt']),
          updatedAt: Value(data['updatedAt']),
        ),
      );
    }
    if (typeForm == 'Pair') {
      return await currencyPairsRepository.insertCurrencyPairs(
        CurrencyPairsCompanion(
          name: Value(data['name']),
          detail: Value(data['detail']),
          createdAt: Value(data['createdAt']),
          updatedAt: Value(data['updatedAt']),
        ),
      );
    }
    if (typeForm == 'Price Pattern') {
      return await pricePatternRepository.insert(
        PricePatternCompanion(
          name: Value(data['name']),
          detail: Value(data['detail']),
          createdAt: Value(data['createdAt']),
          updatedAt: Value(data['updatedAt']),
        ),
      );
    }
    if (typeForm == 'Signal') {
      return await signalRepository.insert(
        SignalCompanion(
          name: Value(data['name']),
          detail: Value(data['detail']),
          createdAt: Value(data['createdAt']),
          updatedAt: Value(data['updatedAt']),
        ),
      );
    }
    return 0;
  }

  Future<bool> updateData(typeForm, data) async {
    if (typeForm == 'Setup') {
      return await tradeSetupRepository.update(
        TradeSetupData(
          id: data['id'],
          name: data['name'],
          detail: data['detail'],
          createdAt: data['createdAt'],
          updatedAt: data['updatedAt'],
        ),
      );
    }
    if (typeForm == 'POI') {
      return await poiRepository.update(
        PoiData(
          id: data['id'],
          name: data['name'],
          detail: data['detail'],
          createdAt: data['createdAt'],
          updatedAt: data['updatedAt'],
        ),
      );
    }
    if (typeForm == 'Pair') {
      return await currencyPairsRepository.updateCurrencyPairs(
        CurrencyPairsCompanion(
          id: Value(data['id']),
          name: Value(data['name']),
          detail: Value(data['detail']),
          createdAt: Value(data['createdAt']),
          updatedAt: Value(data['updatedAt']),
        ),
      );
    }
    if (typeForm == 'Price Pattern') {
      return await pricePatternRepository.update(
        PricePatternData(
          id: data['id'],
          name: data['name'],
          detail: data['detail'],
          createdAt: data['createdAt'],
          updatedAt: data['updatedAt'],
        ),
      );
    }
    if (typeForm == 'Signal') {
      return await signalRepository.update(
        SignalData(
          id: data['id'],
          name: data['name'],
          detail: data['detail'],
          createdAt: data['createdAt'],
          updatedAt: data['updatedAt'],
        ),
      );
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
    if (typeForm == 'Pair') {
      return await currencyPairsRepository.deleteCurrencyPairs(id);
    }
    if (typeForm == 'Price Pattern') {
      return await pricePatternRepository.delete(id);
    }
    if (typeForm == 'Signal') {
      return await signalRepository.delete(id);
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
