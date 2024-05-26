import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/logic/types/app_init_result.dart';
import 'package:my_app/state/notifiers/app_init_result.dart';

typedef _Notifier = AppInitResultNotifier;
typedef _State = AppInitResult;

final appInitResultProvider = AsyncNotifierProvider<_Notifier, _State>(
  () {
    return _Notifier();
  },
);
