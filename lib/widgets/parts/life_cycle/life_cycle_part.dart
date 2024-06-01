import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wothcompanion/interface/graphics.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/model/connect/animal_cycle.dart';
import 'package:wothcompanion/widgets/text/text.dart';

class WidgetLifeCyclePart extends StatelessWidget {
  final int _hour;
  final AnimalCycle _animalCycle;
  final bool _bottom;

  const WidgetLifeCyclePart({
    super.key,
    required int hour,
    required AnimalCycle animalCycle,
    required bool bottom,
  })  : _hour = hour,
        _animalCycle = animalCycle,
        _bottom = bottom;

  Widget _buildHour() {
    return WidgetText(
      _hour.toString(),
      color: Interface.disabled,
      style: Style.normal.s10.w400,
    );
  }

  Widget _buildLifeCycle() {
    return Container(
      height: 30,
      width: 30,
      margin: const EdgeInsets.only(top: 2, bottom: 2),
      padding: EdgeInsets.all((_hour != 0 && _animalCycle.zone(_hour) == _animalCycle.zone(_hour - 1)) ? 7 : 2),
      child: SvgPicture.asset(
        Graphics.getZone(_animalCycle.zone(_hour)),
        fit: BoxFit.fitWidth,
        colorFilter: (_hour != 0 && _animalCycle.zone(_hour) == _animalCycle.zone(_hour - 1))
            ? ColorFilter.mode(Interface.disabled.withOpacity(0.4), BlendMode.dstIn)
            : null,
      ),
    );
  }

  Widget _buildWidgets(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (!_bottom) _buildHour(),
        _buildLifeCycle(),
        if (_bottom) _buildHour(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets(context);
}
