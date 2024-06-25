// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'models.dart';
import 'notifier.dart';

typedef _Notifier = SplashCompletedNotifier;
typedef _State = SplashCompleted;

final splashCompletedProvider = AsyncNotifierProvider<_Notifier, _State>(
  () {
    return _Notifier();
  },
);
