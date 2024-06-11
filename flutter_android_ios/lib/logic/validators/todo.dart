import 'package:my_app/logic/config/todo.dart';
import 'package:my_app/logic/types/todo.dart';
import 'package:my_app/logic/types/todo_validation_result.dart';

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
