import 'package:flutter/material.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/widgets/app/padding.dart';
import 'package:wothcompanion/widgets/button/button.dart';
import 'package:wothcompanion/widgets/text/text.dart';

class WidgetButtonText extends WidgetButton {
  final String _text;
  final Color? _color;

  const WidgetButtonText(
    String text, {
    super.key,
    super.width,
    Color? color,
    super.background,
    required super.onTap,
  })  : _text = text,
        _color = color;

  Color get textColor => _color ?? Interface.primaryDark;

  @override
  Widget? buildCenter() {
    return WidgetPadding.h(
      10,
      alignment: Alignment.center,
      child: WidgetText(
        _text,
        color: textColor,
        style: Style.normal.s16.w600,
      ),
    );
  }
}
