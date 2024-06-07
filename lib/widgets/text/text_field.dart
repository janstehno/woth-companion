import 'package:flutter/material.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';

class WidgetTextField extends StatelessWidget {
  final bool _decimal;
  final bool _numberOnly;
  final int _maxLines;
  final TextEditingController _controller;

  const WidgetTextField({
    super.key,
    bool decimal = true,
    bool numberOnly = false,
    int maxLines = 1,
    required TextEditingController controller,
  })  : _decimal = decimal,
        _numberOnly = numberOnly,
        _maxLines = maxLines,
        _controller = controller;

  TextInputType _buildInputType() {
    if (_numberOnly) {
      return TextInputType.numberWithOptions(
        decimal: _decimal,
        signed: false,
      );
    }
    return TextInputType.text;
  }

  Widget _buildWidgets() {
    return TextField(
      keyboardType: _buildInputType(),
      maxLines: _maxLines,
      cursorHeight: 25,
      controller: _controller,
      textAlign: TextAlign.left,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: Interface.primary,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        border: Interface.textFieldBorder,
        disabledBorder: Interface.textFieldBorder,
        enabledBorder: Interface.textFieldBorder,
        focusedBorder: Interface.textFieldBorder,
        errorBorder: Interface.textFieldBorder,
        focusedErrorBorder: Interface.textFieldBorder,
      ),
      style: Style.normal.s16.w400.copyWith(color: Interface.primaryLight),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
