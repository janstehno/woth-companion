import 'package:flutter/material.dart';
import 'package:wothcompanion/interface/interface.dart';

class WidgetPadding extends StatelessWidget {
  final EdgeInsets? _padding;
  final Color? _background;
  final Alignment? _alignment;
  final Widget _child;

  const WidgetPadding(
    EdgeInsets padding, {
    super.key,
    Color? background,
    Alignment? alignment,
    required Widget child,
  })  : _background = background,
        _alignment = alignment,
        _padding = padding,
        _child = child;

  WidgetPadding.all(
    double padding, {
    super.key,
    Color? background,
    Alignment? alignment,
    required Widget child,
  })  : _background = background,
        _alignment = alignment,
        _padding = EdgeInsets.all(padding),
        _child = child;

  WidgetPadding.fromLTRB(
    double left,
    double top,
    double right,
    double bottom, {
    super.key,
    Color? background,
    Alignment? alignment,
    required Widget child,
  })  : _background = background,
        _alignment = alignment,
        _padding = EdgeInsets.fromLTRB(left, top, right, bottom),
        _child = child;

  WidgetPadding.h(
    double horizontal, {
    super.key,
    Color? background,
    Alignment? alignment,
    required Widget child,
  })  : _background = background,
        _alignment = alignment,
        _padding = EdgeInsets.symmetric(horizontal: horizontal),
        _child = child;

  WidgetPadding.v(
    double vertical, {
    super.key,
    Color? background,
    Alignment? alignment,
    required Widget child,
  })  : _background = background,
        _alignment = alignment,
        _padding = EdgeInsets.symmetric(vertical: vertical),
        _child = child;

  const WidgetPadding.a30({
    super.key,
    Color? background,
    Alignment? alignment,
    required Widget child,
  })  : _background = background,
        _alignment = alignment,
        _padding = const EdgeInsets.all(30),
        _child = child;

  const WidgetPadding.h30({
    super.key,
    Color? background,
    Alignment? alignment,
    required Widget child,
  })  : _background = background,
        _alignment = alignment,
        _padding = const EdgeInsets.only(left: 30, right: 30),
        _child = child;

  const WidgetPadding.v30({
    super.key,
    Color? background,
    Alignment? alignment,
    required Widget child,
  })  : _background = background,
        _alignment = alignment,
        _padding = const EdgeInsets.only(top: 30, bottom: 30),
        _child = child;

  const WidgetPadding.h30v20({
    super.key,
    Color? background,
    Alignment? alignment,
    required Widget child,
  })  : _background = background,
        _alignment = alignment,
        _padding = const EdgeInsets.fromLTRB(30, 20, 30, 20),
        _child = child;

  EdgeInsets get padding => _padding ?? const EdgeInsets.all(0);

  Alignment get alignment => _alignment ?? Alignment.centerLeft;

  Color get background => _background ?? Interface.transparent;

  Widget _buildWidgets() {
    return Container(
      color: background,
      alignment: alignment,
      padding: padding,
      child: _child,
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
