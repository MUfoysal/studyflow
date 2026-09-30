import 'package:shared_preferences/shared_preferences.dart';

class RoadmapLocalDataSource {
  Future<List<int>> getCompletedLessonIndexes(
    String stepTitle,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    final completedIndexes =
        prefs.getStringList('completed_$stepTitle') ?? [];

    return completedIndexes
        .map(int.tryParse)
        .whereType<int>()
        .toList();
  }
}