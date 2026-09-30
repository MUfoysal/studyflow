import 'package:study_flow/features/roadmap/domain/entities/roadmap_step.dart';
import 'package:study_flow/features/roadmap/domain/repositories/roadmap_repository.dart';

class GetRoadmapSteps {
  final RoadmapRepository repository;

  const GetRoadmapSteps(this.repository);

  Future<List<RoadmapStep>> call() {
    return repository.getRoadmapSteps();
  }
}