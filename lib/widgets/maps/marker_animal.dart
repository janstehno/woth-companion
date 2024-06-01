import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wothcompanion/interface/graphics.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/miscellaneous/enums.dart';
import 'package:wothcompanion/model/map/animal_location.dart';
import 'package:wothcompanion/widgets/maps/marker.dart';

class WidgetMarkerAnimal extends WidgetMarker<AnimalLocation> {
  final Function _onTap;

  const WidgetMarkerAnimal(
    super.location, {
    super.key,
    required super.offset,
    required double size,
    required Function onTap,
  })  : _onTap = onTap,
        super(width: size, height: size);

  Widget _buildFill() {
    return SvgPicture.asset(
      Graphics.getAnimalLocation(location.animal, MarkerType.fill),
      fit: BoxFit.fitWidth,
      colorFilter:
          ColorFilter.mode(location.isShownDetail ? Interface.markerAnimal : Interface.primaryLight, BlendMode.srcIn),
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
      child: Stack(
        children: [
          _buildFill(),
          _buildBorder(),
        ],
      ),
    );
  }
}
