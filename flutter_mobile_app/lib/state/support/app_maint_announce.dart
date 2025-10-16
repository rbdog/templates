import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/support/index.dart';
import '../di/adapters.dart';

class AppMaintAnnounceNotifier
    extends AutoDisposeAsyncNotifier<AppMaintAnnounce> {
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
