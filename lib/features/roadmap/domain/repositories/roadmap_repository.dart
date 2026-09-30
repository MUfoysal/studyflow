import 'package:study_flow/features/learn/domain/entities/learn_lesson.dart';
import 'package:study_flow/features/roadmap/domain/entities/roadmap_step.dart';

abstract class RoadmapRepository {
  Future<List<RoadmapStep>> getRoadmapSteps();

  Future<bool> isRoadmapStepCompleted(
    RoadmapStep step,
  );

  List<LearnLesson> getRoadmapLessons(
    String stepTitle,
  );

  Future<int> getCompletedRoadmapLessonCount(
    String stepTitle,
  );
}