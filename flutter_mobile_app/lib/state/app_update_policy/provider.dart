// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/app_update_policy/types/app_update_policy.dart';
import 'notifier.dart';

typedef _Notifier = AppUpdatePolicyNotifier;
typedef _State = AppUpdatePolicy;

/// アプリアップデート指針
final appUpdatePolicyProvider = AsyncNotifierProvider<_Notifier, _State>(
  () {
    return _Notifier();
  },
);
