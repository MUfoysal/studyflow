import 'package:flutter/material.dart';

import 'package:study_flow/core/theme/app_colors.dart';
import 'package:study_flow/core/theme/app_radius.dart';
import 'package:study_flow/core/theme/app_shadows.dart';

class OverallProgressCard extends StatelessWidget {
  final double progress;

  const OverallProgressCard({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primaryLight, AppColors.primarySoft],
        ),
        borderRadius: AppRadius.large,
        boxShadow: AppShadows.progress,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Overall Progress',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            'Flutter Learning',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 15),
          ClipRRect(
            borderRadius: AppRadius.progress,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: progress),
              duration: const Duration(milliseconds: 900),
              curve: Curves.easeOutCubic,
              builder: (context, value, _) {
                return LinearProgressIndicator(
                  value: value,
                  minHeight: 10,
                  backgroundColor: AppColors.cardBackground,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.primary,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
