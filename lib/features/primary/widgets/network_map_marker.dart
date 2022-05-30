import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Custom marker from url
class NetworkMapMarker extends StatelessWidget {
  /// Url for marker
  final String imageUrl;

  /// Get [MapMarker] instance
  const NetworkMapMarker({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
