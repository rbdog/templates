import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ports/app_flavor.dart';
import 'ports/app_info.dart';
import 'ports/app_store.dart';
import 'ports/console.dart';
import 'ports/example_service.dart';
import 'ports/firebase_analytics.dart';
import 'ports/firebase_auth.dart';
import 'ports/firebase_core.dart';
import 'ports/firebase_firestore.dart';
import 'ports/firebase_remote_config.dart';
import 'ports/notification_api.dart';
import 'ports/system_locale.dart';
import 'ports/user_api.dart';
import 'adapters/app_flavor/index.dart' as app_flavor;
import 'adapters/app_info/index.dart' as app_info;
import 'adapters/app_store/index.dart' as app_store;
import 'adapters/console/index.dart' as console;
import 'adapters/example_service/index.dart' as example_service;
import 'adapters/firebase_analytics/index.dart' as firebase_analytics;
import 'adapters/firebase_auth/index.dart' as firebase_auth;
import 'adapters/firebase_core/index.dart' as firebase_core;
import 'adapters/firebase_firestore/index.dart' as firebase_firestore;
import 'adapters/firebase_remote_config/index.dart' as firebase_remote_config;
import 'adapters/notification_api/index.dart' as notification_api;
import 'adapters/system_locale/index.dart' as system_locale;
import 'adapters/user_api/index.dart' as user_api;
import 'domain/debug/index.dart';
import 'usecases/debug/provider.dart';

/// 起動中のフレーバー
final AppFlavor _appFlavor = app_flavor.ImplDefault();
final flavor = _appFlavor.getFlavor();

/// Example
final exampleServiceProvider = Provider<ExampleService>((ref) {
  return switch (flavor) {
    Flavor.dev => example_service.ImplDev(),
    Flavor.stg => example_service.ImplStg(),
    Flavor.prd => example_service.ImplPrd(),
  };
});

/// アプリ情報
final appInfoProvider = Provider<AppInfo>((ref) {
  final logger = ref.watch(loggerProvider(Layer.adapters));

  return app_info.ImplDefault(logger: logger);
});

/// アプリストア
final appStoreProvider = Provider<AppStore>((ref) {
  return app_store.ImplDefault();
});

/// コンソール
final consoleProvider = Provider.autoDispose<Console>((ref) {
  const debugConsole = console.ImplDefault();
  const releaseConsole = console.ImplDisabled();
  return kReleaseMode ? debugConsole : releaseConsole;
});

/// Firebase Analytics
final firebaseAnalyticsProvider = Provider<FirebaseAnalytics>((ref) {
  final logger = ref.watch(loggerProvider(Layer.adapters));

  return switch (flavor) {
    Flavor.dev => firebase_analytics.ImplDev(logger: logger),
    Flavor.stg => firebase_analytics.ImplStg(),
    Flavor.prd => firebase_analytics.ImplPrd(),
  };
});

/// Firebase Auth
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return switch (flavor) {
    Flavor.dev => firebase_auth.ImplDev(),
    Flavor.stg => firebase_auth.ImplStg(),
    Flavor.prd => firebase_auth.ImplPrd(),
  };
});

/// Firebase Core
final firebaseCoreProvider = Provider<FirebaseCore>((ref) {
  final logger = ref.watch(loggerProvider(Layer.adapters));

  return switch (flavor) {
    Flavor.dev => firebase_core.ImplDev(logger: logger),
    Flavor.stg => firebase_core.ImplStg(),
    Flavor.prd => firebase_core.ImplPrd(),
  };
});

/// Firebase Firestore
final firebaseFirestoreProvider = Provider<FirebaseFirestore>((ref) {
  final logger = ref.watch(loggerProvider(Layer.adapters));

  return switch (flavor) {
    Flavor.dev => firebase_firestore.ImplDev(logger: logger),
    Flavor.stg => firebase_firestore.ImplStg(),
    Flavor.prd => firebase_firestore.ImplPrd(),
  };
});

/// Firebase Remote Config
final firebaseRemoteConfigProvider = Provider<FirebaseRemoteConfig>((ref) {
  final logger = ref.watch(loggerProvider(Layer.adapters));

  return switch (flavor) {
    Flavor.dev => firebase_remote_config.ImplDev(logger: logger),
    Flavor.stg => firebase_remote_config.ImplStg(),
    Flavor.prd => firebase_remote_config.ImplPrd(),
  };
});

/// 通知用のAPI
final notificationApiProvider = Provider<NotificationApi>((ref) {
  return switch (flavor) {
    Flavor.dev => notification_api.ImplDev(),
    Flavor.stg => notification_api.ImplStg(),
    Flavor.prd => notification_api.ImplPrd(),
  };
});

/// System Locale
final systemLocaleProvider = Provider<SystemLocale>((ref) {
  final logger = ref.watch(loggerProvider(Layer.adapters));

  return system_locale.ImplDefault(logger: logger);
});

/// ユーザー API
final userApiProvider = Provider<UserApi>((ref) {
  return switch (flavor) {
    Flavor.dev => user_api.ImplDev(),
    Flavor.stg => user_api.ImplStg(),
    Flavor.prd => user_api.ImplPrd(),
  };
});
