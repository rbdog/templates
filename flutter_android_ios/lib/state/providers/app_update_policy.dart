import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/logic/types/app_update_policy.dart';
import 'package:my_app/state/notifiers/app_update_policy.dart';

typedef _Notifier = AppUpdatePolicyNotifier;
typedef _State = AppUpdatePolicy;

/// アプリアップデート指針
final appUpdatePolicyProvider = AsyncNotifierProvider<_Notifier, _State>(
  () {
    return _Notifier();
  },
);
