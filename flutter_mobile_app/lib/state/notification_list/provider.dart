// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/notification/type/notification.dart';
import 'notifier.dart';

typedef _Notifier = NotificationListNotifier;
typedef _State = List<MyNotification>;

final notificationListProvider = AsyncNotifierProvider<_Notifier, _State>(
  () {
    return _Notifier();
  },
);
