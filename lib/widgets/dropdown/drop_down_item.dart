import 'package:flutter/material.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/interface/values.dart';
import 'package:wothcompanion/widgets/app/padding.dart';
import 'package:wothcompanion/widgets/text/text.dart';

class WidgetDropDownItem extends DropdownMenuItem {
  WidgetDropDownItem({
    super.key,
    required super.value,
    required String text,
  }) : super(child: _buildWidgets(text));

  static double get _height => Values.dropDown;

  static Widget _buildWidgets(String text) {
    return SizedBox(
      height: _height,
      child: WidgetPadding.h30(
        child: WidgetText(
          text,
          color: Interface.primaryLight,
          style: Style.normal.s16.w400,
        ),
      ),
    );
  }
}
