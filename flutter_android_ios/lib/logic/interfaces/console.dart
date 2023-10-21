/// ログ出力用のコンソール
abstract interface class Console {
  /// 警告(赤) を出力
  void error(String message);

  /// 注意(黄) を出力
  void warn(String message);

  /// 情報(緑) を出力
  void info(String message);
}
