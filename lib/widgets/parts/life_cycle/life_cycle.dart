import 'package:flutter/material.dart';
import 'package:wothcompanion/helpers/json.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/miscellaneous/utils.dart';
import 'package:wothcompanion/model/connect/animal_cycle.dart';
import 'package:wothcompanion/widgets/app/margin.dart';
import 'package:wothcompanion/widgets/app/padding.dart';
import 'package:wothcompanion/widgets/parts/life_cycle/life_cycle_part.dart';
import 'package:wothcompanion/widgets/text/text.dart';

class WidgetLifeCycle extends StatelessWidget {
  final int _index;
  final AnimalCycle _animalCycle;

  const WidgetLifeCycle({
    super.key,
    required int index,
    required AnimalCycle animalCycle,
  })  : _index = index,
        _animalCycle = animalCycle;

  List<Widget> _listLifeCycles(int start, int end, bool bottom) {
    List<Widget> cycles = [];
    for (int hour = start; hour < end; hour++) {
      cycles.add(
        Flexible(
          flex: 1,
          child: WidgetLifeCyclePart(
            hour: hour,
            animalCycle: _animalCycle,
            bottom: bottom,
          ),
        ),
      );
    }
    return cycles;
  }

  Widget _buildName() {
    return WidgetMargin.fromLTRB(
      5,
      0,
      0,
      5,
      child: WidgetText(
        HelperJSON.getAnimal(_animalCycle.animal).name,
        color: Interface.primaryLight,
        style: Style.normal.s16.w400,
      ),
    );
  }

  Widget _buildLandscape() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _listLifeCycles(0, 24, false),
    );
  }

  Widget _buildPortrait() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _listLifeCycles(0, 12, false),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _listLifeCycles(12, 24, true),
        )
      ],
    );
  }

  Widget _buildCenter(Orientation orientation, double width) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildName(),
        const SizedBox(height: 5),
        if (orientation == Orientation.landscape || width > 1000) _buildLandscape() else _buildPortrait(),
      ],
    );
  }

  Widget _buildWidgets(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Orientation orientation = MediaQuery.of(context).orientation;
    return SizedBox(
      height: (orientation == Orientation.landscape || width > 1000) ? 130 : 180,
      child: WidgetPadding.h30(
        background: Utils.backgroundAt(_index),
        child: _buildCenter(orientation, width),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets(context);
}
