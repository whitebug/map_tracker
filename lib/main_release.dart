import 'package:map_tracker/config/app_config.dart';
import 'package:map_tracker/config/debug_options.dart';
import 'package:map_tracker/config/environment/build_types.dart';
import 'package:map_tracker/config/environment/environment.dart';
import 'package:map_tracker/config/urls.dart';
import 'package:map_tracker/runner.dart';

/// Main entry point of app.
void main() {
  Environment.init(
    buildType: BuildType.release,
    config: AppConfig(
      url: Url.prodUrl,
      proxyUrl: Url.prodProxyUrl,
      debugOptions: DebugOptions(),
    ),
  );

  run();
}
