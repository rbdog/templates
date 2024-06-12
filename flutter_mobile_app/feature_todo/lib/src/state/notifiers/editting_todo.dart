// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/types/todo.dart';
import '../../logic/types/todo_validation_result.dart';
import '../../logic/updaters/todo.dart';
import '../../logic/validators/todo.dart';
import '../providers/todo_list.dart';

/// 編集中Todoを管理するノティファイヤ
class EdittingTodoNotifier extends FamilyNotifier<Todo, String> {
  EdittingTodoNotifier();

  @override
  Todo build(String arg) {
    final todos = ref.read(todoListProvider);
    return todos.value!.firstWhere((it) => it.id == arg);
  }

  /// ステータスを次に進める
  Future<void> editStatus() async {
    // ロジックを呼んでステータスを変更する
    const updater = TodoUpdater();
    final todo = updater.switchStatus(state);
    // 編集中のTodoの状態を変更する
    state = todo;
  }

  /// Todoの内容を編集する
  Future<void> editText(
    String newText,
  ) async {
    // ロジックを呼んでステータスを変更する
    const updater = TodoUpdater();
    final todo = updater.updateText(
      state,
      newText,
    );
    // 編集中のTodoの状態を変更する
    state = todo;
  }

  /// 編集した内容を保存する
  Future<void> save({
    required void Function() onValidateFailure,
    required void Function() onSuccess,
  }) async {
    // ロジックを呼んで内容をチェックする
    const validater = TodoValidater();
    final result = validater.validate(state);
    // ルール違反のときはコールバックして終了
    if (result != TodoValidationResult.ok) {
      onValidateFailure();
      return;
    }
    // リスト一覧のTodoを上書きして状態を変更
    final listNotifier = ref.read(todoListProvider.notifier);
    listNotifier.replace(state);
    // 成功を知らせる
    onSuccess();
  }
}
