import 'package:flutter/material.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/model/translatables/animal.dart';
import 'package:wothcompanion/widgets/parts/animal/animal_trophy_rating.dart';
import 'package:wothcompanion/widgets/text/text.dart';

class ListAnimalTrophyRating extends StatelessWidget {
  final Animal _animal;

  const ListAnimalTrophyRating(
    Animal animal, {
    super.key,
  }) : _animal = animal;

  Widget _buildTrophyRating(int rating) {
    List<int?> trophyRange = _animal.trophyRange(rating);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: WidgetText(
            "${trophyRange.elementAt(0) ?? "?"} - ${trophyRange.elementAt(1) ?? "?"}",
            color: Interface.primaryLight,
            style: Style.normal.s16.w400,
          ),
        ),
        WidgetAnimalTrophyRating(rating: rating),
      ],
    );
  }

  List<Widget> _listTrophyRating() {
    List<Widget> widgets = [];
    for (int i = 1; i < 6; i++) {
      widgets.add(_buildTrophyRating(i));
    }
    return widgets;
  }

  Widget _buildWidgets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _listTrophyRating(),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
