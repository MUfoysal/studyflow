import 'package:study_flow/features/project/domain/entities/project.dart';
import 'package:study_flow/features/project/domain/entities/project_progress.dart';

abstract class ProjectRepository {
  Future<List<Project>> getProjects();

  Future<Project?> getProjectById(String projectId);

  Future<ProjectProgress> getProjectProgress(Project project);

  Future<bool> isProjectStepCompleted(String stepId);

  Future<void> completeProjectStep(String stepId);
}