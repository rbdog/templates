import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/logic/types/app_update_action.dart';
import 'package:my_app/state/notifiers/app_update_action.dart';

typedef _Notifier = AppUpdateActionNotifier;
typedef _State = AppUpdateAction;

/// アプリアップデート
final appUpdateActionProvider = AsyncNotifierProvider<_Notifier, _State>(
  () {
    return _Notifier();
  },
);
