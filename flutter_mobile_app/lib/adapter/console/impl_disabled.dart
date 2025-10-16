import 'interface.dart';

/// 出力できない Console (リリースモードで利用)
class ImplDisabled implements Console {
  const ImplDisabled();

  @override
  void red(String message) {}

  @override
  void green(String message) {}

  @override
  void yellow(String message) {}
}
