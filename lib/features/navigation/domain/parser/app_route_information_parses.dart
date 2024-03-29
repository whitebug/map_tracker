import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:map_tracker/features/navigation/domain/entity/app_coordinate.dart';
import 'package:map_tracker/features/navigation/domain/entity/coordinate.dart';

/// [RouteInformationParser] implementation.
/// Passed in the routeInformationParser field in [MaterialApp.router].
class AppRouteInformationParser extends RouteInformationParser<Coordinate> {
  @override
  Future<Coordinate> parseRouteInformation(RouteInformation routeInformation) =>
      SynchronousFuture(AppCoordinate.splashScreen);
}
