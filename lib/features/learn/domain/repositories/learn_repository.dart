import 'package:study_flow/features/learn/domain/entities/learn_lesson.dart';

abstract class LearnRepository {
  List<LearnLesson> getFlutterLessons();

  List<LearnLesson> getDartLessons();

  List<LearnLesson> getGitLessons();

  Future<List<int>> getCompletedLessonIndexes(String courseTitle);

  Future<void> completeLesson(
    String courseTitle,
    int lessonIndex,
  );
}