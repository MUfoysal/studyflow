
import 'package:study_flow/features/project/domain/entities/project.dart';
import 'package:study_flow/features/project/domain/repositories/project_repository.dart';

class GetProjectById {
  final ProjectRepository repository;

  GetProjectById({
    required this.repository,
  });

  Future<Project?> call(String projectId) {
    return repository.getProjectById(projectId);
  }
}
