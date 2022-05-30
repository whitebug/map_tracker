import 'package:map_tracker/features/debug/screens/debug_screen/debug_screen.dart';
import 'package:map_tracker/features/navigation/domain/entity/coordinate.dart';
import 'package:map_tracker/features/primary/screens/main_screen/main_screen.dart';
import 'package:map_tracker/features/primary/screens/splash_screen/splash_screen.dart';

/// A set of routes for the entire app.
class AppCoordinate extends Coordinate {
  /// Initialization screens([SplashScreen]).
  static const splashScreen = AppCoordinate._('splash', true);

  /// Main application screens([MainScreen]).
  static const mainScreen = AppCoordinate._('main', true);

  /// Debug screens([DebugScreen]).
  static const debugScreen = AppCoordinate._('debug_screen', true);

  /// Initialization screens.
  static const splash = splashScreen;

  const AppCoordinate._(
    String value,
    bool isUnique,
  ) : super(
          value: value,
          isUnique: isUnique,
        );
}

/// List of main routes of the app.
final Map<AppCoordinate, CoordinateBuilder> appCoordinates = {
  AppCoordinate.splash: (_, __) => const SplashScreen(),
  AppCoordinate.mainScreen: (_, __) => const MainScreen(),
  AppCoordinate.debugScreen: (_, __) => const DebugScreen(),
};
