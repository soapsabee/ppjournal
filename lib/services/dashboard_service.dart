import 'package:ppjournal/data/models/dashboard_model.dart';
import 'package:ppjournal/data/repositories/dashboard_repository.dart';

class DashboardService {
  final DashboardRepository dashboardRepository;
  DashboardService(this.dashboardRepository);
  
  Future<DashboardModel> getDashboardData() async {
    return await dashboardRepository.getDashboardData();
  }
}
