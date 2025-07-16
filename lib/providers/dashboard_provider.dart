
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/data/models/dashboard_model.dart';
import 'package:ppjournal/data/models/top_three_port_profit.dart';
import 'package:ppjournal/data/models/top_three_win_model.dart';
import 'package:ppjournal/data/repositories/dashboard_repository.dart';
import 'package:ppjournal/providers/journal_provider.dart';
import 'package:ppjournal/services/dashboard_service.dart';
import 'package:ppjournal/providers/open_database.dart';


final dashboardServiceProvider = Provider<DashboardService>((ref) {
  final db = ref.watch(dbProvider);
  return DashboardService(DashboardRepository(db));
});

final dashboardDataProvider = FutureProvider<DashboardModel>((ref) async {
  final dashboardService = ref.watch(dashboardServiceProvider);
   final state = ref.watch(journalNoteProvider);
  if (state.portId == null) {
    throw Exception("Port ID is not set, cannot fetch journals.");
  }
  return await dashboardService.getDashboardData(state.portId);
});

final topThreeWinsProvider = FutureProvider<List<TopThreeWinModel>>((ref) async {
  final dashboardService = ref.watch(dashboardServiceProvider);
  final state = ref.watch(journalNoteProvider);
  if (state.portId == null) {
    throw Exception("Port ID is not set, cannot fetch top three wins.");
  }
  return await dashboardService.getTopThreeWins(state.portId);
});

final topThreePortProfitsProvider = FutureProvider<List<TopThreePortProfit>>((ref) async {
  final dashboardService = ref.watch(dashboardServiceProvider);
  return await dashboardService.getTopThreePortProfits();
});