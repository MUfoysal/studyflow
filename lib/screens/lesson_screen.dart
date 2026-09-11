

import 'package:flutter/material.dart';
import 'package:study_flow/screens/lesson_details_screen.dart';
import 'package:study_flow/models/lesson.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  Future<void> loadCompletedLessons() async {
    final prefs = await SharedPreferences.getInstance();

    final savedLessons = prefs.getStringList('completed_${widget.title}') ?? [];
    setState(() {
      completedLessons.addAll(savedLessons.map((index) => int.parse(index)));
    });
  }

void initState() {
  super.initState();
  loadCompletedLessons();
}

  double flutterProgress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, completedLessons.length);
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: widget.lessons.length,
        itemBuilder: (context, index) {
          final lesson = widget.lessons[index];

          return Card(
            color: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: Color(0xFFDCFCE7)),
            ),
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LessonDetailsScreen(
                      courseTitle: widget.title,
                      lessonTitle: lesson.title,
                      lessonNumber: index + 1,
                      description: lesson.description,
                      keyPoints: lesson.keyPoints,
                      exampleCode: lesson.exampleCode,
                      onComplete: () async {
                        setState(() {
                          completedLessons.add(index);
                        });

                        final prefs = await SharedPreferences.getInstance();

                        await prefs.setStringList(
                          'completed_${widget.title}',
                          completedLessons
                              .map((index) => index.toString())
                              .toList(),
                        );
                      },
                    ),
                  ),
                );
              },
              leading: CircleAvatar(
                backgroundColor: completedLessons.contains(index)
                    ? Colors.green
                    : const Color(0xFFDCFCE7),
                child: completedLessons.contains(index)
                    ? const Icon(Icons.check, color: Colors.white)
                    : Text(
                        "${index + 1}",
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
              title: Text(
                lesson.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: completedLessons.contains(index)
                  ? const Icon(Icons.check_circle, color: Colors.green)
                  : const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.green,
                    ),
            ),
          );
        },
      ),
    );
  }
}
