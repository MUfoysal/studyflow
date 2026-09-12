
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_flow/models/lesson.dart';
import 'package:study_flow/screens/lesson_details_screen.dart';

class LessonScreen extends StatefulWidget {
  final String title;
  final int lessonCount;
  final List<Lesson> lessons;

  const LessonScreen({
    super.key,
    required this.title,
    required this.lessonCount,
    required this.lessons,
  });

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  final Set<int> completedLessons = {};

  @override
  void initState() {
    super.initState();
    loadCompletedLessons();
  }

  Future<void> loadCompletedLessons() async {
    final prefs = await SharedPreferences.getInstance();

    final savedLessons =
        prefs.getStringList('completed_${widget.title}') ?? [];

    final loadedLessons = <int>{};

    for (final value in savedLessons) {
      final index = int.tryParse(value);

      if (index != null &&
          index >= 0 &&
          index < widget.lessons.length) {
        loadedLessons.add(index);
      }
    }

    if (!mounted) return;

    setState(() {
      completedLessons
        ..clear()
        ..addAll(loadedLessons);
    });
  }

  Future<void> _markComplete(int index) async {
    if (completedLessons.contains(index)) return;

    setState(() {
      completedLessons.add(index);
    });

    final prefs = await SharedPreferences.getInstance();

    await prefs.setStringList(
      'completed_${widget.title}',
      completedLessons.map((i) => i.toString()).toList(),
    );
  }

  void _goBack() {
    Navigator.pop(
      context,
      completedLessons.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final progress = widget.lessons.isEmpty
        ? 0.0
        : completedLessons.length / widget.lessons.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _goBack,
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(
          16,
          10,
          16,
          16,
        ),
        itemCount: widget.lessons.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _ProgressHeader(
              completed: completedLessons.length,
              total: widget.lessons.length,
              progress: progress,
            );
          }

          final i = index - 1;
          final lesson = widget.lessons[i];
          final isLast = i == widget.lessons.length - 1;

          return _AnimatedEntry(
            delayMs: i * 60,
            child: _LessonTile(
              number: i + 1,
              title: lesson.title,
              isCompleted: completedLessons.contains(i),
              showConnector: !isLast,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LessonDetailsScreen(
                      courseTitle: widget.title,
                      lessonTitle: lesson.title,
                      lessonNumber: i + 1,
                      description: lesson.description,
                      keyPoints: lesson.keyPoints,
                      exampleCode: lesson.exampleCode,
                      onComplete: () => _markComplete(i),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _ProgressHeader extends StatelessWidget {
  final int completed;
  final int total;
  final double progress;

  const _ProgressHeader({
    required this.completed,
    required this.total,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFDCFCE7),
            Color(0xFFC7F3D8),
          ],
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.14),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$completed of $total lessons done",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF15803D),
                  ),
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(
                      begin: 0,
                      end: progress,
                    ),
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeOutCubic,
                    builder: (context, value, _) {
                      return LinearProgressIndicator(
                        value: value,
                        minHeight: 8,
                        backgroundColor: Colors.white,
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(
                          Color(0xFF16A34A),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Text(
            "${(progress * 100).toInt()}%",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF16A34A),
            ),
          ),
        ],
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
      duration: const Duration(milliseconds: 380),
    );

    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.05),
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

class _LessonTile extends StatelessWidget {
  final int number;
  final String title;
  final bool isCompleted;
  final bool showConnector;
  final VoidCallback onTap;

  const _LessonTile({
    required this.number,
    required this.title,
    required this.isCompleted,
    required this.showConnector,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: isCompleted
                      ? Colors.green
                      : Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
              ),
              if (showConnector)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(
                      vertical: 4,
                    ),
                    color: isCompleted
                        ? Colors.green.shade200
                        : Colors.grey.shade200,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFFDCFCE7),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: onTap,
                  splashColor: Colors.green.withOpacity(0.08),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: isCompleted
                              ? Colors.green
                              : const Color(0xFFDCFCE7),
                          child: isCompleted
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                )
                              : Text(
                                  "$number",
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Icon(
                          isCompleted
                              ? Icons.check_circle
                              : Icons.arrow_forward_ios,
                          size: isCompleted ? 20 : 16,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
