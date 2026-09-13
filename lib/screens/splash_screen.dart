import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _openApp();
  }

  Future<void> _openApp() async {
    await Future.delayed(
      const Duration(seconds: 4),
    );

    if (!mounted) return;

    Navigator.pushReplacementNamed(
      context,
      '/main',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFF16A34A),
                borderRadius: BorderRadius.circular(26),
              ),
              child: const Icon(
                Icons.school_rounded,
                color: Colors.white,
                size: 50,
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "StudyFlow",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: Color(0xFF111827),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "LEARN • BUILD • GROW",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF16A34A),
                letterSpacing: 2.5,
              ),
            ),

            const SizedBox(height: 32),

            LoadingAnimationWidget.staggeredDotsWave(
              color: const Color(0xFF16A34A),
              size: 38,
            ),
          ],
        ),
      ),
    );
  }
}