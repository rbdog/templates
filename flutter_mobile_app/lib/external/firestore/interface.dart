// Project imports:
import '../../logic/todo/types/todo.dart';

/// Firestore
abstract interface class Firestore {
  /// ユーザーIDでTodoを取得
  Future<List<Todo>> findTodosByUserId(String userId);
}
