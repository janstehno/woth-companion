import 'package:easy_localization/easy_localization.dart';
import 'package:wothcompanion/model/map/location.dart';
import 'package:wothcompanion/model/map/position.dart';

class AreaLocation extends Location {
  final String _habitat;

  AreaLocation({
    required super.id,
    required super.reserve,
    required super.position,
    required String habitat,
  }) : _habitat = habitat;

  String get name => tr(super.id);

  String get habitat => tr(_habitat);

  factory AreaLocation.fromJson(Map<String, dynamic> json) {
    return AreaLocation(
      id: json["ID"],
      reserve: json["RESERVE"],
      habitat: json["HABITAT"],
      position: Position(x: json["X"], y: json["Y"]),
    );
  }
}
