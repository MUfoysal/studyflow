import 'package:flutter/material.dart';

import 'package:study_flow/screens/main_screen.dart';
import 'package:study_flow/screens/roadmap_screen.dart';
import 'package:study_flow/screens/roadmap_detail_screen.dart';
import 'package:study_flow/screens/splash_screen.dart';

void main() {
  runApp(const StudyFlowApp());
}

class StudyFlowApp extends StatelessWidget {
  const StudyFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "StudyFlow",

      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF16A34A),
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF111827),
          elevation: 0,
        ),
      ),

      home: const SplashScreen(),

      routes: {
        '/main': (context) {
          return const MainScreen();
        },

        '/roadmap-detail': (context) {
          final arguments =
              ModalRoute.of(context)?.settings.arguments;

          if (arguments is! RoadmapStep) {
            return const Scaffold(
              body: Center(
                child: Text(
                  "Roadmap step data not found.",
                ),
              ),
            );
          }

          return RoadmapDetailScreen(
            step: arguments,
          );
        },
      },
    );
  }
}