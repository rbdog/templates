// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'impl_default.dart';
import 'interface.dart';

/// Console
final consoleProvider = Provider<Console>((ref) {
  return const DefaultConsole();
});
