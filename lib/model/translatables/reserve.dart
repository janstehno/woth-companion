import 'package:wothcompanion/miscellaneous/enums.dart';
import 'package:wothcompanion/model/translatables/translatable.dart';

class Reserve extends Translatable {
  final int _count;
  final MapRegion _region;

  Reserve({
    required super.id,
    required int count,
    required MapRegion region,
  })  : _count = count,
        _region = region;

  int get count => _count;

  MapRegion get region => _region;

  factory Reserve.fromJson(Map<String, dynamic> json) {
    return Reserve(
      id: json["ID"],
      count: json["COUNT"],
      region: MapRegion.values.firstWhere((e) {
        return e.name.toLowerCase() ==
            json["ID"].split(":").elementAt(1).replaceAll("_", "").replaceAll("MAPNAME", "").toLowerCase();
      }),
    );
  }

  static Comparator<Reserve> sortByName = (a, b) {
    return a.name.compareTo(b.name);
  };
}
