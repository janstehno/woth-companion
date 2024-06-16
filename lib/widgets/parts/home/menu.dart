import 'package:flutter/material.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/miscellaneous/values.dart';
import 'package:wothcompanion/widgets/app/margin.dart';
import 'package:wothcompanion/widgets/icon/icon.dart';
import 'package:wothcompanion/widgets/section/section_tap.dart';
import 'package:wothcompanion/widgets/text/text.dart';

class WidgetSectionMenu extends WidgetSectionTap {
  final String? _icon;

  const WidgetSectionMenu(
    super.text, {
    super.key,
    String? icon,
    required super.onTap,
  })  : _icon = icon,
        super(background: Interface.transparent);

  @override
  double get height => _icon == null ? Values.menu - 10 : Values.menu;

  Widget _buildText() {
    return WidgetText(
      super.text,
      color: Interface.primaryLight.withOpacity(0.8),
      style: Style.normal.s18.w400,
    );
  }

  @override
  Widget buildCenter() {
    return Row(
      children: [
        if (_icon != null) WidgetMargin.right(20, child: WidgetIcon(_icon!, color: Interface.primary)),
        Expanded(child: _buildText()),
      ],
    );
  }
}
