import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../adapter/app_flavor/index.dart' as app_flavor;
import '../../adapter/app_info/index.dart' as app_info;
import '../../adapter/app_store/index.dart' as app_store;
import '../../adapter/console/index.dart' as console;
import '../../adapter/example_service/index.dart' as example_service;
import '../../adapter/firebase_analytics/index.dart' as firebase_analytics;
import '../../adapter/firebase_auth/index.dart' as firebase_auth;
import '../../adapter/firebase_core/index.dart' as firebase_core;
import '../../adapter/firebase_firestore/index.dart' as firebase_firestore;
import '../../adapter/firebase_remote_config/index.dart'
    as firebase_remote_config;
import '../../adapter/notification_api/index.dart' as notification_api;
import '../../adapter/system_locale/index.dart' as system_locale;
import '../../adapter/user_api/index.dart' as user_api;
import '../../logic/debug/index.dart';
import '../debug/provider.dart';

/// Example
final exampleServiceProvider = Provider<example_service.ExampleService>((ref) {
  return switch (app_flavor.flavor) {
    Flavor.dev => example_service.ImplDev(),
    Flavor.stg => example_service.ImplStg(),
    Flavor.prd => example_service.ImplPrd(),
  };
});

/// アプリ情報
final appInfoProvider = Provider<app_info.AppInfo>((ref) {
  final logger = ref.watch(loggerProvider(Layer.adapter));

  return app_info.ImplDefault(logger: logger);
});

/// アプリストア
final appStoreProvider = Provider<app_store.AppStore>((ref) {
  return app_store.ImplDefault();
});

/// コンソール
final consoleProvider = Provider.autoDispose<console.Console>((ref) {
  const debugConsole = console.ImplDefault();
  const releaseConsole = console.ImplDisabled();
  return kReleaseMode ? debugConsole : releaseConsole;
});

/// Firebase Analytics
final firebaseAnalyticsProvider =
    Provider<firebase_analytics.FirebaseAnalytics>((ref) {
      final logger = ref.watch(loggerProvider(Layer.adapter));

      return switch (app_flavor.flavor) {
        Flavor.dev => firebase_analytics.ImplDev(logger: logger),
        Flavor.stg => firebase_analytics.ImplStg(),
        Flavor.prd => firebase_analytics.ImplPrd(),
      };
    });

/// Firebase Auth
final firebaseAuthProvider = Provider<firebase_auth.FirebaseAuth>((ref) {
  return switch (app_flavor.flavor) {
    Flavor.dev => firebase_auth.ImplDev(),
    Flavor.stg => firebase_auth.ImplStg(),
    Flavor.prd => firebase_auth.ImplPrd(),
  };
});

/// Firebase Core
final firebaseCoreProvider = Provider<firebase_core.FirebaseCore>((ref) {
  final logger = ref.watch(loggerProvider(Layer.adapter));

  return switch (app_flavor.flavor) {
    Flavor.dev => firebase_core.ImplDev(logger: logger),
    Flavor.stg => firebase_core.ImplStg(),
    Flavor.prd => firebase_core.ImplPrd(),
  };
});

/// Firebase Firestore
final firebaseFirestoreProvider =
    Provider<firebase_firestore.FirebaseFirestore>((ref) {
      final logger = ref.watch(loggerProvider(Layer.adapter));

      return switch (app_flavor.flavor) {
        Flavor.dev => firebase_firestore.ImplDev(logger: logger),
        Flavor.stg => firebase_firestore.ImplStg(),
        Flavor.prd => firebase_firestore.ImplPrd(),
      };
    });

/// Firebase Remote Config
final firebaseRemoteConfigProvider =
    Provider<firebase_remote_config.FirebaseRemoteConfig>((ref) {
      final logger = ref.watch(loggerProvider(Layer.adapter));

      return switch (app_flavor.flavor) {
        Flavor.dev => firebase_remote_config.ImplDev(logger: logger),
        Flavor.stg => firebase_remote_config.ImplStg(),
        Flavor.prd => firebase_remote_config.ImplPrd(),
      };
    });

/// 通知用のAPI
final notificationApiProvider = Provider<notification_api.NotificationApi>((
  ref,
) {
  return switch (app_flavor.flavor) {
    Flavor.dev => notification_api.ImplDev(),
    Flavor.stg => notification_api.ImplStg(),
    Flavor.prd => notification_api.ImplPrd(),
  };
});

/// System Locale
final systemLocaleProvider = Provider<system_locale.SystemLocale>((ref) {
  final logger = ref.watch(loggerProvider(Layer.adapter));

  return system_locale.ImplDefault(logger: logger);
});

/// ユーザー API
final userApiProvider = Provider<user_api.UserApi>((ref) {
  return switch (app_flavor.flavor) {
    Flavor.dev => user_api.ImplDev(),
    Flavor.stg => user_api.ImplStg(),
    Flavor.prd => user_api.ImplPrd(),
  };
});
