import '../../ports/logger.dart';

import 'package:package_info_plus/package_info_plus.dart';

import '../../domain/debug/index.dart';
import '../../ports/app_info.dart';

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
