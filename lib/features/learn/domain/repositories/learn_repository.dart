import 'package:study_flow/features/learn/domain/entities/learn_lesson.dart';

abstract class LearnRepository {
  List<LearnLesson> getFlutterLessons();

  List<LearnLesson> getDartLessons();

  List<LearnLesson> getGitLessons();
}