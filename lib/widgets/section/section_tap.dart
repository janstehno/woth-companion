import 'package:flutter/material.dart';
import 'package:wothcompanion/miscellaneous/values.dart';
import 'package:wothcompanion/widgets/app/padding.dart';

abstract class WidgetSectionTap extends StatelessWidget {
  final String _text;
  final Color _background;
  final Function? _onTap;

  const WidgetSectionTap(
    String text, {
    super.key,
    required Color background,
    required Function? onTap,
  })  : _text = text,
        _background = background,
        _onTap = onTap;

  double get height => Values.section;

  String get text => _text;

  Widget buildCenter();

  Widget _buildWidgets() {
    return GestureDetector(
      onTap: () {
        if (_onTap != null) _onTap!();
      },
      child: SizedBox(
        height: height,
        child: WidgetPadding.h30(
          background: _background,
          child: buildCenter(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
