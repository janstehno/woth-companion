import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:wothcompanion/generated/assets.gen.dart';
import 'package:wothcompanion/helpers/json.dart';
import 'package:wothcompanion/miscellaneous/enums.dart';
import 'package:wothcompanion/model/map/animal_location.dart';
import 'package:wothcompanion/model/map/area_location.dart';
import 'package:wothcompanion/model/map/building_location.dart';
import 'package:wothcompanion/model/translatables/reserve.dart';

class HelperMap {
  final Set<AnimalLocation> _animalsLocations = {};
  final Set<BuildingLocation> _buildingsLocations = {};
  final Set<AreaLocation> _areasLocations = {};

  AnimalLocation? _lastAnimalLocation;

  final Reserve _reserve;

  HelperMap({
    required reserve,
  }) : _reserve = reserve;

  Set<AnimalLocation> get animalsLocations => _animalsLocations;

  Set<BuildingLocation> get buildingsLocations => _buildingsLocations;

  Set<AreaLocation> get areasLocations => _areasLocations;

  Reserve get reserve => _reserve;

  void setup(
    Set<AnimalLocation> animalsLocations,
    Set<BuildingLocation> buildingsLocations,
    Set<AreaLocation> areasLocations,
  ) {
    _animalsLocations.addAll(animalsLocations);
    _buildingsLocations.addAll(buildingsLocations);
    _areasLocations.addAll(areasLocations);
  }

  Set<AnimalLocation> get shownAnimalsLocations {
    return _animalsLocations.where((e) => e.isShown && e.reserve == reserve.id).toSet();
  }

  Set<AnimalZoneLocation> get shownAnimalsZonesLocations {
    if (_lastAnimalLocation != null) return _lastAnimalLocation!.zones;
    return {};
  }

  Set<BuildingLocation> get shownBuildingsLocations {
    return _buildingsLocations.where((e) => e.isShown && e.reserve == reserve.id).toSet();
  }

  Set<AreaLocation> get shownAreasLocations {
    return _areasLocations.where((e) => e.isShown && e.reserve == reserve.id).toSet();
  }

  AnimalLocation? get shownAnimalsZonesLocation {
    return _lastAnimalLocation;
  }

  void showOrHideAnimalsZones(AnimalLocation animalLocation) {
    if (animalLocation.isShownDetail) {
      animalLocation.hideDetail();
      _lastAnimalLocation = null;
      return;
    }

    if (_lastAnimalLocation != null) _lastAnimalLocation!.hideDetail();
    animalLocation.showDetail();
    _lastAnimalLocation = animalLocation;
  }

  void resetAnimalsZones() {
    if (_lastAnimalLocation != null) _lastAnimalLocation!.hideDetail();
    _lastAnimalLocation = null;
  }

  bool isAnimalsZonesShown() {
    return _lastAnimalLocation != null;
  }

  bool isAnimalShown(String animalId) {
    AnimalLocation? animalLocation =
        _animalsLocations.firstWhereOrNull((e) => e.animal == animalId && e.reserve == reserve.id);
    if (animalLocation != null) return animalLocation.isShown;
    return false;
  }

  bool isBuildingShown(BuildingType buildingType) {
    BuildingLocation? buildingLocation =
        _buildingsLocations.firstWhereOrNull((e) => e.type == buildingType && e.reserve == reserve.id);
    if (buildingLocation != null) return buildingLocation.isShown;
    return false;
  }

  bool isAreasShown() {
    AreaLocation? areaLocation = _areasLocations.firstWhereOrNull((e) => e.reserve == reserve.id);
    if (areaLocation != null) return areaLocation.isShown;
    return false;
  }

  void showOrHideAnimal(String animalId) {
    resetAnimalsZones();
    for (AnimalLocation animalLocation in _animalsLocations) {
      if (animalLocation.animal == animalId && animalLocation.reserve == reserve.id) {
        animalLocation.showOrHide();
      }
    }
  }

  void showOrHideBuilding(BuildingType buildingType) {
    for (BuildingLocation buildingLocation in _buildingsLocations) {
      if (buildingLocation.type == buildingType && buildingLocation.reserve == reserve.id) {
        buildingLocation.showOrHide();
      }
    }
  }

  void showOrHideAreas() {
    for (AreaLocation areaLocation in _areasLocations) {
      if (areaLocation.reserve == reserve.id) areaLocation.showOrHide();
    }
  }

  Future<Set<AnimalLocation>> readAnimalsLocations() async {
    final data = await HelperJSON.getData(Assets.raw.reservesZones);
    final list = json.decode(data) as List<dynamic>;
    return list.map((e) => AnimalLocation.fromJson(e)).toSet();
  }

  Future<Set<BuildingLocation>> readBuildingsLocations() async {
    final data = await HelperJSON.getData(Assets.raw.reservesBuildings);
    final list = json.decode(data) as List<dynamic>;
    return list.map((e) => BuildingLocation.fromJson(e)).toSet();
  }

  Future<Set<AreaLocation>> readAreasLocations() async {
    final data = await HelperJSON.getData(Assets.raw.reservesAreas);
    final list = json.decode(data) as List<dynamic>;
    return list.map((e) => AreaLocation.fromJson(e)).toSet();
  }

  void activateAllLocationMarkers() {
    bool isEverythingShown = true;
    for (BuildingLocation buildingLocation in _buildingsLocations) {
      if (!buildingLocation.isShown) {
        isEverythingShown = false;
        break;
      }
    }
    if (isEverythingShown) {
      for (BuildingLocation buildingLocation in _buildingsLocations) {
        buildingLocation.hide();
      }
    } else {
      for (BuildingLocation buildingLocation in _buildingsLocations) {
        buildingLocation.show();
      }
    }
  }

  void activateAllAnimalMarkers() {
    resetAnimalsZones();
    bool isEverythingShown = true;
    for (AnimalLocation animalsLocation in _animalsLocations) {
      if (!animalsLocation.isShown) {
        isEverythingShown = false;
        break;
      }
    }
    if (isEverythingShown) {
      for (AnimalLocation animalsLocation in _animalsLocations) {
        animalsLocation.hide();
      }
    } else {
      for (AnimalLocation animalsLocation in _animalsLocations) {
        animalsLocation.show();
      }
    }
  }
}
