// Project imports:
import '../config/todo.dart';
import '../types/todo.dart';
import '../types/todo_validation_result.dart';

/// Todoが正常かチェックするクラス
class TodoValidater {
  const TodoValidater();

  /// チェックする
  TodoValidationResult validate(Todo todo) {
    if (todo.text.length > todoConfig.maxTextLength) {
      // 文字数が長すぎる
      return TodoValidationResult.tooLongText;
    }

    // 正常
    return TodoValidationResult.ok;
  }
}
