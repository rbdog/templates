// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/todo/types/todo.dart';
import '../../logic/todo/types/validation_result.dart';
import '../../logic/todo/updater.dart';
import '../../logic/todo/validator.dart';
import '../logger.dart';
import '../todo_list/provider.dart';

/// 編集中Todoを管理するノティファイヤ
class EditingTodoNotifier extends FamilyNotifier<Todo, String> {
  EditingTodoNotifier();

  @override
  Todo build(String arg) {
    final todos = ref.read(todoListProvider);
    return todos.value!.firstWhere((it) => it.id == arg);
  }

  /// ステータスを次に進める
  Future<void> editStatus() async {
    // ログ
    stateLogger.info('ステータスを編集します');
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
    // ログ
    stateLogger.info('テキストを編集します');
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
    // ログ
    stateLogger.info('編集内容を保存します');
    // ロジックを呼んで内容をチェックする
    const validator = TodoValidator();
    final result = validator.validate(state);
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
