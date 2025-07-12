

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/data/repositories/port_repository.dart';
import 'package:ppjournal/services/port_service.dart';
import 'package:ppjournal/providers/open_database.dart';


final portServiceProvider = Provider<PortService>((ref) {
  final db = ref.watch(dbProvider);
  return PortService(PortRepository(db));
});

final portListProvider = FutureProvider<List>((ref) async {
  final portService = ref.watch(portServiceProvider);
  return await portService.getAllPorts();
});