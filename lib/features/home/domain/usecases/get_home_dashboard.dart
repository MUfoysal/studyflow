import '../entities/home_dashboard.dart';
import '../repositories/home_repository.dart';

class GetHomeDashboard {
  final HomeRepository repository;

  const GetHomeDashboard(this.repository);

  HomeDashboard call() {
    return repository.getDashboard();
  }
}
