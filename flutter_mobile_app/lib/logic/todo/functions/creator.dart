import 'package:uuid/uuid.dart';

import '../types/status.dart';
import '../types/todo.dart';

/// Todoの作成ルールを担当するクラス
class TodoCreator {
  const TodoCreator({required this.defaultText});

  /// 最初からTodoに書かれている文字
  final String defaultText;

  /// 新規Todoを作成する
  Todo createNewTodo() {
    /// ランダムな ID を作成
    final id = const Uuid().v4();
    // はじめは 予定 のステータス
    const status = Status.todo;

    return Todo(id: id, status: status, text: defaultText);
  }
}
