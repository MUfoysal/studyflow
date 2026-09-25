import 'package:study_flow/features/learn/domain/entities/learn_lesson.dart';
import 'package:study_flow/features/learn/domain/repositories/learn_repository.dart';

class GetLearnCourses {
  final LearnRepository repository;

  const GetLearnCourses(this.repository);

  List<LearnLesson> getFlutterLessons() {
    return repository.getFlutterLessons();
  }

  List<LearnLesson> getDartLessons() {
    return repository.getDartLessons();
  }

  List<LearnLesson> getGitLessons() {
    return repository.getGitLessons();
  }
}