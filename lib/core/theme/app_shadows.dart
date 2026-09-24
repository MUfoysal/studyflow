import 'package:flutter/material.dart';

abstract final class AppShadows {
  static const List<BoxShadow> card = [
    BoxShadow(color: Color(0x0A000000), blurRadius: 16, offset: Offset(0, 6)),
  ];

  static const List<BoxShadow> quickAccess = [
    BoxShadow(color: Color(0x0D000000), blurRadius: 10, offset: Offset(0, 4)),
  ];

  static const List<BoxShadow> progress = [
    BoxShadow(color: Color(0x2416A34A), blurRadius: 20, offset: Offset(0, 8)),
  ];
}
