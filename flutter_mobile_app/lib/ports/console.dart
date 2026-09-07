/// ログ出力用のコンソール
abstract interface class Console {
  /// 警告(赤) を出力
  void red(String message);

  /// 注意(黄) を出力
  void green(String message);

  /// 情報(緑) を出力
  void yellow(String message);
}
