// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/notification/type/notification.dart';
import '../../state/notification_list/provider.dart';
import '../logger.dart';
import '../widgets/error_unknown.dart';
import '../widgets/splash.dart';

/// 通知を管理しているシェル
class NotifiedShell extends ConsumerWidget {
  const NotifiedShell({
    super.key,
    required this.builder,
  });

  final Widget Function(List<MyNotification> notifications) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncNotificationList = ref.watch(notificationListProvider);
    ref.listen(
      notificationListProvider,
      (_, __) {
        viewLogger.info('通知リストが変更されました');
      },
    );

    switch (asyncNotificationList) {
      case AsyncData(:final value):
        return builder(value);
      case AsyncError(:final error, :final stackTrace):
        return ErrorUnknownPage(
          error: error,
          stackTrace: stackTrace,
        );
      default:
        return const Splash(isLoading: true);
    }
  }
}
