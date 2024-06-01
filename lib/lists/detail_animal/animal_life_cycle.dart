import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wothcompanion/helpers/json.dart';
import 'package:wothcompanion/interface/graphics.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/model/connect/animal_cycle.dart';
import 'package:wothcompanion/model/translatables/animal.dart';
import 'package:wothcompanion/widgets/app/padding.dart';
import 'package:wothcompanion/widgets/text/text.dart';

class ListAnimalLifeCycle extends StatelessWidget {
  final Animal _animal;

  const ListAnimalLifeCycle(
    Animal animal, {
    super.key,
  }) : _animal = animal;

  Widget _buildBadge(bool isZone, String zoneIcon, int hour) {
    if (isZone) {
      return SvgPicture.asset(
        zoneIcon,
        width: 24,
      );
    }
    return WidgetText(
      hour.toString(),
      color: Interface.primaryLight,
      style: Style.normal.s12.w400,
    );
  }

  List<PieChartSectionData> _buildLifeCycleSections(bool isZone) {
    List<PieChartSectionData> sections = [];
    AnimalCycle animalCycle = HelperJSON.getAnimalCycle(_animal.id);

    for (int hour = 0; hour < 24; hour++) {
      String zoneIcon = Graphics.getZone(animalCycle.zone(hour));
      sections.add(
        PieChartSectionData(
          color: Colors.transparent,
          radius: 23,
          badgeWidget: _buildBadge(isZone, zoneIcon, hour),
        ),
      );
    }

    return sections;
  }

  Widget _buildName() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 4),
        WidgetText(
          _animal.name.toUpperCase(),
          color: Interface.primaryLight,
          style: Style.condensed.s18.w300,
        ),
        WidgetText(
          _animal.latin,
          color: Interface.disabled,
          style: Style.normal.s8.w400i,
        ),
      ],
    );
  }

  Widget _buildCenter() {
    return SizedBox(
      width: 205,
      height: 205,
      child: WidgetPadding.h30(
        alignment: Alignment.center,
        child: _buildName(),
      ),
    );
  }

  Widget _buildCircle() {
    return SizedBox(
      width: 205,
      height: 205,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Interface.primary.withOpacity(0.6)),
          borderRadius: BorderRadius.circular(300),
        ),
      ),
    );
  }

  Widget _buildZones() {
    return PieChart(
      PieChartData(
        startDegreeOffset: -97.4,
        borderData: FlBorderData(
          show: false,
        ),
        sectionsSpace: 3,
        centerSpaceRadius: 90,
        sections: _buildLifeCycleSections(true),
      ),
    );
  }

  Widget _buildHours() {
    return PieChart(
      PieChartData(
        startDegreeOffset: -97.4,
        borderData: FlBorderData(
          show: false,
        ),
        centerSpaceRadius: 115,
        sections: _buildLifeCycleSections(false),
      ),
    );
  }

  Widget _buildWidgets() {
    return SizedBox(
      height: 330,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildCenter(),
          _buildCircle(),
          _buildZones(),
          _buildHours(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
