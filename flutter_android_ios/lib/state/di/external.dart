import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/external/implements/console/default.dart';
import 'package:my_app/external/interfaces/analytics.dart';
import 'package:my_app/external/interfaces/app_info.dart';
import 'package:my_app/external/interfaces/auth.dart';
import 'package:my_app/external/interfaces/example.dart';
import 'package:my_app/external/interfaces/firebase_core.dart';
import 'package:my_app/external/interfaces/firestore.dart';
import 'package:my_app/external/interfaces/console.dart';
import 'package:my_app/external/interfaces/remote_config.dart';
import 'package:my_app/external/interfaces/systems_locale.dart';
import 'package:my_app/external/implements/app_info/default.dart';
import 'package:my_app/external/implements/example/stg.dart';
import 'package:my_app/external/implements/example/dev.dart';
import 'package:my_app/external/implements/example/prd.dart';
import 'package:my_app/external/implements/remote_config/dev.dart';
import 'package:my_app/external/implements/remote_config/prd.dart';
import 'package:my_app/external/implements/remote_config/stg.dart';
import 'package:my_app/external/implements/system_locale/default.dart';
import 'package:my_app/external/implements/analytics/dev.dart';
import 'package:my_app/external/implements/analytics/prd.dart';
import 'package:my_app/external/implements/analytics/stg.dart';
import 'package:my_app/external/implements/auth/dev.dart';
import 'package:my_app/external/implements/auth/prd.dart';
import 'package:my_app/external/implements/auth/stg.dart';
import 'package:my_app/external/implements/firebase_core/prd.dart';
import 'package:my_app/external/implements/firebase_core/stg.dart';
import 'package:my_app/external/implements/firestore/dev.dart';
import 'package:my_app/external/implements/firestore/prd.dart';
import 'package:my_app/external/implements/firestore/stg.dart';
import 'package:my_app/external/implements/firebase_core/dev.dart';
import 'package:my_app/logic/types/flavor.dart';
import 'package:my_app/state/providers/flavor.dart';

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
