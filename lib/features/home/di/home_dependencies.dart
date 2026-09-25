import 'package:study_flow/features/home/data/datasources/home_local_data_source.dart';
import 'package:study_flow/features/home/data/repositories/home_repository_impl.dart';
import 'package:study_flow/features/home/domain/usecases/get_home_dashboard.dart';

class HomeDependencies {
  const HomeDependencies._();

  static GetHomeDashboard getHomeDashboard() {
    const HomeLocalDataSource dataSource = HomeLocalDataSource();

    final HomeRepositoryImpl repository = HomeRepositoryImpl(
      dataSource,
    );

    return GetHomeDashboard(repository);
  }
}