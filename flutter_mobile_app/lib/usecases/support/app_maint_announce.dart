import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/support/index.dart';
import '../../di.dart';

class AppMaintAnnounceNotifier extends AsyncNotifier<AppMaintAnnounce> {
  @override
  Future<AppMaintAnnounce> build() async {
    final remoteConfig = ref.read(firebaseRemoteConfigProvider);
    final config = await remoteConfig.getAppMaintConfig();

    const creator = AppMaintAnnounceCreator();
    final now = DateTime.now();
    final announce = creator.create(config: config, now: now);

    return announce;
  }
}
