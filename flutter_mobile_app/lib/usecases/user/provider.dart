import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/user/index.dart';
import 'notifier.dart';

typedef _Notifier = UserNotifier;
typedef _State = User?;

final userProvider = AsyncNotifierProvider.autoDispose<_Notifier, _State>(() {
  return _Notifier();
});
