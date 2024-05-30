import 'package:my_app/external/interfaces/console.dart';

/// コンソールのグローバルキャッシュ
/// 毎回 依存注入するのが無駄なため, アプリ起動時にキャッシュ
late Console logger;
