import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/core/types/app_update_action.dart';
import 'package:my_app/runner/notifiers/app_update_action.dart';

typedef _Notifier = AppUpdateActionNotifier;
typedef _State = AppUpdateAction;

/// アプリアップデート
final appUpdateActionProvider = AsyncNotifierProvider<_Notifier, _State>(
  () {
    return _Notifier();
  },
);
