
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/data/models/dashboard_model.dart';
import 'package:ppjournal/data/repositories/dashboard_repository.dart';
import 'package:ppjournal/services/dashboard_service.dart';

final dbProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});


final dashboardServiceProvider = Provider<DashboardService>((ref) {
  final db = ref.watch(dbProvider);
  return DashboardService(DashboardRepository(db));
});

final dashboardDataProvider = FutureProvider<DashboardModel>((ref) async {
  final dashboardService = ref.watch(dashboardServiceProvider);
  return await dashboardService.getDashboardData();
});