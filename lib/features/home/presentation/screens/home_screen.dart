import 'package:flutter/material.dart';

import 'package:study_flow/features/home/presentation/models/activity_item.dart';
import 'package:study_flow/features/home/presentation/widgets/animated_entry.dart';
import 'package:study_flow/features/home/presentation/widgets/continue_learning_card.dart';
import 'package:study_flow/features/home/presentation/widgets/overall_progress_card.dart';
import 'package:study_flow/features/home/presentation/widgets/quick_access_card.dart';
import 'package:study_flow/features/home/presentation/widgets/recent_activity_card.dart';
import 'package:study_flow/features/home/presentation/widgets/todays_goal_card.dart';

class HomeScreen extends StatelessWidget {
  final ValueChanged<int> onNavigate;

  const HomeScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
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
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Ready to continue learning Flutter?',
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
            const SizedBox(height: 25),

            AnimatedEntry(
              delayMs: 0,
              child: const OverallProgressCard(progress: 0.35),
            ),

            const SizedBox(height: 30),

            const Text(
              'Continue Learning',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            AnimatedEntry(
              delayMs: 80,
              child: ContinueLearningCard(
                title: 'Flutter Basics',
                subtitle: 'Learn the fundamentals of Flutter development.',
                lessonLabel: 'Lesson 4 of 12',
                progress: 0.33,
                onPressed: () {
                  // Later: navigate to Learn screen.
                },
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Today's Goal",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            AnimatedEntry(
              delayMs: 160,
              child: const TodaysGoalCard(
                title: 'Complete 4 Lessons',
                subtitle: '2 of 4 completed',
                progress: 0.50,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Recent Activity',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            AnimatedEntry(
              delayMs: 240,
              child: const RecentActivityCard(
                items: [
                  ActivityItem(
                    icon: Icons.check,
                    title: 'Completed Stateless Widget',
                    time: 'Today · 10:30 AM',
                  ),
                  ActivityItem(
                    icon: Icons.menu_book_outlined,
                    title: 'Started Stateful Widget',
                    time: 'Today · 11:50 AM',
                  ),
                  ActivityItem(
                    icon: Icons.emoji_events_outlined,
                    title: 'Completed Flutter Basics',
                    time: 'Yesterday · 9:50 AM',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Quick Access',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
