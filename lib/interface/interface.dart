import 'package:flutter/material.dart';

class Interface {
  static const String version = "1.0.0";

  static const Color transparent = Colors.transparent;

  static const Color primaryDark = Color(0xFF0E0F13);
  static const Color primary = Color(0xFFE7BE70);
  static const Color primaryLight = Color(0xFFEBDDD2);

  static const Color lightF7 = Color(0xFFF7F7F7);
  static const Color lightE9 = Color(0xFFE9E9E9);
  static const Color lightD9 = Color(0xFFD9D9D9);
  static const Color lightC4 = Color(0xFFC4C4C4);
  static const Color light7C = Color(0xFF7C7C7C);

  static const Color dark56 = Color(0xFF565656);
  static const Color dark33 = Color(0xFF333333);
  static const Color dark1A = Color(0xFF1A1A1A);
  static const Color dark12 = Color(0xFF121212);
  static const Color dark0D = Color(0xFF0D0D0D);

  static const Color gradientStart = Color(0xFF19231A);
  static const Color gradientMiddle = Color(0xFF202D21);
  static const Color gradientEnd = Color(0xFF293A2A);
  static const Color gradientGreen = Color(0xFF364139);

  static const Color snackSuccess = Color(0xFF4CAF50);
  static const Color snackError = Color(0xFFE53935);

  static const Color markerHuntingStand = Color(0xFF9F98E5);
  static const Color markerBuilding = Color(0xFF83C3FF);
  static const Color markerAnimal = primary;

  static const Color odd = dark1A;
  static const Color even = dark12;

  static Color title = const Color(0xFF202D21).withOpacity(0.4);
  static Color subtitle = title.withOpacity(0.8);
  static Color disabled = primaryLight.withOpacity(0.4);
  static Color dropDown = primaryDark.withOpacity(0.8);

  static InputBorder get textFieldBorder => const OutlineInputBorder(
        borderSide: BorderSide(width: 0.05, color: Colors.transparent),
      );

  static BoxDecoration get greenGradient => const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Interface.gradientStart,
            Interface.gradientMiddle,
            Interface.gradientEnd,
            Interface.gradientMiddle,
            Interface.gradientStart,
          ],
          stops: [0, 0.1, 0.5, 0.9, 1],
        ),
      );
}
