

import 'package:feature_flavor/feature_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../external/implements/auth/dev.dart';
import '../../external/implements/auth/prd.dart';
import '../../external/implements/auth/stg.dart';
import '../../external/interfaces/auth.dart';

/// Firebase Auth
final authProvider = Provider<Auth>((ref) {
  final flavor = ref.watch(flavorProvider);
  return switch (flavor) {
    Flavor.dev => DevAuth(),
    Flavor.stg => StgAuth(),
    Flavor.prd => PrdAuth(),
  };
});
