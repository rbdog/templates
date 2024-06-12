// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../external/implements/analytics/dev.dart';
import '../../external/implements/analytics/prd.dart';
import '../../external/implements/analytics/stg.dart';
import '../../external/implements/app_info/default.dart';
import '../../external/implements/auth/dev.dart';
import '../../external/implements/auth/prd.dart';
import '../../external/implements/auth/stg.dart';
import '../../external/implements/console/default.dart';
import '../../external/implements/example/dev.dart';
import '../../external/implements/example/prd.dart';
import '../../external/implements/example/stg.dart';
import '../../external/implements/firebase_core/dev.dart';
import '../../external/implements/firebase_core/prd.dart';
import '../../external/implements/firebase_core/stg.dart';
import '../../external/implements/firestore/dev.dart';
import '../../external/implements/firestore/prd.dart';
import '../../external/implements/firestore/stg.dart';
import '../../external/implements/remote_config/dev.dart';
import '../../external/implements/remote_config/prd.dart';
import '../../external/implements/remote_config/stg.dart';
import '../../external/implements/system_locale/default.dart';
import '../../external/interfaces/analytics.dart';
import '../../external/interfaces/app_info.dart';
import '../../external/interfaces/auth.dart';
import '../../external/interfaces/console.dart';
import '../../external/interfaces/example.dart';
import '../../external/interfaces/firebase_core.dart';
import '../../external/interfaces/firestore.dart';
import '../../external/interfaces/remote_config.dart';
import '../../external/interfaces/systems_locale.dart';
import '../../logic/types/flavor.dart';
import '../providers/flavor.dart';

/// Example
final exampleServiceProvider = Provider<ExampleService>((ref) {
  final flavor = ref.watch(flavorProvider);
  return switch (flavor) {
    Flavor.dev => DevExampleService(),
    Flavor.stg => StgExampleService(),
    Flavor.prd => PrdExampleService(),
  };
});

/// Console
final consoleProvider = Provider<Console>((ref) {
  return const DefaultConsole();
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
