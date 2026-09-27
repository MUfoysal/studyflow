import 'package:study_flow/features/project/domain/repositories/project_repository.dart';

class CompleteProjectStep {
  final ProjectRepository repository;

  CompleteProjectStep({
    required this.repository,
  });

  Future<void> call(String stepId) {
    return repository.completeProjectStep(stepId);
  }
}