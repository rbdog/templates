import 'package:riverpod/riverpod.dart';

import 'impl_default.dart';

import 'interface.dart';

/// Console
final consoleProvider = Provider<Console>((ref) {
  return const DefaultConsole();
});
