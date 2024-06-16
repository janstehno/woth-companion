import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/settings.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/miscellaneous/values.dart';
import 'package:wothcompanion/model/translatables/firearm.dart';
import 'package:wothcompanion/widgets/text/text.dart';

class ListFirearmEnergy extends StatelessWidget {
  final Firearm _firearm;

  const ListFirearmEnergy(
    Firearm firearm, {
    super.key,
  }) : _firearm = firearm;

  Widget _buildRangeEnergy(String distance, int energy) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        WidgetText(
          distance,
          color: Interface.disabled,
          style: Style.normal.s12.w400,
        ),
        WidgetText(
          energy.toString(),
          color: Interface.primaryLight,
          style: Style.normal.s16.w400,
        ),
      ],
    );
  }

  List<Widget> _listRangeEnergy(BuildContext context) {
    Settings settings = Provider.of<Settings>(context, listen: false);
    List<double> energyDistances = settings.imperialUnits ? Values.energyYards : Values.energyMeters;
    String units = settings.imperialUnits ? tr("UNITS_YARDS") : tr("UNITS:METRIC_METERS");
    return energyDistances.map((e) {
      return _buildRangeEnergy("${e.round()}$units", _firearm.energyAt(energyDistances.indexOf(e)));
    }).toList();
  }

  Widget _buildWidgets(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _listRangeEnergy(context),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets(context);
}
