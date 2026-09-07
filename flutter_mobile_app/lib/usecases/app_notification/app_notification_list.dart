import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/app_notification/index.dart';
import '../../di.dart';

/// アプリ通知
class AppNotificationListNotifier extends AsyncNotifier<List<AppNotification>> {
  @override
  Future<List<AppNotification>> build() async {
    final api = ref.read(notificationApiProvider);
    return api.getNotifications();
  }
}
