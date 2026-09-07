import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/app_notification/index.dart';
import 'app_notification_list.dart';

final appNotificationListProvider =
    AsyncNotifierProvider.autoDispose<
      AppNotificationListNotifier,
      List<AppNotification>
    >(() {
      return AppNotificationListNotifier();
    });
