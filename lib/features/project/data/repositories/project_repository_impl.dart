
import 'package:study_flow/features/project/data/datasources/project_local_data_source.dart';
import 'package:study_flow/features/project/domain/entities/project.dart';
import 'package:study_flow/features/project/domain/entities/project_progress.dart';
import 'package:study_flow/features/project/domain/repositories/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectLocalDataSource localDataSource;

  ProjectRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<List<Project>> getProjects() {
    return localDataSource.getProjects();
  }

  @override
  Future<Project?> getProjectById(String projectId) {
    return localDataSource.getProjectById(projectId);
  }

  @override
  Future<ProjectProgress> getProjectProgress(Project project) async {
    final completedStepIds = await localDataSource.getCompletedStepIds();

    final completedSteps = project.steps
        .where((step) => completedStepIds.contains(step.id))
        .length;

    final totalSteps = project.steps.length;

    final ProjectStatus status;

    if (completedSteps == 0) {
      status = ProjectStatus.notStarted;
    } else if (completedSteps == totalSteps) {
      status = ProjectStatus.completed;
    } else {
      status = ProjectStatus.inProgress;
    }

    return ProjectProgress(
      projectId: project.id,
      completedSteps: completedSteps,
      totalSteps: totalSteps,
      status: status,
    );
  }

  @override
  Future<bool> isProjectStepCompleted(String stepId) {
    return localDataSource.isProjectStepCompleted(stepId);
  }

  @override
  Future<void> completeProjectStep(String stepId) {
    return localDataSource.completeProjectStep(stepId);
  }
}
