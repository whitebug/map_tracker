import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:map_tracker/features/app/di/app_scope.dart';
import 'package:map_tracker/features/navigation/service/coordinator.dart';
import 'package:map_tracker/features/primary/screens/splash_screen/splash_screen.dart';
import 'package:map_tracker/features/primary/screens/splash_screen/splash_screen_model.dart';
import 'package:map_tracker/features/primary/service/splash_ticker_service.dart';
import 'package:provider/provider.dart';

/// Duration of splash screen in seconds
const int splashDuration = 3;

/// Factory for [SplashScreenWidgetModel].
SplashScreenWidgetModel initScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final coordinator = appDependencies.coordinator;
  final model = SplashScreenModel();
  final tickerService = SplashTickerService();
  return SplashScreenWidgetModel(
    model: model,
    coordinator: coordinator,
    tickerService: tickerService,
  );
}

/// Widget model for [SplashScreen].
class SplashScreenWidgetModel extends WidgetModel<SplashScreen, SplashScreenModel> implements ISplashWidgetModel {
  /// Class that coordinates navigation for the whole app.
  final Coordinator coordinator;

  /// Ticks provider for timer
  final SplashTickerService tickerService;

  late final StateNotifier<int> _ticker = StateNotifier<int>();

  @override
  ListenableState<int> get ticker => _ticker;

  /// Create an instance [SplashScreenWidgetModel].
  SplashScreenWidgetModel({
    required SplashScreenModel model,
    required this.coordinator,
    required this.tickerService,
  }) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    // Duration of splash screen
    Timer(
      const Duration(seconds: splashDuration),
      () => coordinator.navigate(context, coordinator.mainCoordinate!, replaceRootCoordinate: true),
    );
    // Change timer value
    tickerService.tick(splashDuration: splashDuration).listen(_ticker.accept);
  }
}

/// Interface of [SplashScreenWidgetModel].
abstract class ISplashWidgetModel extends IWidgetModel {
  /// Ticker for splash screen
  ListenableState<int> get ticker;
}
