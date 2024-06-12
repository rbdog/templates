import 'package:feature_flavor/feature_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../external/implements/firestore/dev.dart';
import '../../external/implements/firestore/prd.dart';
import '../../external/implements/firestore/stg.dart';
import '../../external/interfaces/firestore.dart';

/// Firestore
final firestoreProvider = Provider<Firestore>((ref) {
  final flavor = ref.watch(flavorProvider);
  return switch (flavor) {
    Flavor.dev => DevFirestore(),
    Flavor.stg => StgFirestore(),
    Flavor.prd => PrdFirestore(),
  };
});
