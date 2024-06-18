// Project imports:
import 'interface.dart';

/// 出力できない Console (リリースモードで利用)
class DisabledConsole implements Console {
  const DisabledConsole();

  @override
  void red(String message) {}

  @override
  void green(String message) {}

  @override
  void yellow(String message) {}
}
