import 'package:flutter/material.dart';
import 'package:wothcompanion/generated/assets.gen.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/interface/values.dart';
import 'package:wothcompanion/widgets/icons/icon.dart';
import 'package:wothcompanion/widgets/text/text.dart';

class WidgetAppBar extends StatelessWidget {
  final String _text;
  final String? _icon;
  final int _maxLines;
  final Function? _onTap;
  final BuildContext _context;

  const WidgetAppBar(
    String text, {
    super.key,
    String? icon,
    int maxLines = 2,
    Function? onTap,
    required BuildContext context,
  })  : _text = text,
        _icon = icon,
        _maxLines = maxLines,
        _onTap = onTap,
        _context = context;

  double get _height => Values.appBar;

  String get _actualIcon => _icon ?? Assets.graphics.icons.back;

  Widget _buildBack() {
    return WidgetIcon(
      _actualIcon,
      color: Interface.primaryLight,
    );
  }

  Widget _buildLeft() {
    return GestureDetector(
      onTap: () {
        if (_onTap != null) {
          _onTap!();
        } else {
          Navigator.pop(_context);
        }
      },
      child: Container(
        width: 80,
        height: _height,
        color: Interface.transparent,
        alignment: Alignment.center,
        child: _buildBack(),
      ),
    );
  }

  Widget _buildText() {
    return WidgetText(
      _text.toUpperCase(),
      color: Interface.primaryLight,
      style: Style.condensed.s26.w400,
      maxLines: _maxLines,
      textAlign: TextAlign.right,
    );
  }

  Widget _buildRight() {
    return Container(
      height: _height,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 30),
      child: _buildText(),
    );
  }

  Widget _buildWidgets() {
    return Container(
      decoration: Interface.greenGradient,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildLeft(),
          Expanded(child: _buildRight()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
