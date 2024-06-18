import 'package:feature_flavor/feature_flavor.dart';
import 'package:riverpod/riverpod.dart';

import 'impl_dev.dart';
import 'impl_prd.dart';
import 'impl_stg.dart';
import 'interface.dart';

/// Firebase Analytics
final analyticsProvider = Provider<Analytics>((ref) {
  final flavor = ref.watch(flavorProvider);
  return switch (flavor) {
    Flavor.dev => DevAnalytics(),
    Flavor.stg => StgAnalytics(),
    Flavor.prd => PrdAnalytics(),
  };
});
