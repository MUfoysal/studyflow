
import 'package:flutter/material.dart';

class LessonDetailsScreen extends StatelessWidget {
  final String courseTitle;
  final String lessonTitle;
  final int lessonNumber;
  final String description;
  final List<String> keyPoints;

  const LessonDetailsScreen({
    super.key,
    required this.courseTitle,
    required this.lessonTitle,
    required this.lessonNumber,
    required this.description,
    required this.keyPoints,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lessonTitle)),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              courseTitle,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              lessonTitle,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              "What you will learn?",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            Text(
              description,
              style: TextStyle(fontSize: 16, height: 1.6, color: Colors.grey),
            ),

            SizedBox(height: 24),

            Text(
              "Key Points",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

        Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: keyPoints.map((point) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        "• $point",
        style: const TextStyle(
          fontSize: 16,
          height: 1.5,
        ),
      ),
    );
  }).toList(),
),
          ],
        ),
      ),
    );
  }
}
