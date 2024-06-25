// Project imports:
import '../../logic/semver/types/semver.dart';
import 'interface.dart';

/// アプリ情報
class ImplDefault implements AppPkg {
  @override
  Future<Semver> getVer() async {
    return const Semver(0, 0, 0);
  }
}
