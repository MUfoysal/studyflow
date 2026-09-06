import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("studyFlow"),
      ),
      body: Center(
        child: Text("StudyFlow Home",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),)
      ),
    );
  }
}
