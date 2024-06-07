import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
import 'package:wothcompanion/activities/detail/map.dart';
import 'package:wothcompanion/activities/modify/add/custom_location.dart';
import 'package:wothcompanion/activities/modify/edit/custom_location.dart';
import 'package:wothcompanion/generated/assets.gen.dart';
import 'package:wothcompanion/helpers/map.dart';
import 'package:wothcompanion/interface/graphics.dart';
import 'package:wothcompanion/interface/interface.dart';
import 'package:wothcompanion/interface/style.dart';
import 'package:wothcompanion/miscellaneous/enums.dart';
import 'package:wothcompanion/miscellaneous/projection.dart';
import 'package:wothcompanion/model/exportables/custom_location.dart';
import 'package:wothcompanion/model/map/animal_location.dart';
import 'package:wothcompanion/model/map/area_location.dart';
import 'package:wothcompanion/model/map/building_location.dart';
import 'package:wothcompanion/widgets/button/button_icon.dart';
import 'package:wothcompanion/widgets/maps/marker_animal.dart';
import 'package:wothcompanion/widgets/maps/marker_area.dart';
import 'package:wothcompanion/widgets/maps/marker_building.dart';
import 'package:wothcompanion/widgets/maps/marker_zone.dart';
import 'package:wothcompanion/widgets/text/text.dart';

class ActivityMap extends StatefulWidget {
  final HelperMap _helperMap;

  const ActivityMap({
    super.key,
    required HelperMap helperMap,
  }) : _helperMap = helperMap;

  HelperMap get helperMap => _helperMap;

  @override
  ActivityMapState createState() => ActivityMapState();
}

class ActivityMapState extends State<ActivityMap> {
  final double _minZoom = 1;
  final double _maxZoom = 3;
  final double _zoomSpeed = 0.02;
  final MapController _mapController = MapController(
    zoom: 1,
    location: LatLng.degree(0, 0),
    projection: const MapProjection(),
  );

  final double _verticalPadding = 15;
  final double _horizontalPadding = 15;

  final double _areaMarkerWidth = 100;
  final double _areaMarkerHeight = 30;

  late MapTransformer _mapTransformer;
  late double _tileSize;

  Offset? _dragStart;
  double _scaleStart = 1.0;
  double _centerLatEnd = LatLng.degree(0, 0).latitude.degrees;
  double _centerLngEnd = LatLng.degree(0, 0).longitude.degrees;
  double _screenWidth = 0;
  double _screenHeight = 0;
  double _animalMarkerSize = 20;
  double _zoneMarkerSize = 20;
  double _buildingMarkerSize = 25;

  bool _render = true;

  @override
  void reassemble() {
    widget.helperMap.resetAnimalsZones();
    super.reassemble();
  }

  void _getScreenSize() {
    Size size = MediaQuery.of(context).size;
    _screenWidth = size.width;
    _screenHeight = size.height;
  }

  void _getTileSize(Orientation orientation) {
    _tileSize = (orientation == Orientation.portrait ? _screenHeight : _screenWidth) / 4;
  }

  double _clamp(double x, double min, double max) {
    if (x < min) x = min;
    if (x > max) x = max;
    return x;
  }

  bool _inView(Offset offset, double width, double height) {
    double left = offset.dx - (width / 2);
    double right = offset.dx + (width / 2);
    double top = offset.dy - (height / 2);
    double bottom = offset.dy + (height / 2);
    if ((right >= 0 && left <= _screenWidth) && (bottom >= 0 && top <= _screenHeight)) return true;
    return false;
  }

  void _values(double zoom) {
    if (zoom >= 1) {
      _buildingMarkerSize = 25;
      _animalMarkerSize = 20;
    }
    if (zoom > 1.666) {
      _buildingMarkerSize = 24;
      _animalMarkerSize = 25;
    }
    if (zoom > 2.333) {
      _buildingMarkerSize = 23;
      _animalMarkerSize = 30;
      _zoneMarkerSize = 20;
    }
  }

  void _onScaleStart(ScaleStartDetails details) {
    setState(() {
      _dragStart = details.focalPoint;
      _scaleStart = 1.0;
      _render = false;
    });
  }

  void _onScaleEnd() {
    setState(() {
      _render = true;
    });
  }

  void _onScaleMove(details) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;
    _values(_mapController.zoom);

    if (scaleDiff > 0) {
      setState(() {
        _mapController.zoom = _clamp(_mapController.zoom + _zoomSpeed, _minZoom, _maxZoom);
      });
    } else if (scaleDiff < 0) {
      setState(() {
        _mapController.zoom = _clamp(_mapController.zoom - _zoomSpeed, _minZoom, _maxZoom);
      });
    } else {
      final now = details.focalPoint;
      final diff = now - _dragStart!;
      setState(() {
        _dragStart = now;
        _mapTransformer.drag(diff.dx, diff.dy);
      });
    }
  }

  void _onScaleBorder() {
    if (_mapTransformer.toOffset(LatLng.degree(_mapController.center.latitude.degrees, -360)).dx > 0) {
      double y = _centerLngEnd + (-360 - _mapTransformer.toLatLng(const Offset(0, 0)).longitude.degrees);
      y = y > 0 ? 0 : y;
      _mapController.center = LatLng.degree(_mapController.center.latitude.degrees, y);
    }
    if (_mapTransformer.toOffset(LatLng.degree(_mapController.center.latitude.degrees, 360)).dx < _screenWidth) {
      double y = _centerLngEnd + (360 - _mapTransformer.toLatLng(Offset(_screenWidth, 0)).longitude.degrees);
      y = y < 0 ? 0 : y;
      _mapController.center = LatLng.degree(_mapController.center.latitude.degrees, y);
    }
    if (_mapTransformer.toOffset(LatLng.degree(-360, _mapController.center.longitude.degrees)).dy > 0) {
      double x = _centerLatEnd + (-360 - _mapTransformer.toLatLng(const Offset(0, 0)).latitude.degrees);
      x = x > 0 ? 0 : x;
      _mapController.center = LatLng.degree(x, _mapController.center.longitude.degrees);
    }
    if (_mapTransformer.toOffset(LatLng.degree(360, _mapController.center.longitude.degrees)).dy < _screenHeight) {
      double x = _centerLatEnd + (360 - _mapTransformer.toLatLng(Offset(0, _screenHeight)).latitude.degrees);
      x = x < 0 ? 0 : x;
      _mapController.center = LatLng.degree(x, _mapController.center.longitude.degrees);
    }
    _centerLatEnd = _mapController.center.latitude.degrees;
    _centerLngEnd = _mapController.center.longitude.degrees;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    _onScaleMove(details);
    _onScaleBorder();
  }

  Widget _buildTileLayer() {
    return TileLayer(builder: (context, x, y, z) {
      if ((z == 1 && (x >= -1 && y >= -1 && x <= 2 && y <= 2)) ||
          (z == 2 && (x >= -2 && y >= -2 && x <= 5 && y <= 5)) ||
          (z == 3 && (x >= -4 && y >= -4 && x <= 11 && y <= 11))) {
        return Image.asset(
          Graphics.getTile(widget.helperMap.reserve.region, x, y, z),
          fit: BoxFit.fitWidth,
        );
      }
      return const SizedBox.shrink();
    });
  }

  List<Widget> _listBuildings() {
    if (_render) {
      return widget.helperMap.shownBuildingsLocations.map((e) => _buildBuildingLocation(e)).toList();
    }
    return [];
  }

  List<Widget> _listZones() {
    if (_mapController.zoom > 1.666) {
      return widget.helperMap.shownAnimalsZonesLocations.map((e) => _buildAnimalZoneLocation(e)).toList();
    }
    return [];
  }

  List<Widget> _listLocations() {
    if (_mapController.zoom > 1.666) {
      if (_render) {
        return widget.helperMap.shownAnimalsLocations.map((e) => _buildAnimalLocation(e)).toList();
      } else if (widget.helperMap.isAnimalsZonesShown()) {
        return [_buildAnimalLocation(widget.helperMap.shownAnimalsLocations.firstWhere((e) => e.isShownDetail))];
      }
    }
    return [];
  }

  List<Widget> _listAreas() {
    if (_mapController.zoom < 1.666) {
      return widget.helperMap.shownAreasLocations.map((e) => _buildAreaLocation(e)).toList();
    }
    return [];
  }

  Widget _buildMarkerInfo() {
    if (widget.helperMap.isAnimalsZonesShown()) {
      return Positioned(
        width: _screenWidth - 120,
        top: _verticalPadding + 5,
        left: 60,
        child: Center(
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
            decoration: BoxDecoration(
              color: Interface.primaryDark,
              borderRadius: BorderRadius.circular(5),
            ),
            child: WidgetText(
              widget.helperMap.shownAnimalsZonesLocation!.name,
              color: Interface.primaryLight,
              style: Style.normal.s12.w400,
            ),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  bool _zoneInView(Offset offset, double width, double height) {
    double left = offset.dx;
    double right = offset.dx;
    double top = offset.dy;
    double bottom = offset.dy;
    if ((right >= 0 && left <= _screenWidth) && (bottom >= 0 && top <= _screenHeight)) return true;
    return false;
  }

  Widget _buildActivityModify(AnimalLocation animalLocation) {
    if (widget.helperMap.isCustomized(animalLocation.id)) {
      return ActivityEditCustomLocation(
        id: animalLocation.id,
        helperMap: widget.helperMap,
        onSuccess: () => setState(() {}),
      );
    } else {
      return ActivityAddCustomLocation(
        id: animalLocation.id,
        helperMap: widget.helperMap,
        onSuccess: () => setState(() {}),
      );
    }
  }

  Widget _buildAnimalLocation(AnimalLocation animalLocation) {
    CustomLocation? customLocation = widget.helperMap.getCustomLocation(animalLocation.id);
    Offset offset = _mapTransformer.toOffset(animalLocation.coordinates);
    if (_inView(offset, _animalMarkerSize, _animalMarkerSize)) {
      return WidgetMarkerAnimal(
        animalLocation,
        offset: offset,
        size: _animalMarkerSize,
        color: customLocation != null ? customLocation.color : Interface.primaryLight,
        onTap: () => setState(() => widget.helperMap.showOrHideAnimalsZones(animalLocation)),
        onLongTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (e) => _buildActivityModify(animalLocation)));
        },
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildAnimalZoneLocation(AnimalZoneLocation animalZoneLocation) {
    Offset offset = _mapTransformer.toOffset(animalZoneLocation.coordinates);
    double newSize = _zoneMarkerSize / 1.5;
    if (_zoneInView(offset, _zoneMarkerSize, _zoneMarkerSize)) {
      return WidgetMarkerZone(
        animalZoneLocation,
        offset: offset,
        size: _zoneMarkerSize,
      );
    } else {
      double px = offset.dx < (0 + newSize)
          ? 0
          : offset.dx > (_screenWidth - newSize)
              ? _screenWidth
              : offset.dx;
      double py = offset.dy < (0 + newSize)
          ? 0
          : offset.dy > (_screenHeight - newSize)
              ? _screenHeight
              : offset.dy;
      return WidgetMarkerZone(
        animalZoneLocation,
        offset: Offset(px, py),
        size: newSize,
      );
    }
  }

  Widget _buildBuildingLocation(BuildingLocation buildingLocation) {
    Offset offset = _mapTransformer.toOffset(buildingLocation.coordinates);
    if (_inView(offset, _buildingMarkerSize, _buildingMarkerSize)) {
      return WidgetMarkerBuilding(
        buildingLocation,
        offset: offset,
        size: buildingLocation.type == BuildingType.huntingStand ? _buildingMarkerSize - 3 : _buildingMarkerSize,
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildAreaLocation(AreaLocation areaLocation) {
    Offset offset = _mapTransformer.toOffset(areaLocation.coordinates);
    if (_inView(offset, _areaMarkerWidth, _areaMarkerHeight)) {
      return WidgetMarkerArea(
        areaLocation,
        offset: offset,
        width: _areaMarkerWidth,
        height: _areaMarkerHeight,
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildMap(Orientation orientation) {
    return MapLayout(
      tileSize: _tileSize.toInt() + 1,
      controller: _mapController,
      builder: (context, transformer) {
        _mapTransformer = transformer;
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onScaleStart: (details) => _onScaleStart(details),
          onScaleUpdate: (details) => _onScaleUpdate(details),
          onScaleEnd: (details) => _onScaleEnd(),
          child: Stack(
            children: [
              _buildTileLayer(),
              ..._listBuildings(),
              ..._listZones(),
              ..._listLocations(),
              ..._listAreas(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBack() {
    return Positioned(
      top: _verticalPadding,
      left: _horizontalPadding,
      child: WidgetButtonIcon(
        Assets.graphics.icons.back,
        color: Interface.primaryLight,
        background: Interface.primaryDark,
        onTap: () => Navigator.pop(context),
      ),
    );
  }

  Widget _buildFilter() {
    return Positioned(
      top: _verticalPadding,
      right: _horizontalPadding,
      child: WidgetButtonIcon(
        Assets.graphics.icons.filter,
        color: Interface.primaryLight,
        background: Interface.primaryDark,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailMap(
                helperMap: widget.helperMap,
                onTap: () => setState(() {}),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildWidgets() {
    Orientation orientation = MediaQuery.of(context).orientation;
    _getScreenSize();
    _getTileSize(orientation);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Interface.primaryDark,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _buildMap(orientation),
                  _buildBack(),
                  _buildFilter(),
                  _buildMarkerInfo(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
