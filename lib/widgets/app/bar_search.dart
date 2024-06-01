import 'package:flutter/material.dart';
import 'package:wothcompanion/generated/assets.gen.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/values.dart';
import 'package:wothcompanion/widgets/app/padding.dart';
import 'package:wothcompanion/widgets/icons/icon.dart';
import 'package:wothcompanion/widgets/text/text_field.dart';

class WidgetSearchBar extends StatelessWidget {
  final TextEditingController _controller;

  const WidgetSearchBar({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  double get _height => Values.searchBar;

  Widget _buildSearchIcon() {
    return WidgetIcon(
      Assets.graphics.icons.search,
      color: Interface.primaryLight,
    );
  }

  Widget _buildTextField() {
    return Container(
      height: _height,
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: WidgetTextField(controller: _controller),
    );
  }

  Widget _buildRemoveIcon() {
    return GestureDetector(
      onTap: () => _controller.text = "",
      child: WidgetIcon.withSize(
        Assets.graphics.icons.cancel,
        color: Interface.disabled,
        size: 15,
      ),
    );
  }

  Widget _buildWidgets() {
    return WidgetPadding.h30(
      background: Interface.gradientGreen.withOpacity(0.6),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSearchIcon(),
          Expanded(child: _buildTextField()),
          _buildRemoveIcon(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
