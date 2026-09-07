// Dart imports:
import 'dart:async';

import '../../domain/app_notification/index.dart';
import '../../ports/notification_api.dart';

/// dev
class ImplDev implements NotificationApi {
  @override
  Future<List<AppNotification>> getNotifications() async {
    return [];
  }
}
