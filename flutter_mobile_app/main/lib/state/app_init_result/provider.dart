// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/types/app_init_result.dart';
import 'notifier.dart';

typedef _Notifier = AppInitResultNotifier;
typedef _State = AppInitResult;

final appInitResultProvider = AsyncNotifierProvider<_Notifier, _State>(
  () {
    return _Notifier();
  },
);
