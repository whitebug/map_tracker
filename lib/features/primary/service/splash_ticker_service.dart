/// Provides timer for splash screen
class SplashTickerService {
  /// Ticks every second from [splashDuration] to 0
  Stream<int> tick({required int splashDuration}) {
    return Stream<int>.periodic(const Duration(seconds: 1), (x) {
      return splashDuration - x - 1;
    }).take(splashDuration);
  }
}