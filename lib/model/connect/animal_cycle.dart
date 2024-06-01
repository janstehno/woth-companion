import 'package:wothcompanion/helpers/json.dart';
import 'package:wothcompanion/miscellaneous/enums.dart';
import 'package:wothcompanion/model/translatables/animal.dart';

class AnimalCycle {
  final String _animal;
  final List<dynamic> _cycle;

  AnimalCycle({
    required String animal,
    required List<dynamic> cycle,
  })  : _animal = animal,
        _cycle = cycle;

  String get animal => _animal;

  List<CycleZone> get cycle => _cycle.map((e) => e as CycleZone).toList();

  ZoneType zone(int hour) => cycle.firstWhere((e) => e.from <= hour && e.to >= hour).type;

  factory AnimalCycle.fromJson(Map<String, dynamic> json) {
    return AnimalCycle(
      animal: json["ANIMAL"],
      cycle: json["CYCLE"].map((e) => CycleZone.fromJson(e)).toList(),
    );
  }

  static Comparator<AnimalCycle> sortByTierName = (a, b) {
    return Animal.sortByTierName(HelperJSON.getAnimal(a.animal), HelperJSON.getAnimal(b.animal));
  };
}

class CycleZone {
  final int _type;
  final int _from;
  final int _to;

  CycleZone({
    required type,
    required from,
    required to,
  })  : _type = type,
        _from = from,
        _to = to;

  ZoneType get type => ZoneType.values.elementAt(_type);

  int get from => _from;

  int get to => _to;

  factory CycleZone.fromJson(Map<String, dynamic> json) {
    return CycleZone(
      type: json["TYPE"],
      from: json["FROM"],
      to: json["TO"],
    );
  }
}
