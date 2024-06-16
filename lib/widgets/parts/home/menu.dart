import 'package:flutter/material.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/miscellaneous/values.dart';
import 'package:wothcompanion/widgets/app/margin.dart';
import 'package:wothcompanion/widgets/icon/icon_shield.dart';
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
  double get height => _icon == null ? Values.menu - 7 : Values.menu;

  Widget _buildLine() {
    return Container(
      width: 1,
      height: super.height,
      color: Interface.primary.withOpacity(0.4),
    );
  }

  Widget _buildText() {
    return WidgetText(
      super.text,
      color: Interface.primaryLight,
      style: Style.condensed.s18.w300,
    );
  }

  Widget _buildIcon() {
    return WidgetMargin.right(
      20,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildLine(),
          WidgetIconShield(_icon!),
        ],
      ),
    );
  }

  @override
  Widget buildCenter() {
    return Row(
      children: [
        if (_icon != null) _buildIcon(),
        Expanded(child: _buildText()),
      ],
    );
  }
}
