import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:isar/isar.dart';
import 'package:map_tracker/assets/colors/colors.dart';
import 'package:map_tracker/features/app/di/app_scope.dart';
import 'package:map_tracker/features/navigation/service/coordinator.dart';
import 'package:map_tracker/features/primary/screens/main_screen/main_screen.dart';
import 'package:map_tracker/features/primary/service/service.dart';
import 'package:map_tracker/features/primary/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
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
  final panelController = PanelController();
  return MainScreenWidgetModel(
    model: model,
    mapService: zipService,
    coordinator: coordinator,
    database: database,
    panelController: panelController,
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

  PlaceMarkEntity _description = PlaceMarkEntity()
    ..name = ''
    ..description = ''
    ..styleUrl = ''
    ..longitude = 0
    ..latitude = 0
    ..icon = '';

  @override
  ListenableState<MapFeatures> get features => _features;

  @override
  List<DropdownMenuItem<Object>> get mainMenuItems => _mainMenuItems;

  @override
  void Function(MapMenuItem item) get mainMenuOnChanged => _mainMenuOnChanged;

  @override
  final PanelController panelController;

  final List<Marker> _markers = [];

  /// Create an instance [MainScreenWidgetModel].
  MainScreenWidgetModel(
      {required MainScreenModel model,
      required this.mapService,
      required this.coordinator,
      required this.database,
      required this.panelController,
      required})
      : super(model);

  @override
  Future<void> initWidgetModel() async {
    super.initWidgetModel();
    _mapType = model.googleHybrid;
    await _addMarkers();
  }

  Future<void> _addMarkers() async {
    final List<PlaceMarkEntity> entities = await database.placeMarkEntitys.where().findAll();
    for (int i = 0; i < entities.length; i++) {
      final PlaceMarkEntity entity = entities[i];
      _markers.add(
        Marker(
          width: 50.0,
          height: 50.0,
          point: LatLng(entity.latitude, entity.longitude),
          anchorPos: AnchorPos.align(AnchorAlign.top),
          builder: (ctx) => GestureDetector(
            onTap: () {
              _description = entity;
              _updateFeatures();
              panelController.animatePanelToPosition(
                snapPoint,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            },
            child: NetworkMapMarker(imageUrl: entity.icon),
          ),
        ),
      );
    }
    _updateFeatures();
  }

  void _updateFeatures() {
    _features.accept(
      MapFeatures(
        center: LatLng(51.81984627788358, 107.66203218419004),
        zoom: 15.0,
        mapType: _mapType,
        markers: _markers,
        placeMark: _description,
      ),
    );
  }

  _mainMenuOnChanged(MapMenuItem item) async {
    switch (item) {
      case MainMenuItems.kmz:
        await mapService.readKmzToDataBase(database: database);
        await _addMarkers();
        break;
      case MainMenuItems.delete:
        await mapService.deleteMarkersFromDatabase(database: database);
        _markers.clear();
        _updateFeatures();
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

  /// Main menu button actions
  void Function(MapMenuItem item) get mainMenuOnChanged;

  /// Sliding up panel
  PanelController get panelController;
}
