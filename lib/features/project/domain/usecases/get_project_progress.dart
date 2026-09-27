import 'package:study_flow/features/project/domain/entities/project.dart';
import 'package:study_flow/features/project/domain/entities/project_progress.dart';
import 'package:study_flow/features/project/domain/repositories/project_repository.dart';

class GetProjectProgress {
  final ProjectRepository repository;

  GetProjectProgress({required this.repository});

  Future<ProjectProgress> call(Project project) {
    return repository.getProjectProgress(project);
  }
}
