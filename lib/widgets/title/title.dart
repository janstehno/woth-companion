import 'package:flutter/material.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/interface/values.dart';
import 'package:wothcompanion/widgets/app/padding.dart';
import 'package:wothcompanion/widgets/text/text.dart';

class WidgetTitle extends StatelessWidget {
  final String _text;
  final String _subtext;

  const WidgetTitle(
    String text, {
    super.key,
    String subtext = "",
    bool upperCase = true,
  })  : _text = text,
        _subtext = subtext;

  double get height => Values.title;

  Color get color => Interface.primaryLight;

  Color get subColor => Interface.disabled;

  Color get background => Interface.title;

  Widget _buildText() {
    if (_subtext.isEmpty) {
      return WidgetText(
        _text.toUpperCase(),
        color: color,
        style: Style.condensed.s22.w400,
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetText(
          _text.toUpperCase(),
          color: color,
          style: Style.condensed.s22.w400,
        ),
        WidgetText(
          _subtext,
          color: subColor,
          style: Style.normal.s12.w400,
        )
      ],
    );
  }

  Widget buildWidgets() {
    return SizedBox(
      height: height,
      child: WidgetPadding.h30(
        background: background,
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 30),
                child: _buildText(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => buildWidgets();
}
