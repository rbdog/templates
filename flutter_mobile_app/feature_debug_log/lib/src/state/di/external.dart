import 'package:riverpod/riverpod.dart';

import '../../external/implements/console/default.dart';

import '../../external/interfaces/console.dart';

/// Console
final consoleProvider = Provider<Console>((ref) {
  return const DefaultConsole();
});
