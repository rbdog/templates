import '../../domain/app_notification/index.dart';
import '../../ports/notification_api.dart';

/// prd
class ImplPrd implements NotificationApi {
  @override
  Future<List<AppNotification>> getNotifications() async {
    return [];
  }
}
