import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wothcompanion/interface/graphics.dart';
import 'package:wothcompanion/model/map/animal_location.dart';
import 'package:wothcompanion/widgets/maps/marker.dart';

class WidgetMarkerZone extends WidgetMarker<AnimalZoneLocation> {
  const WidgetMarkerZone(
    super.location, {
    super.key,
    required super.offset,
    required double size,
  }) : super(width: size, height: size);

  @override
  Widget buildCenter() {
    return SvgPicture.asset(
      Graphics.getZone(location.type),
      fit: BoxFit.fitWidth,
      alignment: Alignment.center,
    );
  }
}
