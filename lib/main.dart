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

      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,

        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF16A34A),
        ),

        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF111827),
          elevation:0,
        ),
        
      ),

      home: MainScreen()
    );
  }
}