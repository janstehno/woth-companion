import 'package:flutter/material.dart';
import 'package:wothcompanion/widgets/title/title.dart';

class WidgetTitleTap extends WidgetTitle {
  final Color? _color;
  final Color? _background;
  final Function _onTap;

  const WidgetTitleTap(
    super.text, {
    super.key,
    Color? color,
    Color? background,
    required Function onTap,
  })  : _color = color,
        _background = background,
        _onTap = onTap;

  @override
  Widget buildWidgets() {
    return GestureDetector(
      onTap: () => _onTap(),
      child: super.buildWidgets(),
    );
  }

  @override
  Color get color => _color ?? super.color;

  @override
  Color get background => _background ?? super.background;

  @override
  Widget build(BuildContext context) => buildWidgets();
}
