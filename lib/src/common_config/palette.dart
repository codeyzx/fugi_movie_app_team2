import 'package:flutter/material.dart';

class Palette {
  // ignore: Dark
  static const MaterialColor team2color = MaterialColor(_team2colorPrimaryValue, <int, Color>{
    50: Color(0xFFE5E5E6),
    100: Color(0xFFBDBFC2),
    200: Color(0xFF929599),
    300: Color(0xFF666A70),
    400: Color(0xFF454A51),
    500: Color(_team2colorPrimaryValue),
    600: Color(0xFF20252D),
    700: Color(0xFF1B1F26),
    800: Color(0xFF16191F),
    900: Color(0xFF0D0F13),
  });
  static const int _team2colorPrimaryValue = 0xFF242A32;

  static const MaterialColor team2colorAccent = MaterialColor(_team2colorAccentValue, <int, Color>{
    100: Color(0xFF5882FF),
    200: Color(_team2colorAccentValue),
    400: Color(0xFF003CF1),
    700: Color(0xFF0036D8),
  });
  static const int _team2colorAccentValue = 0xFF0296E5;
}
