// Dart imports:
import 'dart:async';

import '../../logic/app_notification/index.dart';
import 'interface.dart';

/// dev
class ImplDev implements NotificationApi {
  @override
  Future<List<AppNotification>> getNotifications() async {
    return [];
  }
}
