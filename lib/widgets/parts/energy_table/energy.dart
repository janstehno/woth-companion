import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/settings.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/miscellaneous/utils.dart';
import 'package:wothcompanion/miscellaneous/values.dart';
import 'package:wothcompanion/model/translatables/animal.dart';
import 'package:wothcompanion/model/translatables/firearm.dart';
import 'package:wothcompanion/widgets/app/padding.dart';
import 'package:wothcompanion/widgets/text/text.dart';

abstract class WidgetEnergy extends StatelessWidget {
  final int _index;
  final Firearm _firearm;
  final Animal _animal;

  const WidgetEnergy({
    super.key,
    required int index,
    required Firearm firearm,
    required Animal animal,
  })  : _index = index,
        _firearm = firearm,
        _animal = animal;

  Firearm get firearm => _firearm;

  Animal get animal => _animal;

  bool _isEligiblePartly(int energy) =>
      animal.min - (animal.min * Values.energyTolerance) <= energy &&
      energy <= animal.max + (animal.max * Values.energyTolerance) &&
      energy != 0;

  bool _isEligibleFully(int energy) => animal.min <= energy && energy <= animal.max && energy != 0;

  Color _color(int energy) {
    if (_isEligibleFully(energy)) {
      return Interface.primary;
    } else if (_isEligiblePartly(energy)) {
      return Interface.primaryLight;
    } else {
      return Interface.disabled;
    }
  }

  Color _eligibleBackground() {
    int eligibleCount = 0;
    for (int energy in firearm.energy) {
      if (_isEligibleFully(energy)) eligibleCount++;
    }
    return eligibleCount == 5 ? Interface.primary.withOpacity(0.1) : Colors.transparent;
  }

  Widget buildName(BuildContext context);

  Widget _buildRangeEnergyColumn(String distance, int energy) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        WidgetText(
          distance,
          color: Interface.disabled,
          style: Style.normal.s10.w400,
        ),
        WidgetText(
          energy.toString(),
          color: _color(energy),
          style: Style.normal.s16.w400,
        )
      ],
    );
  }

  Widget _buildRangeEnergyRow(BuildContext context) {
    Settings settings = Provider.of<Settings>(context, listen: false);
    List<double> energyDistances = settings.imperialUnits ? Values.energyYards : Values.energyMeters;
    String units = settings.imperialUnits ? tr("COMPANION:UNITS_YARDS") : tr("UNITS:METRIC_METERS");
    List<Widget> widgets = energyDistances.map((e) {
      return _buildRangeEnergyColumn("${e.round()}$units", firearm.energyAt(energyDistances.indexOf(e)));
    }).toList();
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: widgets,
    );
  }

  Widget _buildCenter(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildName(context),
        const SizedBox(height: 10),
        _buildRangeEnergyRow(context),
      ],
    );
  }

  Widget _buildWidgets(BuildContext context) {
    return Container(
      height: 120,
      color: Utils.backgroundAt(_index),
      child: WidgetPadding.h30(
        alignment: Alignment.center,
        background: _eligibleBackground(),
        child: _buildCenter(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets(context);
}
