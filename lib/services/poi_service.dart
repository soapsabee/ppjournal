
import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/data/repositories/poi_repository.dart';

class PoiService {
  // This class will handle
  final PoiRepository poiRepository;
  PoiService(this.poiRepository);

  Future<List<PoiData>> getAllPois() async {
    return await poiRepository.getAll();
  }
  Future<int> insertPoi(PoiCompanion data) async {
    return await poiRepository.insert(data);
  }
  Future<bool> updatePoi(PoiData data) async {
    return await poiRepository.update(data);
  }
  Future<int> deletePoi(int id) async {
    return await poiRepository.delete(id);
  }
}