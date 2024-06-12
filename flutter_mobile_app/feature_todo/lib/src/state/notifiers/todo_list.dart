// Package imports:
import 'package:feature_auth/feature_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/config/todo.dart';
import '../../logic/creators/todo.dart';
import '../../logic/types/todo.dart';
import '../di/external.dart';

/// Todo一覧を管理するノティファイヤ
class TodoListNotifier extends AsyncNotifier<List<Todo>> {
  @override
  Future<List<Todo>> build() async {
    // Firestore から取得
    final firestore = ref.read(firestoreProvider);
    final user = await ref.read(userProvider.future);
    final todos = await firestore.findTodosByUserId(user!.id);
    return todos;
  }

  /// リストの一番末尾にTodoを追加する
  void add() {
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
