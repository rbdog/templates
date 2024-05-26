/// メモに関する設定値
class MemoConfig {
  const MemoConfig({
    required this.defaultText,
    required this.maxLength,
  });

  /// はじめからメモに書かれている文字
  final String defaultText;

  /// メモに書ける最大文字数
  final int maxLength;
}
