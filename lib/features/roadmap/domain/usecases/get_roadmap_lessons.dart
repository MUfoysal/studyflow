import 'package:study_flow/features/learn/domain/entities/learn_lesson.dart';
import 'package:study_flow/features/roadmap/domain/repositories/roadmap_repository.dart';

class GetRoadmapLessons {
  final RoadmapRepository repository;

  const GetRoadmapLessons(this.repository);

  List<LearnLesson> call(String stepTitle) {
    return repository.getRoadmapLessons(stepTitle);
  }
}