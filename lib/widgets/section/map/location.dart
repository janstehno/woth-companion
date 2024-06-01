import 'package:flutter/material.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/widgets/indicator/indicator.dart';
import 'package:wothcompanion/widgets/section/section_tap.dart';
import 'package:wothcompanion/widgets/text/text.dart';

class WidgetSectionLocation extends WidgetSectionTap {
  final bool _active;

  const WidgetSectionLocation(
    super.text, {
    super.key,
    required bool active,
    required super.background,
    required super.onTap,
  }) : _active = active;

  Widget _buildText() {
    return Container(
      alignment: Alignment.centerLeft,
      child: WidgetText(
        super.text,
        color: Interface.primaryLight,
        style: Style.normal.s16.w400,
      ),
    );
  }

  @override
  Widget buildCenter() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: _buildText()),
        WidgetIndicator(active: _active),
      ],
    );
  }
}
