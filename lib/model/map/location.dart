import 'package:latlng/latlng.dart';
import 'package:wothcompanion/model/map/position.dart';

abstract class Location {
  final String _id;
  final String? _reserve;
  final Position _position;

  bool _shown = false;
  bool _shownDetail = false;

  Location({
    required String id,
    required String? reserve,
    required Position position,
  })  : _id = id,
        _reserve = reserve,
        _position = position;

  String get id => _id;

  String? get reserve => _reserve;

  Position get position => _position;

  LatLng get coordinates => _position.latLng;

  bool get isShown => _shown;

  bool get isShownDetail => _shownDetail;

  void show() => _shown = true;

  void hide() => _shown = false;

  void showOrHide() => _shown ? hide() : show();

  void showDetail() => _shownDetail = true;

  void hideDetail() => _shownDetail = false;
}
