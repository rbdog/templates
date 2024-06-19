// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'impl_default.dart';
import 'interface.dart';

/// System Locale
final systemLocaleProvider = Provider<SystemLocale>((ref) {
  return DefaultSystemLocale();
});
