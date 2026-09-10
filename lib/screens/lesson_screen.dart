import 'package:flutter/material.dart';
import 'package:study_flow/screens/lesson_details_screen.dart';
import 'package:study_flow/models/lesson.dart';

class LessonScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(10),

        itemCount: lessons.length,

        itemBuilder: (context, index) {
          final lesson = lessons[index];

          return Card(
            color: Colors.white,
            elevation: 0,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(
                color: Color(0xFFDCFCE7),
              ),
            ),

            margin: const EdgeInsets.only(bottom: 12),

            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LessonDetailsScreen(
                      courseTitle: title,
                      lessonTitle: lesson.title,
                      lessonNumber: index + 1,
                      description: lesson.description,
                      keyPoints: lesson.keyPoints,
                    ),
                  ),
                );
              },

              leading: CircleAvatar(
                backgroundColor: const Color(0xFFDCFCE7),

                child: Text(
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

              trailing: const Icon(
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