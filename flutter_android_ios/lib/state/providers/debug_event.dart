// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../notifiers/debug_event.dart';

typedef _Notifier = DebugEventNotifier;
typedef _State = void;

/// デバッグ用
final debugEventProvider = NotifierProvider<_Notifier, _State>(
  () {
    return _Notifier();
  },
);
