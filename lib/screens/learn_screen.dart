

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_flow/models/lesson.dart';
import 'package:study_flow/screens/lesson_screen.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  double flutterProgress = 0.0;
  double dartProgress = 0.0;
  double gitProgress = 0.0;

  Future<double> getCourseProgress(
    String courseTitle,
    int totalLessons,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    final savedLessons =
        prefs.getStringList('completed_$courseTitle') ?? [];

    if (totalLessons == 0) {
      return 0.0;
    }

    return savedLessons.length / totalLessons;
  }

  Future<void> loadProgress() async {
    final flutter = await getCourseProgress(
      "Flutter Basics",
      flutterLessons.length,
    );

    final dart = await getCourseProgress(
      "Dart Programming",
      dartLessons.length,
    );

    final git = await getCourseProgress(
      "Git & GitHub",
      gitLessons.length,
    );

    if (!mounted) return;

    setState(() {
      flutterProgress = flutter;
      dartProgress = dart;
      gitProgress = git;
    });
  }

  @override
  void initState() {
    super.initState();
    loadProgress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        title: const Text("Learn"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Start Learning 📚",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "Choose a topic and continue your learning journey.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 24),

            _ContinueLearningBanner(
              onTap: () {
                // Continue Learning logic will be added later.
              },
            ),

            const SizedBox(height: 28),

            const Text(
              "Courses",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            _AnimatedEntry(
              delayMs: 0,
              child: _CourseCard(
                icon: Icons.flutter_dash,
                title: "Flutter Basics",
                lessonsCount: flutterLessons.length,
                progress: flutterProgress,
                onTap: () => _openCourse(
                  "Flutter Basics",
                  flutterLessons,
                ),
              ),
            ),

            const SizedBox(height: 14),

            _AnimatedEntry(
              delayMs: 90,
              child: _CourseCard(
                icon: Icons.code,
                title: "Dart Programming",
                lessonsCount: dartLessons.length,
                progress: dartProgress,
                onTap: () => _openCourse(
                  "Dart Programming",
                  dartLessons,
                ),
              ),
            ),

            const SizedBox(height: 14),

            _AnimatedEntry(
              delayMs: 180,
              child: _CourseCard(
                icon: Icons.source,
                title: "Git & GitHub",
                lessonsCount: gitLessons.length,
                progress: gitProgress,
                onTap: () => _openCourse(
                  "Git & GitHub",
                  gitLessons,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openCourse(
    String title,
    List<Lesson> lessons,
  ) async {
    final completedCount = await Navigator.push<int>(
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
Future<void> _openCourse(
  String title,
  List<Lesson> lessons,
) async {
  await Navigator.push<int>(
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

  await loadProgress();
}



}
}

class _ContinueLearningBanner extends StatelessWidget {
  final VoidCallback onTap;

  const _ContinueLearningBanner({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFDCFCE7),
            Color(0xFFC7F3D8),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.14),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          splashColor: Colors.white.withOpacity(0.3),
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                _ContinueLearningIcon(),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Continue Learning",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Flutter Basics",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ContinueLearningIcon extends StatelessWidget {
  const _ContinueLearningIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Icon(
        Icons.play_arrow_rounded,
        color: Colors.green,
        size: 30,
      ),
    );
  }
}

class _AnimatedEntry extends StatefulWidget {
  final Widget child;
  final int delayMs;

  const _AnimatedEntry({
    required this.child,
    required this.delayMs,
  });

  @override
  State<_AnimatedEntry> createState() => _AnimatedEntryState();
}

class _AnimatedEntryState extends State<_AnimatedEntry>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 420),
    );

    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    Future.delayed(
      Duration(milliseconds: widget.delayMs),
      () {
        if (mounted) {
          _controller.forward();
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: widget.child,
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final int lessonsCount;
  final double progress;
  final VoidCallback onTap;

  const _CourseCard({
    required this.icon,
    required this.title,
    required this.lessonsCount,
    required this.progress,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          splashColor: Colors.green.withOpacity(0.08),
          highlightColor: Colors.green.withOpacity(0.04),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFDCFCE7),
                            Color(0xFFBBF7D0),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.15),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Icon(
                        icon,
                        color: Colors.green,
                        size: 28,
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "$lessonsCount Lessons",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Icon(
                      Icons.arrow_forward_ios,
                      size: 17,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: TweenAnimationBuilder<double>(
                          tween: Tween<double>(
                            begin: 0,
                            end: progress,
                          ),
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeOutCubic,
                          builder: (
                            context,
                            value,
                            child,
                          ) {
                            return LinearProgressIndicator(
                              value: value,
                              minHeight: 7,
                              backgroundColor: Colors.grey.shade200,
                              color: Colors.green,
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Text(
                      "${(progress * 100).toInt()}%",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}