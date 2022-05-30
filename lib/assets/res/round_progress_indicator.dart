import 'package:flutter/material.dart';

/// [Image.asset] with round image
class RoundProgressIndicator extends StatelessWidget {
  /// Height of image
  final double height;

  /// Width of image
  final double width;

  /// Instance of [ProgressIndicator]
  const RoundProgressIndicator({
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/progress_indicator.png',
      height: height,
      width: width,
    );
  }
}
