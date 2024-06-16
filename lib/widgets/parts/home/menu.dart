import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/miscellaneous/values.dart';
import 'package:wothcompanion/widgets/app/margin.dart';
import 'package:wothcompanion/widgets/icon/icon_shield.dart';
import 'package:wothcompanion/widgets/section/section_tap.dart';
import 'package:wothcompanion/widgets/text/text.dart';

class WidgetSectionMenu extends WidgetSectionTap {
  final String _icon;

  const WidgetSectionMenu(
    super.text, {
    super.key,
    required String icon,
    required super.onTap,
  })  : _icon = icon,
        super(background: Interface.transparent);

  @override
  double get height => Values.menu;

  Widget _buildLine() {
    return Container(
      width: 1,
      height: super.height,
      color: Interface.primary.withOpacity(0.4),
    );
  }

  Widget _buildIcon() {
    return SimpleShadow(
      sigma: 5,
      offset: const Offset(-0.3, 0),
      child: WidgetIconShield(_icon),
    );
  }

  Widget _buildText() {
    return WidgetText(
      super.text.toUpperCase(),
      color: Interface.primaryLight,
      style: Style.condensed.s18.w300,
    );
  }

  @override
  Widget buildCenter() {
    return Row(
      children: [
        WidgetMargin.right(
          20,
          child: Stack(
            alignment: Alignment.center,
            children: [
              _buildLine(),
              _buildIcon(),
            ],
          ),
        ),
        Expanded(child: _buildText())
      ],
    );
  }
}
