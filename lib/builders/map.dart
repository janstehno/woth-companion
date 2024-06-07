import 'package:flutter/material.dart';
import 'package:wothcompanion/activities/map.dart';
import 'package:wothcompanion/builders/builder.dart';
import 'package:wothcompanion/helpers/map.dart';
import 'package:wothcompanion/model/exportables/custom_location.dart';
import 'package:wothcompanion/model/map/animal_location.dart';
import 'package:wothcompanion/model/map/area_location.dart';
import 'package:wothcompanion/model/map/building_location.dart';
import 'package:wothcompanion/model/translatables/reserve.dart';

class BuilderMap extends BuilderBuilder {
  final Reserve _reserve;

  const BuilderMap({
    super.key,
    required Reserve reserve,
  })  : _reserve = reserve,
        super("M");

  Reserve get reserve => _reserve;

  @override
  State<StatefulWidget> createState() => BuilderMapState();
}

class BuilderMapState extends BuilderBuilderState {
  late final HelperMap _helperMap;

  @override
  void initState() {
    _helperMap = HelperMap(reserve: (widget as BuilderMap).reserve);
    super.initState();
  }

  @override
  void initializeData(AsyncSnapshot<Map<String, dynamic>> snapshot, BuildContext context) {
    Set<AnimalLocation> animalsLocations = snapshot.data!["animalsLocations"] ?? {};
    Set<BuildingLocation> buildingsLocations = snapshot.data!["buildingsLocations"] ?? {};
    Set<AreaLocation> areasLocations = snapshot.data!["areasLocations"] ?? {};
    Set<CustomLocation> customLocations = snapshot.data!["customLocations"] ?? {};
    _helperMap.setup(animalsLocations, buildingsLocations, areasLocations, customLocations);
  }

  @override
  Future<Map<String, dynamic>> loadData() async {
    Set<AnimalLocation> animalsLocations = await _helperMap.readAnimalsLocations();
    updateProgress("animalsLocations", animalsLocations);
    Set<BuildingLocation> buildingsLocations = await _helperMap.readBuildingsLocations();
    updateProgress("buildingsLocations", buildingsLocations);
    Set<AreaLocation> areasLocations = await _helperMap.readAreasLocations();
    updateProgress("areasLocations", areasLocations);
    Set<CustomLocation> customLocations = await _helperMap.readFile();
    updateProgress("customLocations", customLocations);

    await Future.delayed(const Duration(seconds: 1), () {});
    return loadedData;
  }

  @override
  Widget buildFutureWidget(BuildContext context) => ActivityMap(helperMap: _helperMap);
}
