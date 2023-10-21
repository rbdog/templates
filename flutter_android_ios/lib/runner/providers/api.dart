import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/api/app_info/default.dart';
import 'package:my_app/api/example/stg.dart';
import 'package:my_app/api/example/dev.dart';
import 'package:my_app/api/example/prd.dart';
import 'package:my_app/api/remote_config/dev.dart';
import 'package:my_app/api/remote_config/prd.dart';
import 'package:my_app/api/remote_config/stg.dart';
import 'package:my_app/api/system_locale/default.dart';
import 'package:my_app/core/features/logger.dart';
import 'package:my_app/core/interfaces/analytics.dart';
import 'package:my_app/core/interfaces/app_info.dart';
import 'package:my_app/core/interfaces/auth.dart';
import 'package:my_app/core/interfaces/example.dart';
import 'package:my_app/core/interfaces/firebase_core.dart';
import 'package:my_app/core/interfaces/firestore.dart';
import 'package:my_app/core/interfaces/console.dart';
import 'package:my_app/core/interfaces/remote_config.dart';
import 'package:my_app/core/interfaces/systems_locale.dart';
import 'package:my_app/core/types/flavor.dart';
import 'package:my_app/api/console/dev.dart';
import 'package:my_app/api/console/prd.dart';
import 'package:my_app/api/console/stg.dart';
import 'package:my_app/api/analytics/dev.dart';
import 'package:my_app/api/analytics/prd.dart';
import 'package:my_app/api/analytics/stg.dart';
import 'package:my_app/api/auth/dev.dart';
import 'package:my_app/api/auth/prd.dart';
import 'package:my_app/api/auth/stg.dart';
import 'package:my_app/api/firebase_core/prd.dart';
import 'package:my_app/api/firebase_core/stg.dart';
import 'package:my_app/api/firestore/dev.dart';
import 'package:my_app/api/firestore/prd.dart';
import 'package:my_app/api/firestore/stg.dart';
import 'package:my_app/api/firebase_core/dev.dart';
import 'package:my_app/runner/providers/flavor.dart';

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
