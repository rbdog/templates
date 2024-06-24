// Project imports:

// Project imports:
import '../../logic/notification/type/notification.dart';
import 'interface.dart';

/// prd
class ImplPrd implements NotificationApi {
  @override
  Future<List<MyNotification>> getNotifications() async {
    return [];
  }
}
