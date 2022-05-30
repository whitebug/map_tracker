import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:isar/isar.dart';
import 'package:map_tracker/assets/colors/colors.dart';
import 'package:map_tracker/assets/res/map_marker.dart';
import 'package:map_tracker/features/app/di/app_scope.dart';
import 'package:map_tracker/features/navigation/service/coordinator.dart';
import 'package:map_tracker/features/primary/screens/main_screen/main_screen.dart';
import 'package:map_tracker/features/primary/service/entity/entity.dart';
import 'package:map_tracker/features/primary/service/model/kml_place_mark.dart';
import 'package:map_tracker/features/primary/service/model/kml_style.dart';
import 'package:map_tracker/features/primary/service/model/kml_style_map.dart';
import 'package:map_tracker/features/primary/service/model/main_menu_items.dart';
import 'package:map_tracker/features/primary/service/model/map_features.dart';
import 'package:map_tracker/features/primary/service/model/menu_item.dart';
import 'package:map_tracker/features/primary/service/map_service.dart';
import 'package:map_tracker/features/primary/widgets/dropdown_item.dart';
import 'package:map_tracker/features/primary/widgets/network_map_marker.dart';
import 'package:provider/provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:positioned_tap_detector_2/positioned_tap_detector_2.dart';
import 'main_screen_model.dart';

const String placeBoxName = 'placeBoxName';

/// Factory for [MainScreenWidgetModel].
MainScreenWidgetModel mainScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final coordinator = appDependencies.coordinator;
  final model = MainScreenModel();
  final zipService = MapService();
  final database = appDependencies.database;
  return MainScreenWidgetModel(
    model: model,
    mapService: zipService,
    coordinator: coordinator,
    database: database,
  );
}

/// Widget model for [MainScreen].
class MainScreenWidgetModel extends WidgetModel<MainScreen, MainScreenModel> implements IMainWidgetModel {
  /// Class that coordinates navigation for the whole app.
  final Coordinator coordinator;

  /// Service for reading and unzipping files.
  final MapService mapService;

  /// Database
  final Isar database;

  final StateNotifier<MapFeatures> _features = StateNotifier<MapFeatures>();
  late StreamController _placeMarkStreamController = StreamController();

  final List<DropdownMenuItem<Object>> _mainMenuItems = [
    ...MainMenuItems.firstItems.map(
      (item) => DropdownMenuItem<MapMenuItem>(
        value: item,
        child: DropdownItem(item: item, color: textColorGrey),
      ),
    ),
    const DropdownMenuItem<Divider>(enabled: false, child: Divider()),
    ...MainMenuItems.secondItems.map(
      (item) => DropdownMenuItem<MapMenuItem>(
        value: item,
        child: DropdownItem(item: item, color: textColorGrey),
      ),
    ),
  ];
  late final LayerOptions _mapType;

  @override
  ListenableState<MapFeatures> get features => _features;

  @override
  TapCallback onTap() => _onTap;

  @override
  List<DropdownMenuItem<Object>> get mainMenuItems => _mainMenuItems;

  @override
  void Function(MapMenuItem item) get mainMenuOnChanged => _mainMenuOnChanged;

  final List<Marker> _markers = [];

  /// Create an instance [MainScreenWidgetModel].
  MainScreenWidgetModel({
    required MainScreenModel model,
    required this.mapService,
    required this.coordinator,
    required this.database,
  }) : super(model);

  @override
  Future<void> initWidgetModel() async {
    super.initWidgetModel();
    _mapType = model.googleHybrid;
    _placeMarkStreamController.addStream(database.placeMarkEntitys.watchLazy());
    _placeMarkStreamController.stream.listen((marks) => _addMarkers(entities: marks));
    final List<PlaceMarkEntity> markers = await database.placeMarkEntitys.where().findAll();
    _addMarkers(entities: markers);
    // Init database
    // Set initial options of the map
    _updateFeatures();
  }

  void _addMarkers({required List<PlaceMarkEntity> entities}) {
    for (int i = 0; i < entities.length; i++) {
      final PlaceMarkEntity entity = entities[i];
      _markers.add(
        Marker(
          width: 50.0,
          height: 50.0,
          point: LatLng(entity.latitude, entity.longitude),
          anchorPos: AnchorPos.align(AnchorAlign.top),
          builder: (ctx) => NetworkMapMarker(imageUrl: entity.icon.value?.markerImageUrl ?? ''),
        ),
      );
    }
    _updateFeatures();
  }

  void _onTap(TapPosition tapPosition, LatLng latLng) {
    _markers.add(
      Marker(
        width: 50.0,
        height: 50.0,
        point: latLng,
        anchorPos: AnchorPos.align(AnchorAlign.top),
        builder: (ctx) => const MapMarker(),
      ),
    );
    _updateFeatures();
  }

  void _updateFeatures() {
    _features.accept(
      MapFeatures(
        center: LatLng(51.81984627788358, 107.66203218419004),
        zoom: 15.0,
        mapType: _mapType,
        markers: _markers,
      ),
    );
  }

  _mainMenuOnChanged(MapMenuItem item) async {
    switch (item) {
      case MainMenuItems.kmz:
        String? kml = await mapService.getKml();
        if (kml != null) {
          List<KmlStyle> styles = KmlStyle.fromKmlToList(kml);
          List<KmlStyleMap> styleMaps = KmlStyleMap.fromKmlToList(kml);
          List<KmlPlaceMark> kmlPlaceMarks = KmlPlaceMark.fromKmlToList(kml);
          Map<String, List<KmlPlaceMark>> sortedPlaceMarks = mapService.sortPlaceMarks(kmlPlaceMarks: kmlPlaceMarks);
          List<String> styleUrls = sortedPlaceMarks.keys.toList(growable: false);
          List<PlaceMarkEntity> _placeMarkList = [];
          List<PlaceMarkIconEntity> _placeMarkIconList = [];
          for (int i = 0; i < styleUrls.length; i++) {
            final markerImageUrl = mapService.getMarkerUrl(
              styleUrl: styleUrls[i],
              styles: styles,
              styleMaps: styleMaps,
              kmlPlaceMarks: kmlPlaceMarks,
            );
            _placeMarkIconList.add(PlaceMarkIconEntity()..markerImageUrl = markerImageUrl);
            final List<KmlPlaceMark> list = sortedPlaceMarks[styleUrls[i]] ?? [];
            if (list.isNotEmpty) {
              for (int i = 0; i < list.length; i++) {
                final KmlPlaceMark currentKml = list[i];
                final coordinates = currentKml.point.coordinates;
                if (coordinates != null) {
                  //LatLng latLng = LatLng(coordinates[1], coordinates[0]);

                  final PlaceMarkIconEntity icon = PlaceMarkIconEntity()..markerImageUrl = markerImageUrl;
                  final placeMark = PlaceMarkEntity()
                    ..name = currentKml.name
                    ..description = currentKml.description
                    ..styleUrl = currentKml.styleUrl
                    ..latitude = coordinates[1]
                    ..longitude = coordinates[0]
                    ..icon.value = icon;
                  _placeMarkList.add(placeMark);
                  /*_markers.add(
                    Marker(
                      width: 50.0,
                      height: 50.0,
                      point: latLng,
                      anchorPos: AnchorPos.align(AnchorAlign.top),
                      builder: (ctx) => NetworkMapMarker(imageUrl: markerImageUrl),
                    ),
                  );*/
                }
              }
              //_updateFeatures();
            }
          }
          database.writeTxn((isar) async {
            await isar.placeMarkEntitys.putAll(_placeMarkList);
            await isar.placeMarkIconEntitys.putAll(_placeMarkIconList);
          });
        }
        break;
      case MainMenuItems.share:
        // TODO: Handle this case.
        break;
      case MainMenuItems.settings:
        break;
      case MainMenuItems.logout:
        break;
    }
  }
}

/// Interface of [MainScreenWidgetModel].
abstract class IMainWidgetModel extends IWidgetModel {
  /// Initial features of a map
  ListenableState<MapFeatures> get features;

  /// Main menu items
  List<DropdownMenuItem<Object>> get mainMenuItems;

  /// Get [TapPosition] and [LatLng] of a point on a map to make a marker
  TapCallback onTap();

  /// Main menu button actions
  void Function(MapMenuItem item) get mainMenuOnChanged;
}
