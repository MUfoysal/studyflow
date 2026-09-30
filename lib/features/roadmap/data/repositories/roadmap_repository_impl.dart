import 'package:study_flow/features/learn/domain/entities/learn_lesson.dart';
import 'package:study_flow/features/learn/domain/repositories/learn_repository.dart';
import 'package:study_flow/features/roadmap/domain/entities/roadmap_step.dart';
import 'package:study_flow/features/roadmap/domain/repositories/roadmap_repository.dart';

class RoadmapRepositoryImpl implements RoadmapRepository {
  final LearnRepository learnRepository;

  const RoadmapRepositoryImpl({
    required this.learnRepository,
  });

  @override
  Future<List<RoadmapStep>> getRoadmapSteps() async {
    return const [
      RoadmapStep(
        number: '01',
        title: 'Dart Programming',
        subtitle: 'Learn the fundamentals of Dart.',
      ),
      RoadmapStep(
        number: '02',
        title: 'Flutter Basics',
        subtitle: 'Learn widgets and build Flutter UI.',
      ),
      RoadmapStep(
        number: '03',
        title: 'Git & GitHub',
        subtitle: 'Learn version control and collaboration.',
      ),
    ];
  }

  @override
  Future<bool> isRoadmapStepCompleted(
    RoadmapStep step,
  ) async {
    final completedLessonCount =
        await getCompletedRoadmapLessonCount(step.title);

    final lessons = getRoadmapLessons(step.title);

    if (lessons.isEmpty) {
      return false;
    }

    return completedLessonCount == lessons.length;
  }

  @override
  List<LearnLesson> getRoadmapLessons(
    String stepTitle,
  ) {
    return switch (stepTitle) {
      'Dart Programming' => learnRepository.getDartLessons(),
      'Flutter Basics' => learnRepository.getFlutterLessons(),
      'Git & GitHub' => learnRepository.getGitLessons(),
      _ => const [],
    };
  }

  @override
  Future<int> getCompletedRoadmapLessonCount(
    String stepTitle,
  ) async {
    final lessons = getRoadmapLessons(stepTitle);

    if (lessons.isEmpty) {
      return 0;
    }

    final completedIndexes =
        await learnRepository.getCompletedLessonIndexes(
      stepTitle,
    );

    final validCompletedIndexes = completedIndexes
        .where(
          (index) =>
              index >= 0 &&
              index < lessons.length,
        )
        .toSet();

    return validCompletedIndexes.length;
  }
}