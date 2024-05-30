import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/logic/types/app_update_urgency.dart';
import 'package:my_app/state/notifiers/app_update_action.dart';

typedef _Notifier = AppUpdateUrgencyNotifier;
typedef _State = AppUpdateUrgency;

/// アプリアップデート
final appUpdateUrgencyProvider = AsyncNotifierProvider<_Notifier, _State>(
  () {
    return _Notifier();
  },
);
