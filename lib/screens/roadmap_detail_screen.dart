import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_flow/models/lesson.dart';
import 'package:study_flow/screens/lesson_screen.dart';
import 'package:study_flow/screens/roadmap_screen.dart';

class RoadmapDetailScreen extends StatefulWidget {
  final RoadmapStep step;

  const RoadmapDetailScreen({
    super.key,
    required this.step,
  });

  @override
  State<RoadmapDetailScreen> createState() =>
      _RoadmapDetailScreenState();
}

class _RoadmapDetailScreenState
    extends State<RoadmapDetailScreen> {
  double progress = 0.0;
  int completedLessons = 0;

  late final List<Lesson> lessons;

  @override
  void initState() {
    super.initState();

    lessons = _getLessons();

    _loadProgress();
  }

  List<Lesson> _getLessons() {
    switch (widget.step.title) {
      case "Dart Programming":
        return dartLessons;

      case "Flutter Basics":
        return flutterLessons;

      case "Git & GitHub":
        return gitLessons;

      default:
        return [];
    }
  }

  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();

    final savedLessons =
        prefs.getStringList(
          'completed_${widget.step.title}',
        ) ??
        [];

    final validCompletedLessons = savedLessons
        .map(int.tryParse)
        .whereType<int>()
        .where((index) => index >= 0 && index < lessons.length)
        .toSet();

    if (!mounted) return;

    setState(() {
      completedLessons = validCompletedLessons.length;

      progress = lessons.isEmpty
          ? 0.0
          : completedLessons / lessons.length;
    });
  }

  Future<void> _openLessons() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LessonScreen(
          title: widget.step.title,
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
      backgroundColor: const Color(0xFFF8FAF9),

      appBar: AppBar(
        title: Text(widget.step.title),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _HeaderCard(
              step: widget.step,
              progress: progress,
              completedLessons: completedLessons,
              totalLessons: lessons.length,
            ),

            const SizedBox(height: 24),

            const Text(
              "About This Step",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              widget.step.subtitle,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 28),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [
                const Text(
                  "Lessons",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "${lessons.length} Lessons",
                  style: const TextStyle(
                    color: Color(0xFF16A34A),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            if (lessons.isEmpty)
              _EmptyLessonsCard()
            else
              ...List.generate(
                lessons.length,
                (index) {
                  final lesson = lessons[index];

                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10),

                    child: _LessonPreviewCard(
                      number: index + 1,
                      title: lesson.title,
                    ),
                  );
                },
              ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed:
                    lessons.isEmpty ? null : _openLessons,

                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF16A34A),

                  foregroundColor: Colors.white,

                  disabledBackgroundColor:
                      Colors.grey.shade300,

                  elevation: 0,

                  padding:
                      const EdgeInsets.symmetric(
                    vertical: 15,
                  ),

                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(14),
                  ),
                ),

                child: Text(
                  completedLessons == lessons.length &&
                          lessons.isNotEmpty
                      ? "Review Lessons"
                      : "Start Learning",

                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  final RoadmapStep step;
  final double progress;
  final int completedLessons;
  final int totalLessons;

  const _HeaderCard({
    required this.step,
    required this.progress,
    required this.completedLessons,
    required this.totalLessons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),

      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFDCFCE7),
            Color(0xFFBBF7D0),
          ],
        ),

        borderRadius:
            BorderRadius.circular(22),

        boxShadow: [
          BoxShadow(
            color:
                Colors.green.withOpacity(0.12),
            blurRadius: 18,
            offset:
                const Offset(0, 7),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 7,
            ),

            decoration: BoxDecoration(
              color:
                  Colors.white.withOpacity(0.75),

              borderRadius:
                  BorderRadius.circular(10),
            ),

            child: Text(
              "STEP ${step.number}",

              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF15803D),
                letterSpacing: 1,
              ),
            ),
          ),

          const SizedBox(height: 18),

          Text(
            step.title,

            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            step.subtitle,

            style: const TextStyle(
              fontSize: 15,
              color: Colors.black54,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 22),

          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(10),

                  child:
                      TweenAnimationBuilder<double>(
                    tween: Tween<double>(
                      begin: 0,
                      end: progress,
                    ),

                    duration:
                        const Duration(
                      milliseconds: 700,
                    ),

                    curve:
                        Curves.easeOutCubic,

                    builder:
                        (context, value, _) {
                      return LinearProgressIndicator(
                        value: value,
                        minHeight: 8,
                        backgroundColor:
                            Colors.white,

                        valueColor:
                            const AlwaysStoppedAnimation<
                                Color>(
                          Color(0xFF16A34A),
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Text(
                "${(progress * 100).toInt()}%",

                style:
                    const TextStyle(
                  fontSize: 16,
                  fontWeight:
                      FontWeight.bold,
                  color:
                      Color(0xFF16A34A),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            "$completedLessons of $totalLessons lessons completed",

            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF15803D),
              fontWeight:
                  FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _LessonPreviewCard
    extends StatelessWidget {
  final int number;
  final String title;

  const _LessonPreviewCard({
    required this.number,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding:
          const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(16),

        border: Border.all(
          color: Colors.grey.shade200,
        ),

        boxShadow: [
          BoxShadow(
            color:
                Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset:
                const Offset(0, 4),
          ),
        ],
      ),

      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,

            alignment:
                Alignment.center,

            decoration: BoxDecoration(
              color:
                  const Color(0xFFDCFCE7),

              borderRadius:
                  BorderRadius.circular(12),
            ),

            child: Text(
              "$number",

              style:
                  const TextStyle(
                color:
                    Color(0xFF16A34A),
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Text(
              title,

              style:
                  const TextStyle(
                fontSize: 15,
                fontWeight:
                    FontWeight.w600,
              ),
            ),
          ),

          Icon(
            Icons.chevron_right_rounded,
            color:
                Colors.grey.shade400,
          ),
        ],
      ),
    );
  }
}

class _EmptyLessonsCard
    extends StatelessWidget {
  const _EmptyLessonsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding:
          const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(16),

        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),

      child: const Text(
        "No lessons available for this step yet.",
        style: TextStyle(
          color: Colors.black54,
        ),
      ),
    );
  }
}