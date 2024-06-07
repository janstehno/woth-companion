import 'package:flutter/material.dart';
import 'package:wothcompanion/activities/modify/add/custom_location.dart';
import 'package:wothcompanion/model/exportables/custom_location.dart';

class ActivityEditCustomLocation extends ActivityAddCustomLocation {
  const ActivityEditCustomLocation({
    super.key,
    required super.id,
    required super.helperMap,
    required super.onSuccess,
  });

  @override
  State<StatefulWidget> createState() => ActivityEditCustomLocationState();
}

class ActivityEditCustomLocationState extends ActivityAddCustomLocationState {
  late final String _location;
  late final CustomLocation _customLocation;

  @override
  void initState() {
    _location = (widget as ActivityEditCustomLocation).id;
    _customLocation = helperMap.getCustomLocation(_location)!;

    textController.text = _customLocation.description ?? "";
    color = _customLocation.color;
    animals = _customLocation.animals;
    super.initState();
  }

  @override
  void onSuccess() {
    _customLocation.setDescription(textController.text);
    _customLocation.setColor(color);
    _customLocation.setAnimals(animals);
    helperMap.save();
  }

  void onRemove() {
    helperMap.customLocations.removeWhere((e) => e.id == _location);
    helperMap.save();
  }
}
