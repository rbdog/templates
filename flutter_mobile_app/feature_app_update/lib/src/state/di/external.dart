import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:feature_flavor/feature_flavor.dart';
import '../../external/implements/app_info/default.dart';
import '../../external/interfaces/remote_config.dart';
import '../../external/interfaces/app_info.dart';
import '../../external/implements/remote_config/dev.dart';
import '../../external/implements/remote_config/stg.dart';
import '../../external/implements/remote_config/prd.dart';

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
