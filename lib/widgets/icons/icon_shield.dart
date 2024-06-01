import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:wothcompanion/generated/assets.gen.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/values.dart';
import 'package:wothcompanion/widgets/icons/icon.dart';

class WidgetIconShield extends WidgetIcon {
  const WidgetIconShield(
    super.icon, {
    super.key,
    super.color,
  });

  Color get background => Interface.gradientEnd;

  Widget _buildShield() {
    return WidgetIcon.withSize(
      Assets.graphics.shapes.shield,
      size: Values.iconSize + 12,
      color: background,
    );
  }

  Widget _buildIcon() {
    return SimpleShadow(
      sigma: 3,
      opacity: 0.8,
      offset: const Offset(-0.3, -0.3),
      child: WidgetIcon.withSize(
        icon,
        size: Values.iconSize,
        color: Interface.primary,
      ),
    );
  }

  @override
  Widget buildWidgets() {
    return SizedBox(
      width: Values.tapSize,
      height: Values.tapSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildShield(),
          Positioned(
            top: 6,
            child: _buildIcon(),
          ),
        ],
      ),
    );
  }
}
