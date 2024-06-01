import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wothcompanion/helpers/json.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/miscellaneous/enums.dart';
import 'package:wothcompanion/model/connect/animal_habitat.dart';
import 'package:wothcompanion/model/translatables/animal.dart';
import 'package:wothcompanion/widgets/text/text.dart';

class ListAnimalHabitats extends StatelessWidget {
  final Animal _animal;

  const ListAnimalHabitats(
    Animal animal, {
    super.key,
  }) : _animal = animal;

  Widget _buildHabitatName(AnimalHabitat animalHabitat) {
    return WidgetText(
      HelperJSON.getHabitat(animalHabitat.habitat).name,
      color: Interface.primaryLight,
      style: Style.normal.s16.w400,
    );
  }

  List<Widget> _listHabitats(Set<AnimalHabitat> habitats) {
    return habitats.map((e) => _buildHabitatName(e)).toList();
  }

  Widget _buildHabitatList(Set<AnimalHabitat> habitats) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _listHabitats(habitats),
    );
  }

  Widget _buildHabitats(String habitatType, Set<AnimalHabitat> habitats) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetText(
          tr(habitatType).toUpperCase(),
          color: Interface.disabled,
          style: Style.condensed.s18.w300,
        ),
        const SizedBox(height: 3),
        _buildHabitatList(habitats),
      ],
    );
  }

  Widget _buildWidgets() {
    Set<AnimalHabitat> primaryHabitats = HelperJSON.getAnimalHabitats(_animal.id, HabitatType.primary);
    Set<AnimalHabitat> secondaryHabitats = HelperJSON.getAnimalHabitats(_animal.id, HabitatType.secondary);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (primaryHabitats.isNotEmpty) _buildHabitats("ANIMAL:ANIMAL_HABITAT_PRIMARY", primaryHabitats),
        if (secondaryHabitats.isNotEmpty) const SizedBox(height: 15),
        if (secondaryHabitats.isNotEmpty) _buildHabitats("ANIMAL:ANIMAL_HABITAT_SECONDARY", secondaryHabitats),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
