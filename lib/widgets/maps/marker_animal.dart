import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wothcompanion/interface/graphics.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/miscellaneous/enums.dart';
import 'package:wothcompanion/model/map/animal_location.dart';
import 'package:wothcompanion/widgets/maps/marker.dart';

class WidgetMarkerAnimal extends WidgetMarker<AnimalLocation> {
  final Color _color;
  final Function _onTap;
  final Function _onLongTap;

  const WidgetMarkerAnimal(
    super.location, {
    super.key,
    required super.offset,
    required double size,
    required Color color,
    required Function onTap,
    required Function onLongTap,
  })  : _color = color,
        _onTap = onTap,
        _onLongTap = onLongTap,
        super(width: size, height: size);

  Color get _actualColor => location.isShownDetail ? Interface.markerAnimal : _color;

  Widget _buildFill() {
    return SvgPicture.asset(
      Graphics.getAnimalLocation(location.animal, MarkerType.fill),
      fit: BoxFit.fitWidth,
      colorFilter: ColorFilter.mode(_actualColor, BlendMode.srcIn),
    );
  }

  Widget _buildBorder() {
    return SvgPicture.asset(
      Graphics.getAnimalLocation(location.animal, MarkerType.border),
      fit: BoxFit.fitWidth,
      colorFilter: const ColorFilter.mode(Interface.primaryDark, BlendMode.srcIn),
    );
  }

  @override
  Widget buildCenter() {
    return GestureDetector(
      onTap: () => _onTap(),
      onLongPress: () => _onLongTap(),
      child: Stack(
        children: [
          _buildFill(),
          _buildBorder(),
        ],
      ),
    );
  }
}
