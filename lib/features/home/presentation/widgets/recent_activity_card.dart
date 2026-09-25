import 'package:flutter/material.dart';

import 'package:study_flow/core/theme/app_colors.dart';
import 'package:study_flow/core/theme/app_radius.dart';
import 'package:study_flow/core/theme/app_shadows.dart';
import 'package:study_flow/features/home/domain/entities/home_activity.dart';

class RecentActivityCard extends StatelessWidget {
  final List<HomeActivity> items;

  const RecentActivityCard({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: const BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: AppRadius.card,
        boxShadow: AppShadows.card,
      ),
      child: Column(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: AppColors.primaryLight,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _getActivityIcon(items[i].type),
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items[i].title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        items[i].time,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (i != items.length - 1) const Divider(height: 25),
          ],
        ],
      ),
    );
  }

  IconData _getActivityIcon(HomeActivityType type) {
    switch (type) {
      case HomeActivityType.completed:
        return Icons.check;

      case HomeActivityType.started:
        return Icons.menu_book_outlined;

      case HomeActivityType.achievement:
        return Icons.emoji_events_outlined;
    }
  }
}