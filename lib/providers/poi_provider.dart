

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/data/repositories/poi_repository.dart';
import 'package:ppjournal/services/poi_service.dart';

final dbProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final poiServiceProvider = Provider<PoiService>((ref) {
  final db = ref.watch(dbProvider);
  return PoiService(PoiRepository(db));
});

final poiListProvider = FutureProvider<List<PoiData>>((ref) async {
  final poiService = ref.watch(poiServiceProvider);
  return await poiService.getAllPois();
});