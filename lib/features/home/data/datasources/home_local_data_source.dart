import '../../domain/entities/home_activity.dart';
import '../../domain/entities/home_daily_goal.dart';
import '../../domain/entities/home_dashboard.dart';

class HomeLocalDataSource {
  const HomeLocalDataSource();

  HomeDashboard getDashboard() {
    return const HomeDashboard(
      overallProgress: 0.35,
      learningTitle: 'Flutter Basics',
      learningSubtitle: 'Learn the fundamentals of Flutter development.',
      currentLesson: 4,
      totalLessons: 12,
      learningProgress: 0.33,
      dailyGoal: HomeDailyGoal(targetLessons: 4, completedLessons: 2),
      recentActivities: [
        HomeActivity(
          type: HomeActivityType.completed,
          title: 'Completed Stateless Widget',
          time: 'Today · 10:30 AM',
        ),
        HomeActivity(
          type: HomeActivityType.started,
          title: 'Started Stateful Widget',
          time: 'Today · 11:50 AM',
        ),
        HomeActivity(
          type: HomeActivityType.achievement,
          title: 'Completed Flutter Basics',
          time: 'Yesterday · 9:50 AM',
        ),
      ],
    );
  }
}
