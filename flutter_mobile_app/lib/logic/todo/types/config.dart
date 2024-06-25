/// Todoに関する設定値
class TodoConfig {
  const TodoConfig({
    required this.defaultText,
    required this.maxTextLength,
  });

  /// はじめからTodoに書かれている文字
  final String defaultText;

  /// Todoに書ける最大文字数
  final int maxTextLength;
}
