import 'package:feature_flavor/feature_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../implements/user_api/dev.dart';
import '../implements/user_api/prd.dart';
import '../implements/user_api/stg.dart';
import '../interfaces/user_api.dart';

final userApiProvider = Provider<UserApi>(
  (ref) {
    final flavor = ref.watch(flavorProvider);
    return switch (flavor) {
      Flavor.dev => DevUserApi(),
      Flavor.stg => StgUserApi(),
      Flavor.prd => PrdUserAPi(),
    };
  },
);
