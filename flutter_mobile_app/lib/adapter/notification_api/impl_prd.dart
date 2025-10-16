import '../../logic/app_notification/index.dart';
import 'interface.dart';

/// prd
class ImplPrd implements NotificationApi {
  @override
  Future<List<AppNotification>> getNotifications() async {
    return [];
  }
}
