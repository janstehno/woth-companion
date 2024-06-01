import 'package:latlng/latlng.dart';

class Position {
  final double _x;
  final double _y;

  Position({
    required double x,
    required double y,
  })  : _x = x,
        _y = y;

  double get x => _x;

  double get y => _y;

  LatLng get latLng => toLatLng(_x, _y);

  static LatLng toLatLng(double x, double y) => LatLng.degree((y * 720) - 360, (x * 720) - 360);

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(
      x: json["X"],
      y: json["Y"],
    );
  }
}
