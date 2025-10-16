import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/app_notification/index.dart';
import '../../logic/debug/index.dart';
import '../../state/app_notification/provider.dart';
import '../../state/debug/provider.dart';
import '../pages/error_unknown.dart';
import '../stateless_components/splash_view.dart';

/// 通知を管理しているシェル
class NotifiedShell extends ConsumerWidget {
  const NotifiedShell({super.key, required this.builder});

  final Widget Function(List<AppNotification> notifications) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncNotificationList = ref.watch(appNotificationListProvider);
    ref.listen(appNotificationListProvider, (_, _) {
      final logger = ref.read(loggerProvider(Layer.ui));
      logger.info('通知リストが変更されました');
    });

    switch (asyncNotificationList) {
      case AsyncData(:final value):
        return builder(value);
      case AsyncError(:final error, :final stackTrace):
        return ErrorUnknownPage(error: error, stackTrace: stackTrace);
      default:
        return const SplashView(isLoading: true);
    }
  }
}
