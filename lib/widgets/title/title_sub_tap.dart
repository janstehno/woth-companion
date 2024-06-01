import 'package:flutter/material.dart';
import 'package:wothcompanion/widgets/title/title_sub.dart';

class WidgetSubtitleTap extends WidgetSubtitle {
  final Function _onTap;

  const WidgetSubtitleTap(
    super.text, {
    super.key,
    required Function onTap,
  }) : _onTap = onTap;

  @override
  Widget buildWidgets() {
    return GestureDetector(
      onTap: () => _onTap(),
      child: super.buildWidgets(),
    );
  }
}
