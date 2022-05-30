import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:map_tracker/features/app/app.dart';
import 'package:map_tracker/util/crashlytics_strategy.dart';
import 'package:path_provider/path_provider.dart';
import 'package:surf_logger/surf_logger.dart';

import 'features/primary/service/entity/entity.dart';

/// App launch.
Future<void> run() async {
  /// It must be called so that the orientation does not fall.
  WidgetsFlutterBinding.ensureInitialized();
  /// Fix orientation.
  // TODO(init-project): change as needed or remove.
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  /// Init database
  final isar = await Isar.open(
    schemas: [PlaceMarkEntitySchema],
    directory: (await getApplicationDocumentsDirectory()).path,
  );
  _initLogger();
  _runApp(isar: isar);
}

void _runApp({required Isar isar}) {
  runZonedGuarded<Future<void>>(
    () async {
      runApp(App(isar: isar));
    },
    (exception, stack) {
      // TODO(init-project): Инициализировать Crashlytics.
      // FirebaseCrashlytics.instance.recordError(exception, stack);
    },
  );
}

void _initLogger() {
  RemoteLogger.addStrategy(CrashlyticsRemoteLogStrategy());
  Logger.addStrategy(DebugLogStrategy());
  Logger.addStrategy(RemoteLogStrategy());
}
