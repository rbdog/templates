// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'impl_default.dart';
import 'interface.dart';

/// アプリストア
final appStoreProvider = Provider<AppStore>((ref) {
  return ImplDefault();
});
