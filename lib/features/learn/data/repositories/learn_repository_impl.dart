import 'package:study_flow/features/learn/data/datasources/learn_local_data_source.dart';
import 'package:study_flow/features/learn/domain/entities/learn_lesson.dart';
import 'package:study_flow/features/learn/domain/repositories/learn_repository.dart';

class LearnRepositoryImpl implements LearnRepository {
  final LearnLocalDataSource localDataSource;

  const LearnRepositoryImpl({
    required this.localDataSource,
  });

  @override
  List<LearnLesson> getFlutterLessons() {
    return localDataSource.getFlutterLessons();
  }

  @override
  List<LearnLesson> getDartLessons() {
    return localDataSource.getDartLessons();
  }

  @override
  List<LearnLesson> getGitLessons() {
    return localDataSource.getGitLessons();
  }
}
