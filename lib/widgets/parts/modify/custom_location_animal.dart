import 'package:flutter/material.dart';
import 'package:wothcompanion/generated/assets.gen.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/model/exportables/custom_location.dart';
import 'package:wothcompanion/widgets/icons/icon.dart';
import 'package:wothcompanion/widgets/parts/animal/animal_trophy_rating.dart';
import 'package:wothcompanion/widgets/text/text.dart';

class WidgetCustomLocationAnimal extends StatelessWidget {
  final CustomLocationAnimal _animal;
  final double _width;

  const WidgetCustomLocationAnimal({
    super.key,
    required CustomLocationAnimal animal,
    required double width,
  })  : _animal = animal,
        _width = width;

  Widget _buildAge() {
    return Container(
      width: _width,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          WidgetIcon(
            Assets.graphics.icons.age,
            color: Interface.disabled,
          ),
          const SizedBox(width: 10),
          WidgetText(
            _animal.age,
            color: Interface.primaryLight,
            style: Style.normal.s16.w400,
          ),
        ],
      ),
    );
  }

  Widget _buildGender() {
    return Container(
      width: _width,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          WidgetIcon(
            Assets.graphics.icons.gender,
            color: Interface.disabled,
          ),
          const SizedBox(width: 10),
          WidgetText(
            _animal.gender,
            color: Interface.primaryLight,
            style: Style.normal.s16.w400,
          ),
        ],
      ),
    );
  }

  Widget _buildTrophyRating() {
    return Row(
      children: [
        WidgetIcon(
          Assets.graphics.icons.trophyRating,
          color: Interface.disabled,
        ),
        const SizedBox(width: 10),
        WidgetAnimalTrophyRating(
          rating: _animal.trophyRating,
          color: Interface.primaryLight,
        ),
      ],
    );
  }

  Widget _buildWidgets() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: _buildAge()),
        Expanded(child: _buildGender()),
        _buildTrophyRating(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
