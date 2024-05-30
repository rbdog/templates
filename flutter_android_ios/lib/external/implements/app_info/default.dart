import 'package:my_app/external/interfaces/app_info.dart';

/// アプリ情報
class DefaultAppInfo implements AppInfo {
  @override
  Future<String> getAppVersion() async {
    return '0.0.0';
  }
}
