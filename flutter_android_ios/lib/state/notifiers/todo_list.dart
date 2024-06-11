import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/logic/config/todo.dart';
import 'package:my_app/state/notifiers/logger.dart';
import 'package:my_app/logic/creators/todo.dart';
import 'package:my_app/logic/types/analytics_event.dart';
import 'package:my_app/logic/types/todo.dart';
import 'package:my_app/state/di/external.dart';
import 'package:my_app/state/providers/user.dart';

/// Todo一覧を管理するノティファイヤ
class TodoListNotifier extends AsyncNotifier<List<Todo>> {
  @override
  Future<List<Todo>> build() async {
    // ログ
    logger.info('Todo一覧を初期化します');
    // Firestore から取得
    final firestore = ref.read(firestoreProvider);
    final user = await ref.read(userProvider.future);
    final todos = await firestore.findTodosByUserId(user!.id);
    return todos;
  }

  /// リストの一番末尾にTodoを追加する
  void add() {
    // ログ
    logger.info('Todoを追加します');

    // Firebaseにイベントを報告する
    final analytics = ref.read(analyticsProvider);
    analytics.sendEvent(AnalyticsEvent.addNewTodo);

    // ドメインを呼んで新しいTodoを作成
    final creator = TodoCreater(
      defaultText: todoConfig.defaultText,
    );
    final todo = creator.createNewTodo();

    final newList = [...state.value!, todo];
    state = AsyncData(newList);
  }

  /// 指定されたIDのTodoを削除する
  void delete(String id) {
    // ログ
    logger.info('Todoを削除します');

    // Firebaseにイベントを報告する
    final analytics = ref.read(analyticsProvider);
    analytics.sendEvent(AnalyticsEvent.deleteTodo);

    final newList = List.of(state.value!);
    newList.removeWhere(
      (todo) => todo.id == id,
    );
    state = AsyncData(newList);
  }

  /// Todoを上書きする
  void replace(Todo newTodo) {
    final newList = state.value!.map((it) {
      // id が一致したTodoだけ新しい方を採用
      // それ以外はそのまま
      return it.id == newTodo.id ? newTodo : it;
    }).toList();
    state = AsyncData(newList);
  }
}
