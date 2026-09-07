import '../../domain/app_notification/index.dart';
import '../../ports/notification_api.dart';

/// stg
class ImplStg implements NotificationApi {
  @override
  Future<List<AppNotification>> getNotifications() async {
    return [];
  }
}
