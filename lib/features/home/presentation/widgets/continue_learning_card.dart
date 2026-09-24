import 'package:flutter/material.dart';

import 'package:study_flow/core/theme/app_colors.dart';
import 'package:study_flow/core/theme/app_radius.dart';
import 'package:study_flow/core/theme/app_shadows.dart';

class ContinueLearningCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String lessonLabel;
  final double progress;
  final VoidCallback onPressed;

  const ContinueLearningCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.lessonLabel,
    required this.progress,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: AppRadius.card,
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.primary,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const Icon(Icons.menu_book_outlined, color: AppColors.primary),
              const SizedBox(width: 8),
              Text(
                lessonLabel,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                '${(progress * 100).toInt()}%',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: AppRadius.progress,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: progress),
              duration: const Duration(milliseconds: 900),
              curve: Curves.easeOutCubic,
              builder: (context, value, _) {
                return LinearProgressIndicator(
                  value: value,
                  minHeight: 8,
                  backgroundColor: AppColors.progressBackground,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.primary,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.cardBackground,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: const RoundedRectangleBorder(
                  borderRadius: AppRadius.button,
                ),
              ),
              child: const Text(
                'Continue Learning',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
