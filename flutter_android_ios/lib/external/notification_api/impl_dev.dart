// Dart imports:
import 'dart:async';

// Project imports:
import '../../logic/notification/type/notification.dart';
import 'interface.dart';

// Project imports:

/// dev
class ImplDev implements NotificationApi {
  @override
  Future<List<MyNotification>> getNotifications() async {
    return [];
  }
}
