import 'package:study_flow/features/learn/data/datasources/learn_local_data_source.dart';
import 'package:study_flow/features/learn/data/repositories/learn_repository_impl.dart';
import 'package:study_flow/features/learn/domain/usecases/get_learn_courses.dart';

class LearnDependencies {
  const LearnDependencies._();

  static GetLearnCourses getLearnCourses() {
    const localDataSource = LearnLocalDataSource();

    const repository = LearnRepositoryImpl(
      localDataSource: localDataSource,
    );

    return GetLearnCourses(repository);
  }
}