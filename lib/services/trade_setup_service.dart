import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/data/repositories/trade_setup_repository.dart';

class TradeSetupService {
  final TradeSetupRepository tradeSetupRepository;

  TradeSetupService(this.tradeSetupRepository);

  Future<List<TradeSetupData>> getAllTradeSetups() async {
    return await tradeSetupRepository.getAll();
  }
  Future<int> insertTradeSetup(TradeSetupCompanion data) async {
    return await tradeSetupRepository.insert(data);
  }
  Future<bool> updateTradeSetup(TradeSetupData data) async {
    return await tradeSetupRepository.update(data);
  }
  Future<int> deleteTradeSetup(int id) async {
    return await tradeSetupRepository.delete(id);
  }
}