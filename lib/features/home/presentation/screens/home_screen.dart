import 'package:flutter/material.dart';

import 'package:study_flow/core/theme/app_colors.dart';
import 'package:study_flow/features/home/data/datasources/home_local_data_source.dart';
import 'package:study_flow/features/home/data/repositories/home_repository_impl.dart';
import 'package:study_flow/features/home/domain/entities/home_dashboard.dart';
import 'package:study_flow/features/home/domain/usecases/get_home_dashboard.dart';
import 'package:study_flow/features/home/presentation/widgets/animated_entry.dart';
import 'package:study_flow/features/home/presentation/widgets/continue_learning_card.dart';
import 'package:study_flow/features/home/presentation/widgets/overall_progress_card.dart';
import 'package:study_flow/features/home/presentation/widgets/quick_access_card.dart';
import 'package:study_flow/features/home/presentation/widgets/recent_activity_card.dart';
import 'package:study_flow/features/home/presentation/widgets/todays_goal_card.dart';

class HomeScreen extends StatelessWidget {
  final ValueChanged<int> onNavigate;

  const HomeScreen({
    super.key,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final GetHomeDashboard getHomeDashboard = GetHomeDashboard(
      HomeRepositoryImpl(
        const HomeLocalDataSource(),
      ),
    );

    final HomeDashboard dashboard = getHomeDashboard();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('StudyFlow'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello, 👋',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Ready to continue learning Flutter?',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 25),

            AnimatedEntry(
              delayMs: 0,
              child: OverallProgressCard(
                progress: dashboard.overallProgress,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Continue Learning',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 15),

            AnimatedEntry(
              delayMs: 80,
              child: ContinueLearningCard(
                title: dashboard.learningTitle,
                subtitle: dashboard.learningSubtitle,
                lessonLabel: dashboard.lessonLabel,
                progress: dashboard.learningProgress,
                onPressed: () {
                  // Later: navigate to Learn screen.
                },
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Today's Goal",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 15),

            AnimatedEntry(
              delayMs: 160,
              child: TodaysGoalCard(
                title: 'Complete ${dashboard.dailyGoal.targetLessons} Lessons',
                subtitle:
                    '${dashboard.dailyGoal.completedLessons} of '
                    '${dashboard.dailyGoal.targetLessons} completed',
                progress: dashboard.dailyGoal.progress,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Recent Activity',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 15),

            AnimatedEntry(
              delayMs: 240,
              child: RecentActivityCard(
                items: dashboard.recentActivities,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Quick Access',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: QuickAccessCard(
                    icon: Icons.menu_book_outlined,
                    title: 'Learn',
                    onTap: () {
                      onNavigate(1);
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: QuickAccessCard(
                    icon: Icons.route_outlined,
                    title: 'Roadmap',
                    onTap: () {
                      onNavigate(2);
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: QuickAccessCard(
                    icon: Icons.code_outlined,
                    title: 'Project',
                    onTap: () {
                      onNavigate(3);
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: QuickAccessCard(
                    icon: Icons.person_outlined,
                    title: 'Profile',
                    onTap: () {},
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}