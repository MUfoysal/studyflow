import 'package:study_flow/features/roadmap/domain/entities/roadmap_step.dart';
import 'package:study_flow/features/roadmap/domain/repositories/roadmap_repository.dart';

class IsRoadmapStepCompleted {
  final RoadmapRepository repository;

  const IsRoadmapStepCompleted(this.repository);

  Future<bool> call(RoadmapStep step) {
    return repository.isRoadmapStepCompleted(step);
  }
}
