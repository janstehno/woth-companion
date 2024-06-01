import 'package:flutter/material.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/model/map/area_location.dart';
import 'package:wothcompanion/widgets/app/padding.dart';
import 'package:wothcompanion/widgets/maps/marker.dart';
import 'package:wothcompanion/widgets/text/text.dart';

class WidgetMarkerArea extends WidgetMarker<AreaLocation> {
  const WidgetMarkerArea(
    super.location, {
    super.key,
    required super.offset,
    required super.width,
    required super.height,
  });

  Widget _buildName() {
    return WidgetText(
      location.name.toUpperCase(),
      color: Interface.primaryLight,
      style: Style.condensed.s12.w400,
    );
  }

  Widget _buildHabitat() {
    return WidgetText(
      location.habitat,
      color: Interface.disabled,
      style: Style.normal.s8.w400i,
    );
  }

  @override
  Widget buildCenter() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Interface.primaryDark.withOpacity(0.6),
          borderRadius: BorderRadius.circular(5),
        ),
        child: WidgetPadding.fromLTRB(
          5,
          4,
          5,
          4,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildName(),
              _buildHabitat(),
            ],
          ),
        ),
      ),
    );
  }
}
