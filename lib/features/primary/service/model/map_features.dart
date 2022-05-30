import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

/// Required options for the map
class MapFeatures {
  final LatLng center;
  final double zoom;
  final LayerOptions mapType;
  final List<Marker> markers;

  MapFeatures({
    required this.center,
    required this.zoom,
    required this.mapType,
    required this.markers,
  });
}
