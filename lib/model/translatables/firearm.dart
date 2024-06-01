import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:wothcompanion/model/translatables/translatable.dart';

class Firearm extends Translatable {
  final String _action;
  final String _caliber;
  final int _tier;
  final int _mag;
  final List<dynamic> _energy;

  Firearm({
    required super.id,
    required String action,
    required String caliber,
    required int tier,
    required int mag,
    required List<dynamic>? energy,
  })  : _action = action,
        _caliber = caliber,
        _tier = tier,
        _mag = mag,
        _energy = energy ?? [];

  String get action => tr(_action);

  String get caliber => tr(_caliber);

  int get tier => _tier;

  int get mag => _mag;

  List<dynamic> get energy => _energy;

  int energyAt(int meters) => _energy.elementAtOrNull(meters) ?? 0;

  factory Firearm.fromJson(Map<String, dynamic> json) {
    return Firearm(
      id: json["ID"],
      action: json["ACTION"],
      caliber: json["CALIBER"],
      tier: json["TIER"],
      mag: json["MAG"],
      energy: json["ENERGY"],
    );
  }

  static Comparator<Firearm> sortByName = (a, b) {
    return a.name.compareTo(b.name);
  };

  static Comparator<Firearm> sortByTierCaliberName = (a, b) {
    if (a.caliber == b.caliber) return a.name.compareTo(b.name);
    if (a.tier == b.tier) return a.caliber.compareTo(b.caliber);
    return a.tier.compareTo(b.tier);
  };
}
