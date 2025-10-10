// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/flavor/types/flavor.dart';
import '../../state/flavor/provider.dart';
import 'impl_dev.dart';
import 'impl_prd.dart';
import 'impl_stg.dart';
import 'interface.dart';

/// Firestore
final firestoreProvider = Provider<Firestore>((ref) {
  return switch (flavor) {
    Flavor.dev => ImplDev(),
    Flavor.stg => ImplStg(),
    Flavor.prd => ImplPrd(),
  };
});
