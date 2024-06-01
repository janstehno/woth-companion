import 'package:wothcompanion/miscellaneous/enums.dart';

class AnimalHabitat {
  final int _type;
  final String _animal;
  final String _habitat;

  AnimalHabitat({
    required int type,
    required String animal,
    required String habitat,
  })  : _type = type,
        _animal = animal,
        _habitat = habitat;

  HabitatType get type => HabitatType.values.elementAt(_type);

  String get animal => _animal;

  String get habitat => _habitat;

  factory AnimalHabitat.fromJson(Map<String, dynamic> json) {
    return AnimalHabitat(
      type: json["TYPE"],
      animal: json["ANIMAL"],
      habitat: json["HABITAT"],
    );
  }
}
