import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LessonDetailsScreen extends StatefulWidget {
  final String courseTitle;
  final String lessonTitle;
  final int lessonNumber;
  final String description;
  final List<String> keyPoints;
  final String exampleCode;

  const LessonDetailsScreen({
    super.key,
    required this.courseTitle,
    required this.lessonTitle,
    required this.lessonNumber,
    required this.description,
    required this.keyPoints,
    required this.exampleCode,
  });

  @override
  State<LessonDetailsScreen> createState() => _LessonDetailsScreenState();
}

class _LessonDetailsScreenState extends State<LessonDetailsScreen> {
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.lessonTitle)),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.courseTitle,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              widget.lessonTitle,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              "What you will learn?",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            Text(
              widget.description,
              style: TextStyle(fontSize: 16, height: 1.6, color: Colors.grey),
            ),

            SizedBox(height: 24),

            Text(
              "Key Points",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.keyPoints.map((point) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "• $point",
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 12),
            Text(
              "Example",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(text: widget.exampleCode),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Code copied"),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                      icon: Icon(Icons.copy, color: Colors.white, size: 20),
                    ),
                  ),
                  Text(
                    widget.exampleCode,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      height: 1.5,
                      fontFamily: "monospace",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isCompleted = true;
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Lesson completed!"),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isCompleted ? Colors.green : Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  isCompleted ? "Completed ✓" : "Mark as Complete",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
