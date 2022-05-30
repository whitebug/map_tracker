import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_tracker/features/primary/service/entity/entity.dart';

/// Required options for the map
class MapFeatures {
  final LatLng center;
  final double zoom;
  final LayerOptions mapType;
  final List<Marker> markers;
  final PlaceMarkEntity placeMark;

  MapFeatures({
    required this.center,
    required this.zoom,
    required this.mapType,
    required this.markers,
    required this.placeMark,
  });
}
