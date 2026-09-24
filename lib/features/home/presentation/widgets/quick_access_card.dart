import 'package:flutter/material.dart';

import 'package:study_flow/core/theme/app_colors.dart';
import 'package:study_flow/core/theme/app_radius.dart';
import 'package:study_flow/core/theme/app_shadows.dart';

class QuickAccessCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const QuickAccessCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: AppRadius.medium,
        boxShadow: AppShadows.quickAccess,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: AppRadius.medium,
        child: InkWell(
          borderRadius: AppRadius.medium,
          onTap: onTap,
          splashColor: AppColors.primaryLight,
          highlightColor: AppColors.primaryLight,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: AppColors.primaryLight,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 26, color: AppColors.primary),
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
