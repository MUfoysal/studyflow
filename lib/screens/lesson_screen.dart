import 'package:flutter/material.dart';

class LessonScreen extends StatelessWidget {
  final String title;
  final int lessonCount;

  const LessonScreen({
    super.key,
    required this.title,
    required this.lessonCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: lessonCount,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                child: Text("${index + 1}"),
              ),
              title: Text("Lesson ${index + 1}"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
          );
        },
      ),
    );
  }
}