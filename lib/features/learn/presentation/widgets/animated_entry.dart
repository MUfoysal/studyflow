import 'package:flutter/material.dart';

class AnimatedEntry extends StatelessWidget {
  final Widget child;
  final int index;

  const AnimatedEntry({
    super.key,
    required this.child,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(
        begin: 0,
        end: 1,
      ),
      duration: Duration(
        milliseconds: 400 + (index * 100),
      ),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(
              0,
              20 * (1 - value),
            ),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}