import 'package:flutter/material.dart';

class CodeBlock extends StatelessWidget {
  final String code;

  const CodeBlock({
    super.key,
    required this.code,
  });

  static const _ink = Color(0xFF111827);
  static const _edge = Color(0x1FFFFFFF); // white, ~12% alpha
  static const _bar = Color(0x0AFFFFFF); // white, ~4% alpha
  static const _shadow = Color(0x2E111827); // same ink, ~18% alpha

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: _ink,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _edge),
        boxShadow: const [
          BoxShadow(
            color: _shadow,
            blurRadius: 24,
            spreadRadius: -6,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ExcludeSemantics(
            child: Container(
              height: 36,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: const BoxDecoration(
                color: _bar,
                border: Border(bottom: BorderSide(color: _edge)),
              ),
              child: const Row(
                children: [
                  _Dot(),
                  SizedBox(width: 6),
                  _Dot(),
                  SizedBox(width: 6),
                  _Dot(),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(16),
            child: SelectableText(
              code,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                height: 1.6,
                fontFamily: 'monospace',
                fontFamilyFallback: ['Menlo', 'Roboto Mono', 'Courier New'],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0x40FFFFFF), // white, ~25% alpha
        shape: BoxShape.circle,
      ),
      child: SizedBox.square(dimension: 8),
    );
  }
}