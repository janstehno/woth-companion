import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:wothcompanion/helpers/json.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/model/translatables/animal.dart';
import 'package:wothcompanion/model/translatables/firearm.dart';
import 'package:wothcompanion/widgets/text/text.dart';

class ListAnimalFirearms extends StatelessWidget {
  final Animal _animal;

  const ListAnimalFirearms(
    Animal animal, {
    super.key,
  }) : _animal = animal;

  Widget _buildFirearm(Firearm firearm) {
    return WidgetText(
      firearm.name,
      color: Interface.primaryLight,
      style: Style.normal.s16.w400,
    );
  }

  List<Widget> _listRecommendedFirearms() {
    List<Firearm> firearms = HelperJSON.getAnimalFirearms(_animal.id).sorted(Firearm.sortByName);
    return firearms.map((e) => _buildFirearm(e)).toList();
  }

  Widget _buildWidgets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _listRecommendedFirearms(),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
