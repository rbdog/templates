import '../types/status.dart';
import '../types/todo.dart';

/// Todoの更新ルールを担当するクラス
class TodoUpdater {
  const TodoUpdater();

  /// ステータスを次に進める
  Todo switchStatus(Todo todo) {
    final next = switch (todo.status) {
      Status.todo => Status.doing, // 予定 => 進行中
      Status.doing => Status.done, // 進行中 => 完了
      Status.done => Status.todo, // 完了 => 予定(戻す)
    };
    // ステータスを変更してTodoを返す
    return todo.copyWith(status: next);
  }

  /// 書かれた文字を上書きして更新する
  Todo updateText(Todo todo, String newText) {
    return todo.copyWith(text: newText);
  }
}
