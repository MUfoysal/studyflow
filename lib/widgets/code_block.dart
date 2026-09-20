import 'package:flutter/material.dart';

class CodeBlock extends StatelessWidget {
  final String code;

  const CodeBlock({
    super.key,
    required this.code,
  });

  static const _ink = Color(0xFF111827);
  static const _edge = Color(0x1FFFFFFF); 
  static const _bar = Color(0x0AFFFFFF); 
  static const _sheen = Color(0x0FFFFFFF); 
  static const _clear = Color(0x00FFFFFF);
  static const _rim = Color(0x38FFFFFF); 
  static const _select = Color(0x33FFFFFF); 
  static const _ambient = Color(0x33111827); 
  static const _contact = Color(0x1F111827); 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: _ink,
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [_sheen, _clear],
          stops: [0.0, 0.6],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _edge),
        boxShadow: const [
          BoxShadow(
            color: _ambient,
            blurRadius: 32,
            spreadRadius: -8,
            offset: Offset(0, 16),
          ),
          BoxShadow(
            color: _contact,
            blurRadius: 6,
            spreadRadius: -2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ExcludeSemantics(
                child: Container(
                  height: 38,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(
                    color: _bar,
                    border: Border(bottom: BorderSide(color: _edge)),
                  ),
                  child: const Row(
                    children: [
                      _Dot(Color(0x33FFFFFF)), // ~20%
                      SizedBox(width: 7),
                      _Dot(Color(0x24FFFFFF)), // ~14%
                      SizedBox(width: 7),
                      _Dot(Color(0x17FFFFFF)), // ~9%
                    ],
                  ),
                ),
              ),
              DefaultSelectionStyle(
                selectionColor: _select,
                cursorColor: Colors.white,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
                  child: SelectableText(
                    code,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      height: 1.65,
                      letterSpacing: 0.15,
                      fontFamily: 'monospace',
                      fontFamilyFallback: [
                        'Menlo',
                        'Roboto Mono',
                        'Courier New',
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Positioned(
            top: 0,
            left: 16,
            right: 16,
            height: 1,
            child: ExcludeSemantics(
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [_clear, _rim, _clear],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final Color color;

  const _Dot(this.color);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: const SizedBox.square(dimension: 8),
    );
  }
}