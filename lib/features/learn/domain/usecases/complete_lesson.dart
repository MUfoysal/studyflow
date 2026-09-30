import 'package:study_flow/features/learn/domain/repositories/learn_repository.dart';

class CompleteLesson {
  final LearnRepository repository;

  const CompleteLesson({
    required this.repository,
  });

  Future<void> call(
    String courseTitle,
    int lessonIndex,
  ) {
    return repository.completeLesson(
      courseTitle,
      lessonIndex,
    );
  }
}