import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/data/repositories/port_repository.dart';

class PortService {
  final PortRepository _portRepository;
  PortService(this._portRepository);

  Future<List<PortData>> getAllPorts() async {
    return await _portRepository.getAllPorts();
  }

  Future<int> insertPort(PortCompanion data) async {
    return await _portRepository.insertPort(data);
  }

  Future<bool> updatePort(PortData data) async {
    return await _portRepository.updatePort(data);
  }

  Future<int> deletePort(int id) async {
    return await _portRepository.deletePort(id);
  }
}
