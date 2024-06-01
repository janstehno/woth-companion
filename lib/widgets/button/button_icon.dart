import 'package:flutter/material.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/values.dart';
import 'package:wothcompanion/widgets/button/button.dart';
import 'package:wothcompanion/widgets/icons/icon.dart';

class WidgetButtonIcon extends WidgetButton {
  final String _icon;
  final double? _size;
  final Color? _color;

  const WidgetButtonIcon(
    String icon, {
    super.key,
    Color? color,
    double? size,
    super.background,
    required super.onTap,
  })  : _icon = icon,
        _color = color,
        _size = size;

  double get iconSize => _size ?? Values.iconSize;

  Color get iconColor => _color ?? Interface.primaryDark;

  @override
  Widget? buildCenter() {
    return WidgetIcon.withSize(
      _icon,
      color: iconColor,
      size: iconSize,
    );
  }
}
