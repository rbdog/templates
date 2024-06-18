import 'package:feature_flavor/feature_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'impl_dev.dart';
import 'impl_prd.dart';
import 'impl_stg.dart';
import 'interface.dart';

/// Firebase Auth
final authProvider = Provider<Auth>((ref) {
  final flavor = ref.watch(flavorProvider);
  return switch (flavor) {
    Flavor.dev => DevAuth(),
    Flavor.stg => StgAuth(),
    Flavor.prd => PrdAuth(),
  };
});
