import 'package:study_flow/features/learn/domain/repositories/learn_repository.dart';

class GetCompletedLessonIndexes {
  final LearnRepository repository;

  const GetCompletedLessonIndexes({
    required this.repository,
  });

  Future<List<int>> call(String courseTitle) {
    return repository.getCompletedLessonIndexes(courseTitle);
  }
}