import 'package:study_flow/features/project/data/datasources/project_local_data_source.dart';
import 'package:study_flow/features/project/data/repositories/project_repository_impl.dart';
import 'package:study_flow/features/project/domain/repositories/project_repository.dart';
import 'package:study_flow/features/project/domain/usecases/get_project_by_id.dart';
import 'package:study_flow/features/project/domain/usecases/get_project_progress.dart';
import 'package:study_flow/features/project/domain/usecases/get_projects.dart';
import 'package:study_flow/features/project/domain/usecases/complete_project_step.dart';
import 'package:study_flow/features/project/domain/usecases/is_project_step_completed.dart';

class ProjectDependencies {
  static ProjectLocalDataSource createLocalDataSource() {
    return ProjectLocalDataSource();
  }

  static ProjectRepository createRepository(
    ProjectLocalDataSource localDataSource,
  ) {
    return ProjectRepositoryImpl(localDataSource: localDataSource);
  }

  static GetProjects createGetProjects(ProjectRepository repository) {
    return GetProjects(repository: repository);
  }

  static GetProjectById createGetProjectById(ProjectRepository repository) {
    return GetProjectById(repository: repository);
  }

  static GetProjectProgress createGetProjectProgress(
    ProjectRepository repository,
  ) {
    return GetProjectProgress(repository: repository);
  }

  static IsProjectStepCompleted createIsProjectStepCompleted(
    ProjectRepository repository,
  ) {
    return IsProjectStepCompleted(repository: repository);
  }

  static CompleteProjectStep createCompleteProjectStep(
    ProjectRepository repository,
  ) {
    return CompleteProjectStep(repository: repository);
  }
}
