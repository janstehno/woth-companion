import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wothcompanion/helpers/json.dart';
import 'package:wothcompanion/model/translatables/animal.dart';
import 'package:wothcompanion/model/translatables/firearm.dart';
import 'package:wothcompanion/widgets/app/bar_app.dart';
import 'package:wothcompanion/widgets/app/scaffold.dart';
import 'package:wothcompanion/widgets/dropdown/drop_down.dart';
import 'package:wothcompanion/widgets/dropdown/drop_down_item.dart';
import 'package:wothcompanion/widgets/parts/energy_table/energy_animal.dart';
import 'package:wothcompanion/widgets/parts/energy_table/energy_both.dart';
import 'package:wothcompanion/widgets/parts/energy_table/energy_firearm.dart';
import 'package:wothcompanion/widgets/title/title.dart';
import 'package:wothcompanion/widgets/title/title_sub.dart';

class ActivityHuntingTable extends StatefulWidget {
  const ActivityHuntingTable({
    super.key,
  });

  @override
  ActivityHuntingTableState createState() => ActivityHuntingTableState();
}

class ActivityHuntingTableState extends State<ActivityHuntingTable> {
  late final List<Animal> _animals;
  late final List<Firearm> _firearms;

  int _animalIndex = 0;
  int _firearmIndex = 0;

  @override
  void initState() {
    _animals = HelperJSON.animals.sorted(Animal.sortByTierName);
    _firearms = HelperJSON.firearms.sorted(Firearm.sortByTierCaliberName);
    super.initState();
  }

  DropdownMenuItem _buildDropDownMenuItem(int value, String text) {
    return WidgetDropDownItem(
      text: text,
      value: value,
    );
  }

  List<DropdownMenuItem> _buildDropDownAnimals() {
    List<DropdownMenuItem> items = [];
    items.add(_buildDropDownMenuItem(0, "-"));
    items.addAll(_animals.map((e) => _buildDropDownMenuItem(_animals.indexOf(e) + 1, e.name)).toList());
    return items;
  }

  List<DropdownMenuItem> _buildDropDownFirearms() {
    List<DropdownMenuItem> items = [];
    items.add(_buildDropDownMenuItem(0, "-"));
    items.addAll(_firearms.map((e) => _buildDropDownMenuItem(_firearms.indexOf(e) + 1, e.name)));
    return items;
  }

  List<Widget> _listAnimal() {
    return [
      WidgetTitle(tr("UI:SECTION_ANIMALS")),
      WidgetDropDown(
        value: _animalIndex,
        items: _buildDropDownAnimals(),
        onChange: (dynamic value) => setState(() => _animalIndex = value),
      ),
    ];
  }

  List<Widget> _listFirearm() {
    return [
      WidgetTitle(tr("UI:SECTION_FIREARMS")),
      WidgetDropDown(
        value: _firearmIndex,
        items: _buildDropDownFirearms(),
        onChange: (dynamic value) => setState(() => _firearmIndex = value),
      ),
    ];
  }

  List<Widget> _listFirearms() {
    int tier = 0;
    return _firearms.map((firearm) {
      bool showTitle = tier < firearm.tier;
      tier = tier < firearm.tier ? firearm.tier : tier;
      return Column(
        children: [
          if (showTitle) WidgetSubtitle("${tr("UI:TIER")} ${firearm.tier}"),
          WidgetEnergyFirearm(
            index: _firearms.indexOf(firearm),
            firearm: firearm,
            animal: _animals.elementAt(_animalIndex - 1),
          ),
        ],
      );
    }).toList();
  }

  List<Widget> _listAnimals() {
    int tier = 0;
    return _animals.map((animal) {
      bool showTitle = tier < animal.tier;
      tier = tier < animal.tier ? animal.tier : tier;
      if (showTitle) return WidgetSubtitle("${tr("UI:TIER")} ${animal.tier}");
      return WidgetEnergyAnimal(
        index: _animals.indexOf(animal),
        firearm: _firearms.elementAt(_firearmIndex - 1),
        animal: animal,
      );
    }).toList();
  }

  List<Widget> _listRows() {
    bool animalChosen = _animalIndex > 0;
    bool bothChosen = _animalIndex > 0 && _firearmIndex > 0;
    List<Widget> widgets = [];
    if (bothChosen) {
      widgets.add(
        WidgetEnergyBoth(
          index: 0,
          firearm: _firearms.elementAt(_firearmIndex - 1),
          animal: _animals.elementAt(_animalIndex - 1),
        ),
      );
    } else if (animalChosen) {
      widgets.addAll(_listFirearms());
    } else {
      widgets.addAll(_listAnimals());
    }
    return widgets;
  }

  List<Widget> _listTable() {
    return [
      WidgetTitle(tr("COMPANION:HUNTING_TABLE")),
      if (_animalIndex > 0 || _firearmIndex > 0) ..._listRows(),
    ];
  }

  Widget _buildWidgets() {
    return WidgetScaffold(
      appBar: WidgetAppBar(
        tr("COMPANION:HUNTING_TABLE"),
        context: context,
      ),
      children: [
        ..._listAnimal(),
        ..._listFirearm(),
        ..._listTable(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
