/// 色情報付きのString
/// 赤: ColoredString.red('xxx')
/// 黄: ColoredString.yellow('xxx')
/// 緑: ColoredString.green('xxx')
class ColoredString {
  static const _set = '\x1B';
  static const _reset = '\x1B[0m'; // set + default color
  static const _red = '[31m';
  static const _yellow = '[33m';
  static const _green = '[32m';

  static String red(String text) => _set + _red + text + _reset;
  static String yellow(String text) => _set + _yellow + text + _reset;
  static String green(String text) => _set + _green + text + _reset;
}
