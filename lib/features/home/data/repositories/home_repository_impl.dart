import '../../domain/entities/home_dashboard.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_local_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource dataSource;

  const HomeRepositoryImpl(this.dataSource);

  @override
  HomeDashboard getDashboard() {
    return dataSource.getDashboard();
  }
}
