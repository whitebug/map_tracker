import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Custom marker
class MapMarker extends StatelessWidget {
  const MapMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
        'assets/icons/tower.svg',
        semanticsLabel: 'marker'
    );
  }
}
