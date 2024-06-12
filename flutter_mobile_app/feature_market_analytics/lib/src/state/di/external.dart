

import 'package:feature_flavor/feature_flavor.dart';
import 'package:riverpod/riverpod.dart';

import '../../external/implements/analytics/dev.dart';
import '../../external/implements/analytics/prd.dart';
import '../../external/implements/analytics/stg.dart';
import '../../external/interfaces/analytics.dart';

/// Firebase Analytics
final analyticsProvider = Provider<Analytics>((ref) {
  final flavor = ref.watch(flavorProvider);
  return switch (flavor) {
    Flavor.dev => DevAnalytics(),
    Flavor.stg => StgAnalytics(),
    Flavor.prd => PrdAnalytics(),
  };
});
