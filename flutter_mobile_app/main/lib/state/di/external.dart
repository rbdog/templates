import 'package:feature_flavor/feature_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../external/implements/firebase_core/dev.dart';
import '../../external/implements/firebase_core/prd.dart';
import '../../external/implements/firebase_core/stg.dart';
import '../../external/implements/system_locale/default.dart';
import '../../external/interfaces/firebase_core.dart';
import '../../external/interfaces/systems_locale.dart';

/// Firebase Core
final firebaseCoreProvider = Provider<FirebaseCore>((ref) {
  final flavor = ref.watch(flavorProvider);
  return switch (flavor) {
    Flavor.dev => DevFirebaseCore(),
    Flavor.stg => StgFirebaseCore(),
    Flavor.prd => PrdFirebaseCore(),
  };
});

/// System Locale
final systemLocaleProvider = Provider<SystemLocale>((ref) {
  return DefaultSystemLocale();
});
