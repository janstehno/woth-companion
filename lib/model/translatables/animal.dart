import 'package:wothcompanion/model/translatables/translatable.dart';

class Animal extends Translatable {
  final String _latin;
  final int _tier;
  final int _min;
  final int _max;
  final List<dynamic> _trophy;

  Animal({
    required super.id,
    required String latin,
    required int tier,
    required int min,
    required int max,
    required List<dynamic>? trophy,
  })  : _latin = latin,
        _tier = tier,
        _min = min,
        _max = max,
        _trophy = trophy ?? [];

  String get latin => _latin;

  int get tier => _tier;

  int get min => _min;

  int get max => _max;

  String get range => "${_min != _max ? _min : ""} ${_min != _max ? "-" : ""} ${_max == 0 ? "" : _max}";

  List<int?> trophyRange(int star) {
    if (_trophy.isEmpty) return [null, null];
    int from = _trophy.elementAtOrNull(star - 1);
    int to = star == 5 ? 500 : _trophy.elementAtOrNull(star) - 1;
    return [from, to];
  }

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      id: json["ID"],
      latin: json["LATIN"],
      tier: json["TIER"],
      min: json["MIN"],
      max: json["MAX"],
      trophy: json["TROPHY"],
    );
  }

  static Comparator<Animal> sortByName = (a, b) {
    return a.name.compareTo(b.name);
  };

  static Comparator<Animal> sortByTierName = (a, b) {
    if (a.tier == b.tier) return a.name.compareTo(b.name);
    return a.tier.compareTo(b.tier);
  };
}
