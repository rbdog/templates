// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'impl_default.dart';
import 'interface.dart';

/// アプリ情報
final appPkgProvider = Provider<AppPkg>((ref) {
  return DefaultAppPkg();
});
