import 'package:flutter/widgets.dart';

/// Factory for building coordinates.
typedef CoordinateBuilder = Widget Function(BuildContext context, Object? data);

/// Basic coordinate representation.
abstract class Coordinate {
  /// Path name
  final String value;

  /// If path is unique
  final bool isUnique;

  /// Create an instance [Coordinate].
  const Coordinate({
    required this.value,
    required this.isUnique,
  });

  @override
  String toString() => value;
}
