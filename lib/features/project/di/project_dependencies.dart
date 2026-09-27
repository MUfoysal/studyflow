
import 'package:study_flow/features/project/data/datasources/project_local_data_source.dart';
import 'package:study_flow/features/project/data/repositories/project_repository_impl.dart';
import 'package:study_flow/features/project/domain/repositories/project_repository.dart';
import 'package:study_flow/features/project/domain/usecases/get_project_by_id.dart';
import 'package:study_flow/features/project/domain/usecases/get_projects.dart';

class ProjectDependencies {
  static ProjectLocalDataSource createLocalDataSource() {
    return ProjectLocalDataSource();
  }

  static ProjectRepository createRepository(
    ProjectLocalDataSource localDataSource,
  ) {
    return ProjectRepositoryImpl(
      localDataSource: localDataSource,
    );
  }

  static GetProjects createGetProjects(
    ProjectRepository repository,
  ) {
    return GetProjects(
      repository: repository,
    );
  }

  static GetProjectById createGetProjectById(
    ProjectRepository repository,
  ) {
    return GetProjectById(
      repository: repository,
    );
  }
}
