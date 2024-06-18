import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:feature_flavor/feature_flavor.dart';
import 'interface.dart';
import 'impl_dev.dart';
import 'impl_stg.dart';
import 'impl_prd.dart';

/// Remote Config
final remoteConfigProvider = Provider<RemoteConfig>((ref) {
  final flavor = ref.watch(flavorProvider);
  return switch (flavor) {
    Flavor.dev => DevRemoteConfig(),
    Flavor.stg => StgRemoteConfig(),
    Flavor.prd => PrdRemoteConfig(),
  };
});
