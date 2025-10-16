import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/support/index.dart';
import 'app_maint_announce.dart';
import 'app_update_rule.dart';
import 'splash_completed.dart';

/// アプリメンテナンスのお知らせ
final appMaintAnnounceProvider =
    AsyncNotifierProvider.autoDispose<
      AppMaintAnnounceNotifier,
      AppMaintAnnounce
    >(() {
      return AppMaintAnnounceNotifier();
    });

/// アプリアップデート指針
final appUpdateRuleProvider =
    AsyncNotifierProvider.autoDispose<AppUpdatePolicyNotifier, AppUpdateRule>(
      () {
        return AppUpdatePolicyNotifier();
      },
    );

final splashCompletedProvider =
    AsyncNotifierProvider.autoDispose<SplashCompletedNotifier, SplashCompleted>(
      () {
        return SplashCompletedNotifier();
      },
    );
