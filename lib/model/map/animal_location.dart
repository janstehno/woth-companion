import 'package:easy_localization/easy_localization.dart';
import 'package:wothcompanion/miscellaneous/enums.dart';
import 'package:wothcompanion/model/map/location.dart';
import 'package:wothcompanion/model/map/position.dart';

class AnimalLocation extends Location {
  final String _animal;
  final List<dynamic> _zones;

  AnimalLocation({
    required super.id,
    required String animal,
    required super.reserve,
    required super.position,
    required List<dynamic> zones,
  })  : _animal = animal,
        _zones = zones;

  String get animal => _animal;

  String get name => tr(_animal);

  Set<AnimalZoneLocation> get zones => _zones.map((e) => e as AnimalZoneLocation).toSet();

  factory AnimalLocation.fromJson(Map<String, dynamic> json) {
    return AnimalLocation(
      id: json["ID"],
      animal: json["ANIMAL"],
      reserve: json["RESERVE"],
      position: Position(x: json["X"], y: json["Y"]),
      zones: json["ZONES"].map((e) => AnimalZoneLocation.fromJson(e)).toList(),
    );
  }
}

class AnimalZoneLocation extends Location {
  final int _type;

  AnimalZoneLocation({
    required super.id,
    super.reserve,
    required super.position,
    required type,
  }) : _type = type;

  ZoneType get type => ZoneType.values.elementAt(_type);

  factory AnimalZoneLocation.fromJson(Map<String, dynamic> json) {
    return AnimalZoneLocation(
      id: json["ID"],
      position: Position(x: json["X"], y: json["Y"]),
      type: json["TYPE"],
    );
  }
}
