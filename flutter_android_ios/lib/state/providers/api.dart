import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/external/app_info/default.dart';
import 'package:my_app/external/example/stg.dart';
import 'package:my_app/external/example/dev.dart';
import 'package:my_app/external/example/prd.dart';
import 'package:my_app/external/remote_config/dev.dart';
import 'package:my_app/external/remote_config/prd.dart';
import 'package:my_app/external/remote_config/stg.dart';
import 'package:my_app/external/system_locale/default.dart';
import 'package:my_app/logic/features/logger.dart';
import 'package:my_app/logic/interfaces/analytics.dart';
import 'package:my_app/logic/interfaces/app_info.dart';
import 'package:my_app/logic/interfaces/auth.dart';
import 'package:my_app/logic/interfaces/example.dart';
import 'package:my_app/logic/interfaces/firebase_core.dart';
import 'package:my_app/logic/interfaces/firestore.dart';
import 'package:my_app/logic/interfaces/console.dart';
import 'package:my_app/logic/interfaces/remote_config.dart';
import 'package:my_app/logic/interfaces/systems_locale.dart';
import 'package:my_app/logic/types/flavor.dart';
import 'package:my_app/external/console/dev.dart';
import 'package:my_app/external/console/prd.dart';
import 'package:my_app/external/console/stg.dart';
import 'package:my_app/external/analytics/dev.dart';
import 'package:my_app/external/analytics/prd.dart';
import 'package:my_app/external/analytics/stg.dart';
import 'package:my_app/external/auth/dev.dart';
import 'package:my_app/external/auth/prd.dart';
import 'package:my_app/external/auth/stg.dart';
import 'package:my_app/external/firebase_core/prd.dart';
import 'package:my_app/external/firebase_core/stg.dart';
import 'package:my_app/external/firestore/dev.dart';
import 'package:my_app/external/firestore/prd.dart';
import 'package:my_app/external/firestore/stg.dart';
import 'package:my_app/external/firebase_core/dev.dart';
import 'package:my_app/state/providers/flavor.dart';

/// Console
final consoleProvider = Provider<Console>((ref) {
  final flavor = ref.watch(flavorProvider);
  final console = switch (flavor) {
    Flavor.dev => DevConsole(),
    Flavor.stg => StgConsole(),
    Flavor.prd => PrdConsole(),
  };
  // 毎回ref.watchは大変なので コンソールは特別に グローバルにキャッシュする
  logger = console;
  return console;
});

/// Example
final exampleApiProvider = Provider<ExampleApi>((ref) {
  final flavor = ref.watch(flavorProvider);
  return switch (flavor) {
    Flavor.dev => DevExampleApi(),
    Flavor.stg => StgExampleApi(),
    Flavor.prd => PrdExampleApi(),
  };
});

/// Firebase Core
final firebaseCoreProvider = Provider<FirebaseCore>((ref) {
  final flavor = ref.watch(flavorProvider);
  return switch (flavor) {
    Flavor.dev => DevFirebaseCore(),
    Flavor.stg => StgFirebaseCore(),
    Flavor.prd => PrdFirebaseCore(),
  };
});

/// Firebase Analytics
final analyticsProvider = Provider<Analytics>((ref) {
  final flavor = ref.watch(flavorProvider);
  return switch (flavor) {
    Flavor.dev => DevAnalytics(),
    Flavor.stg => StgAnalytics(),
    Flavor.prd => PrdAnalytics(),
  };
});

/// Firebase Auth
final authProvider = Provider<Auth>((ref) {
  final flavor = ref.watch(flavorProvider);
  return switch (flavor) {
    Flavor.dev => DevAuth(),
    Flavor.stg => StgAuth(),
    Flavor.prd => PrdAuth(),
  };
});

/// Firestore
final firestoreProvider = Provider<Firestore>((ref) {
  final flavor = ref.watch(flavorProvider);
  return switch (flavor) {
    Flavor.dev => DevFirestore(),
    Flavor.stg => StgFirestore(),
    Flavor.prd => PrdFirestore(),
  };
});

/// System Locale
final systemLocaleProvider = Provider<SystemLocale>((ref) {
  return DefaultSystemLocale();
});

/// Remote Config
final remoteConfigProvider = Provider<RemoteConfig>((ref) {
  final flavor = ref.watch(flavorProvider);
  return switch (flavor) {
    Flavor.dev => DevRemoteConfig(),
    Flavor.stg => StgRemoteConfig(),
    Flavor.prd => PrdRemoteConfig(),
  };
});

/// アプリ情報
final appInfoProvider = Provider<AppInfo>((ref) {
  return DefaultAppInfo();
});
