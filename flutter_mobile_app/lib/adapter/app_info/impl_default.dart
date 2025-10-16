import 'package:package_info_plus/package_info_plus.dart';

import '../../logic/debug/index.dart';
import 'interface.dart';

/// アプリ情報
class ImplDefault implements AppInfo {
  const ImplDefault({required this.logger});

  final Logger logger;

  @override
  Future<Semver> getVer() async {
    final info = await PackageInfo.fromPlatform();
    final converter = SemverConverter();
    final version = converter.fromString(info.version);
    return version;
  }
}
