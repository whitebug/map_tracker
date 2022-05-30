import 'package:map_tracker/features/navigation/domain/entity/coordinate.dart';

/// Route for the coordinate
/// [path] - generated from the prefix and the name of the coordinate
/// when registering the coordinate
class CoordinateRoute {
  /// The path itself
  final String path;

  /// Builder for destination widget
  final CoordinateBuilder builder;

  /// It seems that it shows if the route is unique
  final bool isUnique;

  /// Create an instance [CoordinateRoute].
  const CoordinateRoute({
    required this.path,
    required this.builder,
    required this.isUnique,
  });

  @override
  String toString() {
    return path;
  }
}
