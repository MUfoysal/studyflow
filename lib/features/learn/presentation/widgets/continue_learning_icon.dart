import 'package:flutter/material.dart';

class ContinueLearningIcon extends StatelessWidget {
  final IconData icon;

  const ContinueLearningIcon({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFC7F3D8),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Icon(
        icon,
        color: const Color(0xFF16A34A),
        size: 24,
      ),
    );
  }
}