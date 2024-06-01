import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wothcompanion/interface/graphics.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/miscellaneous/enums.dart';
import 'package:wothcompanion/model/map/building_location.dart';
import 'package:wothcompanion/widgets/maps/marker.dart';

class WidgetMarkerBuilding extends WidgetMarker<BuildingLocation> {
  const WidgetMarkerBuilding(
    super.location, {
    super.key,
    required super.offset,
    required double size,
  }) : super(width: size, height: size);

  Widget _buildIcon() {
    return SvgPicture.asset(
      Graphics.getBuildingLocation(location),
      fit: BoxFit.fitWidth,
      alignment: Alignment.center,
      colorFilter: const ColorFilter.mode(
        Interface.primaryDark,
        BlendMode.srcIn,
      ),
    );
  }

  @override
  Widget buildCenter() {
    return Container(
      padding: EdgeInsets.all(location.type == BuildingType.huntingStand ? 3 : 2),
      decoration: BoxDecoration(
        color: location.type == BuildingType.huntingStand ? Interface.markerHuntingStand : Interface.markerBuilding,
        borderRadius: BorderRadius.circular(location.type == BuildingType.huntingStand ? 100 : 5),
        border: Border.all(width: 1.5, color: Interface.primaryDark),
      ),
      child: _buildIcon(),
    );
  }
}
