import 'package:flutter/material.dart';
import 'package:wothcompanion/generated/fonts.gen.dart';
import 'package:wothcompanion/interface/values.dart';

class $StyleNormal {
  const $StyleNormal();

  $StyleNormalSize8 get s8 => const $StyleNormalSize8();

  $StyleNormalSize10 get s10 => const $StyleNormalSize10();

  $StyleNormalSize12 get s12 => const $StyleNormalSize12();

  $StyleNormalSize16 get s16 => const $StyleNormalSize16();
}

class $StyleNormalSize8 {
  const $StyleNormalSize8();

  TextStyle get w400 => const TextStyle(
        fontSize: 8,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.normal,
        height: Values.smallLineHeight,
      );

  TextStyle get w400i => w400.copyWith(fontStyle: FontStyle.italic);

  TextStyle get w600 => w400.copyWith(fontWeight: FontWeight.w600);
}

class $StyleNormalSize10 {
  const $StyleNormalSize10();

  TextStyle get w400 => const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.normal,
        height: Values.smallLineHeight,
      );
}

class $StyleNormalSize12 {
  const $StyleNormalSize12();

  TextStyle get w400 => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.normal,
        height: Values.smallLineHeight,
      );

  TextStyle get w400i => w400.copyWith(fontStyle: FontStyle.italic);
}

class $StyleNormalSize16 {
  const $StyleNormalSize16();

  TextStyle get w400 => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.normal,
        height: Values.normalLineHeight,
      );

  TextStyle get w600 => w400.copyWith(fontWeight: FontWeight.w600);
}

class $StyleCondensed {
  const $StyleCondensed();

  $StyleCondensedSize12 get s12 => const $StyleCondensedSize12();

  $StyleCondensedSize16 get s16 => const $StyleCondensedSize16();

  $StyleCondensedSize18 get s18 => const $StyleCondensedSize18();

  $StyleCondensedSize22 get s22 => const $StyleCondensedSize22();

  $StyleCondensedSize26 get s26 => const $StyleCondensedSize26();
}

class $StyleCondensedSize12 {
  const $StyleCondensedSize12();

  TextStyle get w400 => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.condensed,
        height: Values.condensedLineHeight,
        letterSpacing: 1.2,
      );
}

class $StyleCondensedSize16 {
  const $StyleCondensedSize16();

  TextStyle get w400 => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.condensed,
        height: Values.condensedLineHeight,
        letterSpacing: 1.3,
      );

  TextStyle get w600 => w400.copyWith(fontWeight: FontWeight.w600);
}

class $StyleCondensedSize18 {
  const $StyleCondensedSize18();

  TextStyle get w300 => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        fontFamily: FontFamily.condensed,
        height: Values.condensedLineHeight,
        letterSpacing: 1.4,
      );
}

class $StyleCondensedSize22 {
  const $StyleCondensedSize22();

  TextStyle get w400 => const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.condensed,
        height: Values.condensedLineHeight,
        letterSpacing: 1.5,
      );
}

class $StyleCondensedSize26 {
  const $StyleCondensedSize26();

  TextStyle get w400 => const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.condensed,
        height: Values.condensedLineHeight,
        letterSpacing: 1.5,
      );
}

class Style {
  Style._();

  static const $StyleNormal normal = $StyleNormal();
  static const $StyleCondensed condensed = $StyleCondensed();
}
