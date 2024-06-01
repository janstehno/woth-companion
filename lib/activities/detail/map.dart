import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wothcompanion/helpers/json.dart';
import 'package:wothcompanion/helpers/map.dart';
import 'package:wothcompanion/miscellaneous/enums.dart';
import 'package:wothcompanion/miscellaneous/utils.dart';
import 'package:wothcompanion/model/translatables/animal.dart';
import 'package:wothcompanion/widgets/app/bar_app.dart';
import 'package:wothcompanion/widgets/app/scaffold.dart';
import 'package:wothcompanion/widgets/section/map/location.dart';
import 'package:wothcompanion/widgets/title/title_tap.dart';

class DetailMap extends StatefulWidget {
  final HelperMap _helperMap;
  final Function _onTap;

  const DetailMap({
    super.key,
    required HelperMap helperMap,
    required Function onTap,
  })  : _helperMap = helperMap,
        _onTap = onTap;

  HelperMap get helperMap => _helperMap;

  Function get onTap => _onTap;

  @override
  DetailMapState createState() => DetailMapState();
}

class DetailMapState extends State<DetailMap> {
  Widget _buildLocation(int index, String name, bool isShown, Function onTap) {
    return WidgetSectionLocation(
      name,
      background: Utils.backgroundAt(index),
      active: isShown,
      onTap: () {
        setState(() {
          onTap();
          widget.onTap();
        });
      },
    );
  }

  String _buildingName(BuildingType buildingType) {
    switch (buildingType) {
      case BuildingType.lodge:
        return tr("COMPANION:LODGE");
      case BuildingType.cabin:
        return tr("COMPANION:CABIN");
      case BuildingType.campsite:
        return tr("UI:MARKER_CAMPSITE");
      case BuildingType.huntingStand:
        return tr("UI:MARKER_HUNTING_STAND");
    }
  }

  Widget _buildBuilding(int index, BuildingType buildingType) {
    return _buildLocation(
      index,
      _buildingName(buildingType),
      widget.helperMap.isBuildingShown(buildingType),
      () => widget.helperMap.showOrHideBuilding(buildingType),
    );
  }

  Widget _buildAreas(int index) {
    return _buildLocation(
      index,
      tr("COMPANION:AREA"),
      widget.helperMap.isAreasShown(),
      () => widget.helperMap.showOrHideAreas(),
    );
  }

  Widget _buildAnimal(int index, Animal animal) {
    return _buildLocation(
      index,
      animal.name,
      widget.helperMap.isAnimalShown(animal.id),
      () => widget.helperMap.showOrHideAnimal(animal.id),
    );
  }

  List<Widget> _listLocations() {
    List<BuildingType> buildings = [
      BuildingType.lodge,
      BuildingType.cabin,
      BuildingType.campsite,
      BuildingType.huntingStand
    ];
    List<Widget> widgets = buildings.mapIndexed((i, e) => _buildBuilding(i, e)).toList();
    widgets.add(_buildAreas(buildings.length));
    return widgets;
  }

  List<Widget> _listLocationSection() {
    return [
      WidgetTitleTap(
        tr("UI:MARKERS"),
        onTap: () {
          setState(() {
            widget.helperMap.activateAllLocationMarkers();
            widget.onTap();
          });
        },
      ),
      ..._listLocations(),
    ];
  }

  List<Widget> _listAnimals() {
    List<Animal> animals = HelperJSON.getReserveAnimals(widget.helperMap.reserve.id).sorted(Animal.sortByName);
    return animals.mapIndexed((i, e) => _buildAnimal(i, e)).toList();
  }

  List<Widget> _listAnimalSection() {
    return [
      WidgetTitleTap(
        tr("UI:SECTION_ANIMALS"),
        onTap: () {
          setState(() {
            widget.helperMap.activateAllAnimalMarkers();
            widget.onTap();
          });
        },
      ),
      ..._listAnimals(),
    ];
  }

  Widget _buildWidgets() {
    return WidgetScaffold(
      appBar: WidgetAppBar(
        widget.helperMap.reserve.name,
        context: context,
      ),
      children: [
        ..._listLocationSection(),
        ..._listAnimalSection(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
