import '../../logic/app_notification/index.dart';
import 'interface.dart';

/// stg
class ImplStg implements NotificationApi {
  @override
  Future<List<AppNotification>> getNotifications() async {
    return [];
  }
}
