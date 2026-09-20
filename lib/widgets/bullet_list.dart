import 'package:flutter/material.dart';

class BulletList extends StatelessWidget {
  final List<String> items;

  const BulletList({
    super.key,
    required this.items,
  });

  static const _green = Color(0xFF16A34A);
  static const _halo = Color(0x2916A34A); 
  static const _textColor = Color(0xFF4B5563);
  static const _fontSize = 14.0;
  static const _lineHeight = 1.6;

  @override
  Widget build(BuildContext context) {
    final firstLine =
        MediaQuery.textScalerOf(context).scale(_fontSize) * _lineHeight;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < items.length; i++)
          Padding(
            padding: EdgeInsets.only(bottom: i == items.length - 1 ? 0 : 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExcludeSemantics(
                  child: SizedBox(
                    width: 16,
                    height: firstLine,
                    child: Center(
                      child: Container(
                        width: 16,
                        height: 16,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: _halo,
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: _green,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    items[i],
                    style: const TextStyle(
                      fontSize: _fontSize,
                      color: _textColor,
                      height: _lineHeight,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}