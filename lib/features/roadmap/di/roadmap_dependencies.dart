import 'package:study_flow/features/learn/di/learn_dependencies.dart';
import 'package:study_flow/features/roadmap/data/repositories/roadmap_repository_impl.dart';
import 'package:study_flow/features/roadmap/domain/repositories/roadmap_repository.dart';
import 'package:study_flow/features/roadmap/domain/usecases/get_completed_roadmap_lesson_count.dart';
import 'package:study_flow/features/roadmap/domain/usecases/get_roadmap_lessons.dart';
import 'package:study_flow/features/roadmap/domain/usecases/get_roadmap_steps.dart';
import 'package:study_flow/features/roadmap/domain/usecases/is_roadmap_step_completed.dart';

class RoadmapDependencies {
  const RoadmapDependencies._();

  static RoadmapRepository createRepository() {
    final learnRepository =
        LearnDependencies.getLearnCourses().repository;

    return RoadmapRepositoryImpl(
      learnRepository: learnRepository,
    );
  }

  static GetRoadmapSteps createGetRoadmapSteps(
    RoadmapRepository repository,
  ) {
    return GetRoadmapSteps(repository);
  }

  static IsRoadmapStepCompleted createIsRoadmapStepCompleted(
    RoadmapRepository repository,
  ) {
    return IsRoadmapStepCompleted(repository);
  }

  static GetRoadmapLessons createGetRoadmapLessons(
    RoadmapRepository repository,
  ) {
    return GetRoadmapLessons(repository);
  }

  static GetCompletedRoadmapLessonCount
      createGetCompletedRoadmapLessonCount(
    RoadmapRepository repository,
  ) {
    return GetCompletedRoadmapLessonCount(repository);
  }
}