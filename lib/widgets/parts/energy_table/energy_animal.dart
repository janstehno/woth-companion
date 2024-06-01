import 'package:flutter/material.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/widgets/parts/energy_table/energy.dart';
import 'package:wothcompanion/widgets/text/text.dart';

class WidgetEnergyAnimal extends WidgetEnergy {
  const WidgetEnergyAnimal({
    super.key,
    required super.index,
    required super.firearm,
    required super.animal,
  });

  @override
  Widget buildName(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 3,
          child: WidgetText(
            animal.name,
            color: Interface.primaryLight,
            style: Style.normal.s16.w400,
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          flex: 1,
          child: WidgetText(
            animal.range,
            color: Interface.disabled,
            style: Style.normal.s12.w400,
          ),
        ),
      ],
    );
  }
}
