import 'package:ppjournal/data/models/dashboard_model.dart';
import 'package:ppjournal/data/models/top_three_win_model.dart';
import 'package:ppjournal/data/repositories/dashboard_repository.dart';

class DashboardService {
  final DashboardRepository dashboardRepository;
  DashboardService(this.dashboardRepository);
  
  Future<DashboardModel> getDashboardData(int portId) async {
    return await dashboardRepository.getDashboardData(portId);
  }

  Future<List<TopThreeWinModel>> getTopThreeWins(int portId) async {
    return await dashboardRepository.getTopThreeWins(portId);
  }
}
