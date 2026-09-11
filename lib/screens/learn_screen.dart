import 'package:flutter/material.dart';
import 'package:study_flow/screens/lesson_screen.dart';
import 'package:study_flow/models/lesson.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  double flutterProgress = 0.0;

  Future<double> getCourseProgress(String courseTitle, int totalLessons) async {
    final prefs = await SharedPreferences.getInstance();

    final savedLessons = prefs.getStringList('completed_$courseTitle') ?? [];

    if (totalLessons == 0) {
      return 0.0;
    }

    return savedLessons.length / totalLessons;
  }

  Future<void> loadProgress() async {
    final progress = await getCourseProgress(
      "Flutter Basics",
      flutterLessons.length,
    );
    setState(() {
      flutterProgress = progress;
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
      appBar: AppBar(title: const Text("Learn")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              "Start Learning 📚",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text(
              "Choose a topic and continue your learning journey.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 24),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: const Color(0xFFDCFCE7),
                borderRadius: BorderRadius.circular(20),
              ),

              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),

                    child: const Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),

                  const SizedBox(width: 16),

                  const Expanded(
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
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),

                  const Icon(Icons.arrow_forward_ios, size: 18),
                ],
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              "Courses",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            _courseCard(
              icon: Icons.flutter_dash,
              title: "Flutter Basics",
              lessons: flutterLessons,
              progress: flutterProgress,
            ),

            const SizedBox(height: 14),

            _courseCard(
              icon: Icons.code,
              title: "Dart Programming",
              lessons: [],
              progress: 0.20,
            ),

            const SizedBox(height: 14),

            _courseCard(
              icon: Icons.source,
              title: "Git & GitHub",
              lessons: [],
              progress: 0.10,
            ),
          ],
        ),
      ),
    );
  }

  Widget _courseCard({
    required IconData icon,
    required String title,
    required List<Lesson> lessons,
    required double progress,
  }) {
    return InkWell(
      onTap: () async {
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
        if (completedCount != null && lessons.isNotEmpty) {
          setState(() {
            if (title == "Flutter Basics") {
              flutterProgress = completedCount / lessons.length;
            }
          });
        }
      },

      borderRadius: BorderRadius.circular(18),

      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),

          border: Border.all(color: Colors.grey.shade200),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),

                  decoration: BoxDecoration(
                    color: const Color(0xFFDCFCE7),
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: Icon(icon, color: Colors.green, size: 28),
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
                        "${lessons.length} Lessons",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                const Icon(Icons.arrow_forward_ios, size: 17),
              ],
            ),

            const SizedBox(height: 18),

            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 7,

                    borderRadius: BorderRadius.circular(10),

                    backgroundColor: Colors.grey.shade200,
                    color: Colors.green,
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
    );
  }
}
