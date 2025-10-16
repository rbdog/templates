import '../../logic/app_notification/index.dart';

/// Notification API
abstract interface class NotificationApi {
  /// ユーザーを取得
  Future<List<AppNotification>> getNotifications();
}
