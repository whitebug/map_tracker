import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:isar/isar.dart';
import 'package:map_tracker/config/app_config.dart';
import 'package:map_tracker/config/debug_options.dart';
import 'package:map_tracker/config/environment/environment.dart';
import 'package:map_tracker/features/app/di/app_scope.dart';
import 'package:map_tracker/features/common/widgets/di_scope/di_scope.dart';
import 'package:map_tracker/features/navigation/domain/delegate/app_router_delegate.dart';
import 'package:map_tracker/features/navigation/domain/entity/app_coordinate.dart';
import 'package:map_tracker/features/navigation/domain/parser/app_route_information_parses.dart';
import 'package:map_tracker/features/navigation/service/coordinator.dart';

/// App widget.
class App extends StatefulWidget {
  /// Create an instance App.
  const App({required this.isar, Key? key}) : super(key: key);

  /// Database
  final Isar isar;

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late IAppScope _scope;

  @override
  void initState() {
    super.initState();

    _scope = AppScope(
      isar: widget.isar,
      applicationReBuilder: _rebuildApplication,
    );

    _setupRouting(_scope.coordinator);
  }

  @override
  Widget build(BuildContext context) {
    return DiScope<IAppScope>(
      key: ObjectKey(_scope),
      factory: () {
        return _scope;
      },
      child: MaterialApp.router(
        /// Localization.
        locale: _localizations.first,
        localizationsDelegates: _localizationsDelegates,
        supportedLocales: _localizations,

        /// Debug configuration.
        showPerformanceOverlay: _getDebugConfig().showPerformanceOverlay,
        debugShowMaterialGrid: _getDebugConfig().debugShowMaterialGrid,
        checkerboardRasterCacheImages: _getDebugConfig().checkerboardRasterCacheImages,
        checkerboardOffscreenLayers: _getDebugConfig().checkerboardOffscreenLayers,
        showSemanticsDebugger: _getDebugConfig().showSemanticsDebugger,
        debugShowCheckedModeBanner: _getDebugConfig().debugShowCheckedModeBanner,

        /// This is for navigation.
        routeInformationParser: AppRouteInformationParser(),
        routerDelegate: AppRouterDelegate(_scope.coordinator),
      ),
    );
  }

  DebugOptions _getDebugConfig() {
    return Environment<AppConfig>.instance().config.debugOptions;
  }

  /// Declare routes
  void _setupRouting(Coordinator coordinator) {
    coordinator
      ..splashCoordinate = AppCoordinate.splash
      ..mainCoordinate = AppCoordinate.mainScreen
      ..registerCoordinates('/', appCoordinates);
  }

  void _rebuildApplication() {
    setState(() {
      _scope = AppScope(
        isar: widget.isar,
        applicationReBuilder: _rebuildApplication,
      );
      _setupRouting(_scope.coordinator);
    });
  }
}

// You need to customize for your project.
const _localizations = [Locale('ru', 'RU')];

const _localizationsDelegates = [
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];
