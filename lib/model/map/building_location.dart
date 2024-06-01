import 'package:wothcompanion/miscellaneous/enums.dart';
import 'package:wothcompanion/model/map/location.dart';
import 'package:wothcompanion/model/map/position.dart';

class BuildingLocation extends Location {
  final BuildingType _type;

  BuildingLocation({
    required super.id,
    required super.reserve,
    required super.position,
    required BuildingType type,
  }) : _type = type;

  BuildingType get type => _type;

  factory BuildingLocation.fromJson(Map<String, dynamic> json) {
    return BuildingLocation(
      id: json["ID"],
      reserve: json["RESERVE"],
      position: Position(x: json["X"], y: json["Y"]),
      type: BuildingType.values.firstWhere((e) {
        return e.name.toLowerCase() ==
            json["BUILDING"].split(":").elementAt(1).replaceAll("_", "").replaceAll("MARKER", "").toLowerCase();
      }),
    );
  }
}
