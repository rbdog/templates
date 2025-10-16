import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/debug/index.dart';
import '../../logic/marketing/index.dart';
import '../../logic/todo/index.dart';
import '../debug/provider.dart';
import '../di/adapters.dart';
import '../user/provider.dart';

/// Todo一覧を管理するノティファイヤ
class TodoListNotifier extends AutoDisposeAsyncNotifier<List<Todo>> {
  @override
  Future<List<Todo>> build() async {
    final logger = ref.read(loggerProvider(Layer.state));
    logger.info('Todo一覧を初期化します');

    // Firestore から取得
    final firestore = ref.read(firebaseFirestoreProvider);
    final user = await ref.read(userProvider.future);
    final todos = await firestore.findTodosByUserId(user!.id);
    return todos;
  }

  /// リストの一番末尾にTodoを追加する
  Future<void> add() async {
    final logger = ref.read(loggerProvider(Layer.state));
    logger.info('Todoを追加します');

    final current = await future;

    // Firebaseにイベントを報告する
    final analytics = ref.read(firebaseAnalyticsProvider);
    analytics.sendEvent(AnalyticsEvent.addNewTodo);

    // ドメインを呼んで新しいTodoを作成
    final creator = TodoCreator(defaultText: todoConfig.defaultText);
    final todo = creator.createNewTodo();

    final newList = [...current, todo];
    state = AsyncData(newList);
  }

  /// 指定されたIDのTodoを削除する
  Future<void> delete(String id) async {
    final logger = ref.read(loggerProvider(Layer.state));
    logger.info('Todoを削除します');

    await future;

    // Firebaseにイベントを報告する
    final analytics = ref.read(firebaseAnalyticsProvider);
    analytics.sendEvent(AnalyticsEvent.deleteTodo);

    final newList = List.of(state.value!);
    newList.removeWhere((todo) => todo.id == id);
    state = AsyncData(newList);
  }

  /// Todoを上書きする
  Future<void> replace(Todo newTodo) async {
    final logger = ref.read(loggerProvider(Layer.state));
    logger.info('Todoを上書きします');

    final current = await future;

    final newList = current.map((it) {
      // id が一致したTodoだけ新しい方を採用
      // それ以外はそのまま
      return it.id == newTodo.id ? newTodo : it;
    }).toList();

    state = AsyncData(newList);
  }

  /// ステータスを次に進める
  Future<void> editStatus(String id) async {
    final logger = ref.read(loggerProvider(Layer.state));
    logger.info('ステータスを編集します');

    final current = await future;

    // 対象のTodoを取得
    final todo = current.firstWhere((it) => it.id == id);

    // ロジックを呼んでステータスを変更する
    const updater = TodoUpdater();
    final updatedTodo = updater.switchStatus(todo);

    // リスト全体を更新
    final newList = current.map((it) {
      return it.id == id ? updatedTodo : it;
    }).toList();

    state = AsyncData(newList);
  }

  /// Todoの内容を編集する
  Future<void> editText(String id, String newText) async {
    final logger = ref.read(loggerProvider(Layer.state));
    logger.info('テキストを編集します');

    final current = await future;

    // 対象のTodoを取得
    final todo = current.firstWhere((it) => it.id == id);

    // ロジックを呼んでテキストを変更する
    const updater = TodoUpdater();
    final updatedTodo = updater.updateText(todo, newText);

    // リスト全体を更新
    final newList = current.map((it) {
      return it.id == id ? updatedTodo : it;
    }).toList();

    state = AsyncData(newList);
  }

  /// 編集した内容を保存する
  Future<void> save({
    required String id,
    required void Function() onValidateFailure,
    required void Function() onSuccess,
  }) async {
    final logger = ref.read(loggerProvider(Layer.state));
    logger.info('編集内容を保存します');

    final current = await future;

    // 対象のTodoを取得
    final todo = current.firstWhere((it) => it.id == id);

    // ロジックを呼んで内容をチェックする
    const validator = TodoValidator();
    final result = validator.validate(todo);

    // ルール違反のときはコールバックして終了
    if (result != TodoValidationResult.ok) {
      onValidateFailure();
      return;
    }

    // 成功を知らせる
    onSuccess();
  }
}
