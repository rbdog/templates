import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/runner/interfaces/firebase.dart';
import 'package:my_app/runner/interfaces/logger.dart';
import 'package:my_app/core/config/flavor.dart';
import 'package:my_app/core/types/flavor.dart';
// DI は特別に外レイヤーをimportする
import 'package:my_app/api/firebase/fake_firebase.dart';
import 'package:my_app/api/firebase/firebase.dart';
import 'package:my_app/api/log/fake_logger.dart';
import 'package:my_app/api/log/logger.dart';

/// Firebase
final firebaseProvider = Provider<FirebaseService>(
  (ref) {
    switch (flavor) {
      case Flavor.dev:
        return FakeFirebaseService();
      case Flavor.stg:
        return FakeFirebaseService();
      case Flavor.prd:
        return DefaultFirebaseService();
    }
  },
);

/// Logger
final loggerProvider = Provider<Logger>(
  (ref) {
    switch (flavor) {
      case Flavor.dev:
        return FakeLogger();
      case Flavor.stg:
        return FakeLogger();
      case Flavor.prd:
        return DefaultLogger();
    }
  },
);
