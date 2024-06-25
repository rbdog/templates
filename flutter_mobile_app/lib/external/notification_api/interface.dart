// Project imports:

// Project imports:
import '../../logic/notification/type/notification.dart';

/// Notification API
abstract interface class NotificationApi {
  /// ユーザーを取得
  Future<List<MyNotification>> getNotifications();
}
