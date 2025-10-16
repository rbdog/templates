import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/debug/index.dart';
import '../di/adapters.dart';
import 'debug_event.dart';

final debugEventProvider =
    NotifierProvider.autoDispose<DebugEventNotifier, void>(() {
      return DebugEventNotifier();
    });

final logFilterProvider = Provider.autoDispose<LogFilter>((ref) {
  const debugFilter = LogFilter(minLevel: LogLevel.info, layers: Layer.values);

  const releaseFilter = LogFilter(
    minLevel: LogLevel.error,
    layers: Layer.values,
  );

  return kReleaseMode ? releaseFilter : debugFilter;
});

final loggerProvider = Provider.family.autoDispose<Logger, Layer>((ref, layer) {
  final filter = ref.watch(logFilterProvider);
  final console = ref.watch(consoleProvider);

  return Logger(filter: filter, console: console, layer: layer);
});
