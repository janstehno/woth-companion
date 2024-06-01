import 'package:flutter/material.dart';
import 'package:wothcompanion/model/map/location.dart';

abstract class WidgetMarker<I extends Location> extends StatelessWidget {
  final I _location;
  final Offset _offset;
  final double _width;
  final double _height;

  const WidgetMarker(
    I location, {
    super.key,
    required Offset offset,
    required double width,
    required double height,
  })  : _location = location,
        _offset = offset,
        _width = width,
        _height = height;

  I get location => _location;

  Widget buildCenter();

  Widget _buildWidgets() {
    return Positioned(
      width: _width,
      height: _height,
      left: _offset.dx - (_width / 2),
      top: _offset.dy - (_height / 2),
      child: buildCenter(),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
