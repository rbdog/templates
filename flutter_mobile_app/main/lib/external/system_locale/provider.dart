// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../external/system_locale/impl_default.dart';
import '../../external/system_locale/interface.dart';

/// System Locale
final systemLocaleProvider = Provider<SystemLocale>((ref) {
  return DefaultSystemLocale();
});
