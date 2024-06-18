// Project imports:
import 'interface.dart';
import '../../logic/types/semver.dart';

/// アプリ情報
class DefaultAppPkg implements AppPkg {
  @override
  Future<Semver> getVersion() async {
    return const Semver(
      major: 0,
      minor: 0,
      patch: 0,
    );
  }
}
