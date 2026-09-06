import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:study_flow/screens/home_screen.dart';
import 'package:study_flow/screens/learn_screen.dart';
import 'package:study_flow/screens/project_screen.dart';
import 'package:study_flow/screens/roadmap_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  final List<Widget> screen = [
    const HomeScreen(),
    const LearnScreen(),
    const RoadmapScreen(),
    const ProjectScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("StudyFlow")),

      body: const Center(
        child: Text(
          "StudyFlow Home",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GNav(
          onTabChange: (index) {
            print("Selected tab: $index");
          },

          tabs: const [
            GButton(icon: Icons.home, text: 'Home'),
            GButton(icon: Icons.menu_book, text: 'Learn'),
            GButton(icon: Icons.route, text: 'Roadmap'),
            GButton(icon: Icons.code, text: 'Projects'),
          ],
        ),
      ),
    );
  }
}
