// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'notifier.dart';

typedef _Notifier = ExampleNotifier;
typedef _State = String;

/// Example
final exampleStateProvider = NotifierProvider<_Notifier, _State>(
  () {
    return _Notifier();
  },
);
