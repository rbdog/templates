import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../external/remote_config/provider.dart';
import '../../logic/app_maint_announce/creator.dart';
import '../../logic/app_maint_announce/types/app_maint_announce.dart';

class AppMaintAnnounceNotifier extends AsyncNotifier<AppMaintAnnounce> {
  @override
  Future<AppMaintAnnounce> build() async {
    return _getAnnounce();
  }

  Future<AppMaintAnnounce> _getAnnounce() async {
    final remoteConfig = ref.read(remoteConfigProvider);
    final config = await remoteConfig.getAppMaintConfig();

    const creator = AppMaintAnnounceCreator();
    final now = DateTime.now();
    final announce = creator.create(
      config: config,
      now: now,
    );

    return announce;
  }
}
