import 'package:flutter/material.dart';

/// Key for the screen
/// Stores coordinate parameters
class CoordinateKey extends LocalKey {
  /// Coordinate parameters
  final Object? arguments;

  /// Coordinate path
  final String? path;

  /// Create an instance [CoordinateKey].
  const CoordinateKey({
    required this.arguments,
    required this.path,
  });
}
