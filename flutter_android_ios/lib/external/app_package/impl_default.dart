// Project imports:
import '../../logic/semver/types/semver.dart';
import 'interface.dart';

/// アプリ情報
class DefaultAppPackage implements AppPackage {
  @override
  Future<Semver> getAppVersion() async {
    return const Semver(0, 0, 0);
  }
}
