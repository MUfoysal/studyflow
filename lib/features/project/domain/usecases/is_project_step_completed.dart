import 'package:study_flow/features/project/domain/repositories/project_repository.dart';

class IsProjectStepCompleted {
  final ProjectRepository repository;

  IsProjectStepCompleted({
    required this.repository,
  });

  Future<bool> call(String stepId) {
    return repository.isProjectStepCompleted(stepId);
  }
}