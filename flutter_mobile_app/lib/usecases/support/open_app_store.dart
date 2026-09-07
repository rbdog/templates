import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di.dart';
import '../../ports/app_store.dart';

/// アプリストアを開く
class OpenAppStore {
  const OpenAppStore({required this.store});

  final AppStore store;

  Future<void> call() => store.open();
}

final openAppStoreProvider = Provider<OpenAppStore>((ref) {
  return OpenAppStore(store: ref.read(appStoreProvider));
});
