import 'package:flutter/material.dart';

import 'package:study_flow/features/learn/presentation/widgets/continue_learning_icon.dart';

class ContinueLearningBanner extends StatelessWidget {
  final VoidCallback onTap;

  const ContinueLearningBanner({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF16A34A);
    const lightGreen = Color(0xFFDCFCE7);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: lightGreen,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFFBBF7D0),
          ),
        ),
        child: Row(
          children: [
            const ContinueLearningIcon(
              icon: Icons.play_arrow_rounded,
            ),

            const SizedBox(width: 14),

            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Continue Learning',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  SizedBox(height: 4),

                  Text(
                    'Continue where you left off',
                    style: TextStyle(
                      color: Color(0xFF757575),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: primaryGreen,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}