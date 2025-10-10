// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/app_update/types/app_update_rule.dart';
import 'notifier.dart';

typedef _Notifier = AppUpdatePolicyNotifier;
typedef _State = AppUpdateRule;

/// アプリアップデート指針
final appUpdateRuleProvider = AsyncNotifierProvider<_Notifier, _State>(() {
  return _Notifier();
});
