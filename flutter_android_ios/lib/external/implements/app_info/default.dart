import 'package:my_app/external/interfaces/app_info.dart';
import 'package:my_app/logic/types/semantic_version.dart';

/// アプリ情報
class DefaultAppInfo implements AppInfo {
  @override
  Future<SemanticVersion> getAppVersion() async {
    return const SemanticVersion(
      major: 0,
      minor: 0,
      patch: 0,
    );
  }
}
