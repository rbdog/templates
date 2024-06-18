import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../app_pkg/impl_default.dart';
import 'interface.dart';

/// アプリ情報
final appPkgProvider = Provider<AppPkg>((ref) {
  return DefaultAppPkg();
});
