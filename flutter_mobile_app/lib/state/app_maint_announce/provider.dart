// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/maint/types/app_maint_announce.dart';
import 'notifier.dart';

typedef _Notifier = AppMaintAnnounceNotifier;
typedef _State = AppMaintAnnounce;

final appMaintAnnounceProvider = AsyncNotifierProvider<_Notifier, _State>(() {
  return _Notifier();
});
