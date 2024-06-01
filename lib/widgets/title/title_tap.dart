import 'package:flutter/material.dart';
import 'package:wothcompanion/widgets/title/title.dart';

class WidgetTitleTap extends WidgetTitle {
  final Function _onTap;

  const WidgetTitleTap(
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

  @override
  Widget build(BuildContext context) => buildWidgets();
}
