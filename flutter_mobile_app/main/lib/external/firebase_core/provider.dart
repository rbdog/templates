// Package imports:
import 'package:feature_flavor/feature_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../external/firebase_core/impl_dev.dart';
import '../../external/firebase_core/impl_prd.dart';
import '../../external/firebase_core/impl_stg.dart';
import '../../external/firebase_core/interface.dart';

/// Firebase Core
final firebaseCoreProvider = Provider<FirebaseCore>((ref) {
  final flavor = ref.watch(flavorProvider);
  return switch (flavor) {
    Flavor.dev => DevFirebaseCore(),
    Flavor.stg => StgFirebaseCore(),
    Flavor.prd => PrdFirebaseCore(),
  };
});
