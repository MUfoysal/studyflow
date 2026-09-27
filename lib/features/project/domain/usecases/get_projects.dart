
import 'package:study_flow/features/project/domain/entities/project.dart';
import 'package:study_flow/features/project/domain/repositories/project_repository.dart';

class GetProjects {
  final ProjectRepository repository;

  GetProjects({
    required this.repository,
  });

  Future<List<Project>> call() {
    return repository.getProjects();
  }
}
