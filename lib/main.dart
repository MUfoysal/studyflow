import 'package:flutter/material.dart';
import 'package:study_flow/screens/main_screen.dart';

void main() {
  runApp(studyFlowApp());
}
class studyFlowApp extends StatelessWidget {
  const studyFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "studyFlow",
      home: MainScreen()
    );
  }
}