import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:wothcompanion/helpers/json.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/model/translatables/animal.dart';
import 'package:wothcompanion/model/translatables/firearm.dart';
import 'package:wothcompanion/widgets/text/text.dart';

class ListFirearmAnimals extends StatelessWidget {
  final Firearm _firearm;

  const ListFirearmAnimals(
    Firearm firearm, {
    super.key,
  }) : _firearm = firearm;

  Widget _buildAnimal(Animal animal) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        WidgetText(
          animal.name,
          color: Interface.primaryLight,
          style: Style.normal.s16.w400,
        ),
        WidgetText(
          animal.range,
          color: Interface.disabled,
          style: Style.normal.s8.w400i,
        ),
      ],
    );
  }

  List<Widget> _listRecommendedAnimals() {
    List<Animal> animals = HelperJSON.getFirearmAnimals(_firearm.id).sorted(Animal.sortByName);
    return animals.map((e) => _buildAnimal(e)).toList();
  }

  Widget _buildWidgets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _listRecommendedAnimals(),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
