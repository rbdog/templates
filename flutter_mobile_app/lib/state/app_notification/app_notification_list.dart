import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/app_notification/index.dart';
import '../di/adapters.dart';

/// アプリ通知
class AppNotificationListNotifier
    extends AutoDisposeAsyncNotifier<List<AppNotification>> {
  @override
  Future<List<AppNotification>> build() async {
    final api = ref.read(notificationApiProvider);
    return api.getNotifications();
  }
}
