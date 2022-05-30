import 'package:elementary/elementary.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:map_tracker/features/primary/screens/main_screen/main_screen.dart';

/// Model fol [MainScreen].
class MainScreenModel extends ElementaryModel {
  final LayerOptions openstreetmap = TileLayerOptions(
    urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
    subdomains: ['a', 'b', 'c'],
  );
  final LayerOptions esri = TileLayerOptions(
    urlTemplate:
    'https://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}',
  );
  final LayerOptions esriTopography = TileLayerOptions(
    urlTemplate:
    'https://server.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}',
  );
  final LayerOptions wms = TileLayerOptions(
    wmsOptions: WMSTileLayerOptions(
      baseUrl: 'https://{s}.s2maps-tiles.eu/wms/?',
      layers: ['s2cloudless-2018_3857'],
    ),
    subdomains: ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'],
  );
  final LayerOptions azure = TileLayerOptions(
    urlTemplate: "https://atlas.microsoft.com/map/tile/png?api-version=1&layer=basic&style=main&tileSize=256&view=Auto&zoom={z}&x={x}&y={y}&subscription-key={subscriptionKey}",
    additionalOptions: {
      'subscriptionKey': '<YOUR_AZURE_MAPS_SUBSCRIPTON_KEY>'
    },
  );
  final LayerOptions googleTraffic = TileLayerOptions(
    urlTemplate: 'https://{s}.google.com/vt/lyrs=m@221097413,traffic&x={x}&y={y}&z={z}',
    subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
  );
  final LayerOptions googleStreets = TileLayerOptions(
    urlTemplate: 'http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
    subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
  );
  final LayerOptions googleHybrid = TileLayerOptions(
    urlTemplate: 'http://{s}.google.com/vt/lyrs=s,h&x={x}&y={y}&z={z}',
    subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
  );
  final LayerOptions googleSatellite = TileLayerOptions(
    urlTemplate: 'http://{s}.google.com/vt/lyrs=s&x={x}&y={y}&z={z}',
    subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
  );
  final LayerOptions googleTerrain = TileLayerOptions(
    urlTemplate: 'http://{s}.google.com/vt/lyrs=p&x={x}&y={y}&z={z}',
    subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
  );
  final LayerOptions arcGisOnline = TileLayerOptions(
    urlTemplate: 'http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
  );
  final LayerOptions doubleGis = TileLayerOptions(
    urlTemplate: 'http://tile2.maps.2gis.com/tiles?x={x}&y={y}&z={z}',
  );

}
