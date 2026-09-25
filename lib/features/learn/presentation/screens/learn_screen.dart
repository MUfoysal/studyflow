import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:study_flow/features/learn/di/learn_dependencies.dart';
import 'package:study_flow/features/learn/domain/entities/learn_lesson.dart';
import 'package:study_flow/features/learn/presentation/widgets/animated_entry.dart';
import 'package:study_flow/features/learn/presentation/widgets/continue_learning_banner.dart';
import 'package:study_flow/features/learn/presentation/widgets/course_card.dart';
import 'package:study_flow/screens/lesson_screen.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  final getLearnCourses = LearnDependencies.getLearnCourses();

  double flutterProgress = 0.0;
  double dartProgress = 0.0;
  double gitProgress = 0.0;

  List<LearnLesson> flutterLessons = [];
  List<LearnLesson> dartLessons = [];
  List<LearnLesson> gitLessons = [];

  @override
  void initState() {
    super.initState();

    flutterLessons = getLearnCourses.getFlutterLessons();
    dartLessons = getLearnCourses.getDartLessons();
    gitLessons = getLearnCourses.getGitLessons();

    _loadProgress();
  }

  Future<double> _getCourseProgress(
    String courseTitle,
    int totalLessons,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    final savedLessons =
        prefs.getStringList('completed_$courseTitle') ?? [];

    final completedIndexes = <int>{};

    for (final value in savedLessons) {
      final index = int.tryParse(value);

      if (index != null &&
          index >= 0 &&
          index < totalLessons) {
        completedIndexes.add(index);
      }
    }

    if (totalLessons == 0) {
      return 0.0;
    }

    return completedIndexes.length / totalLessons;
  }

  Future<void> _loadProgress() async {
    final flutter = await _getCourseProgress(
      'Flutter Basics',
      flutterLessons.length,
    );

    final dart = await _getCourseProgress(
      'Dart Programming',
      dartLessons.length,
    );

    final git = await _getCourseProgress(
      'Git & GitHub',
      gitLessons.length,
    );

    if (!mounted) return;

    setState(() {
      flutterProgress = flutter;
      dartProgress = dart;
      gitProgress = git;
    });
  }

  Future<void> _openCourse(
    String title,
    List<LearnLesson> lessons,
  ) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LessonScreen(
          title: title,
          lessonCount: lessons.length,
          lessons: lessons,
        ),
      ),
    );

    if (!mounted) return;

    await _loadProgress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AnimatedEntry(
                index: 0,
                child: Text(
                  'Start Learning 📚',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const AnimatedEntry(
                index: 1,
                child: Text(
                  'Build your skills step by step.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              AnimatedEntry(
                index: 2,
                child: ContinueLearningBanner(
                  onTap: () {
                    _openCourse(
                      'Flutter Basics',
                      flutterLessons,
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Courses',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 14),
              AnimatedEntry(
                index: 3,
                child: CourseCard(
                  title: 'Flutter Basics',
                  lessonCount: flutterLessons.length,
                  progress: flutterProgress,
                  icon: Icons.flutter_dash_rounded,
                  onTap: () {
                    _openCourse(
                      'Flutter Basics',
                      flutterLessons,
                    );
                  },
                ),
              ),
              const SizedBox(height: 14),
              AnimatedEntry(
                index: 4,
                child: CourseCard(
                  title: 'Dart Programming',
                  lessonCount: dartLessons.length,
                  progress: dartProgress,
                  icon: Icons.code_rounded,
                  onTap: () {
                    _openCourse(
                      'Dart Programming',
                      dartLessons,
                    );
                  },
                ),
              ),
              const SizedBox(height: 14),
              AnimatedEntry(
                index: 5,
                child: CourseCard(
                  title: 'Git & GitHub',
                  lessonCount: gitLessons.length,
                  progress: gitProgress,
                  icon: Icons.account_tree_rounded,
                  onTap: () {
                    _openCourse(
                      'Git & GitHub',
                      gitLessons,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}