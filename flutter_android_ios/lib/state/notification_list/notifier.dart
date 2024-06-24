// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../external/notification_api/provider.dart';
import '../../logic/notification/type/notification.dart';

/// 通知
class NotificationListNotifier extends AsyncNotifier<List<MyNotification>> {
  @override
  Future<List<MyNotification>> build() async {
    final api = ref.read(notificationApiProvider);
    return api.getNotifications();
  }
}
