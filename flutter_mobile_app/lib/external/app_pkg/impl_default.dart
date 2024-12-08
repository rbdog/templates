import 'package:package_info_plus/package_info_plus.dart';

// Project imports:
import '../../logic/semver/types/semver.dart';
import '../../logic/semver/converter.dart';
import 'interface.dart';

/// アプリ情報
class ImplDefault implements AppPkg {
  @override
  Future<Semver> getVer() async {
    final info = await PackageInfo.fromPlatform();
    final converter = SemverConverter();
    final version = converter.fromString(info.version);
    return version;
  }
}
