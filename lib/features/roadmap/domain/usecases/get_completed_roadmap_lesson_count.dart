import 'package:study_flow/features/roadmap/domain/repositories/roadmap_repository.dart';

class GetCompletedRoadmapLessonCount {
  final RoadmapRepository repository;

  const GetCompletedRoadmapLessonCount(this.repository);

  Future<int> call(String stepTitle) {
    return repository.getCompletedRoadmapLessonCount(stepTitle);
  }
}