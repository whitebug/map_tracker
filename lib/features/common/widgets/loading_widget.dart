import 'package:flutter/material.dart';
import 'package:map_tracker/assets/res/round_progress_indicator.dart';

/// Rotating circular loading widget
class LoadingWidget extends StatefulWidget {
  /// Width of widget
  final double width;

  /// Height of widget
  final double height;

  /// Widget that would be placed at the center of [LoadingWidget]. Child is optional.
  final Widget? child;

  /// Instance of [LoadingWidget]
  const LoadingWidget({
    required this.height,
    required this.width,
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RotationTransition(
          turns: _controller,
          child: Center(
            child: RoundProgressIndicator(
              width: widget.width,
              height: widget.height,
            ),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: widget.child != null ? widget.child! : const SizedBox(),
          ),
        ),
      ],
    );
  }
}
