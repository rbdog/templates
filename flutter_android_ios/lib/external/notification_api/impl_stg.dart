// Project imports:

// Project imports:
import '../../logic/notification/type/notification.dart';
import 'interface.dart';

/// stg
class ImplStg implements NotificationApi {
  @override
  Future<List<MyNotification>> getNotifications() async {
    return [];
  }
}
