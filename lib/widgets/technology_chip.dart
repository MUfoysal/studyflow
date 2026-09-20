import 'package:flutter/material.dart';

class TechnologyChip extends StatelessWidget {
  final String technology;

  const TechnologyChip({
    super.key,
    required this.technology,
  });

  static const _fill = Color(0xFFF0FDF4);
  static const _ink = Color(0xFF166534);
  static const _border = Color(0x33166534); // same ink, ~20% alpha
  static const _dot = Color(0x99166534); // same ink, ~60% alpha

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: _fill,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: _border),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 7, 14, 7),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ExcludeSemantics(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: _dot,
                  shape: BoxShape.circle,
                ),
                child: SizedBox.square(dimension: 6),
              ),
            ),
            const SizedBox(width: 7),
            Flexible(
              child: Text(
                technology,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.1,
                  height: 1.2,
                  color: _ink,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}