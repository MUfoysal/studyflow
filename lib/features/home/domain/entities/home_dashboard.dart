import 'home_daily_goal.dart';
import 'home_activity.dart';

class HomeDashboard {
  final double overallProgress;

  final String learningTitle;
  final String learningSubtitle;
  final int currentLesson;
  final int totalLessons;
  final double learningProgress;

  final HomeDailyGoal dailyGoal;

  final List<HomeActivity> recentActivities;

  const HomeDashboard({
    required this.overallProgress,
    required this.learningTitle,
    required this.learningSubtitle,
    required this.currentLesson,
    required this.totalLessons,
    required this.learningProgress,
    required this.dailyGoal,
    required this.recentActivities,
  });

  String get lessonLabel {
    return 'Lesson $currentLesson of $totalLessons';
  }
}
