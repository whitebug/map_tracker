import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:map_tracker/assets/colors/colors.dart';
import 'package:map_tracker/assets/themes/text_style.dart';
import 'package:map_tracker/features/common/widgets/loading_widget.dart';
import 'package:map_tracker/features/primary/screens/splash_screen/splash_screen_widget_model.dart';

const double _loadingWidgetSize = 60.0;

/// Initialization screens (this can be a HomeScreen or SplashScreen for example).
class SplashScreen extends ElementaryWidget<ISplashWidgetModel> {
  /// Create an instance [SplashScreen].
  const SplashScreen({
    Key? key,
    WidgetModelFactory wmFactory = initScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ISplashWidgetModel wm) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StateNotifierBuilder<int>(
              listenableState: wm.ticker,
              builder: (context, seconds) {
                if (seconds != null) {
                  return LoadingWidget(
                    width: _loadingWidgetSize,
                    height: _loadingWidgetSize,
                    child: Text(
                      '$seconds',
                      style: textMedium40.copyWith(color: textColorPrimary),
                    ),
                  );
                } else {
                  return const LoadingWidget(
                    width: _loadingWidgetSize,
                    height: _loadingWidgetSize,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
