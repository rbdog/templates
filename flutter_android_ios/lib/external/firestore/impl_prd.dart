// Project imports:
import '../../logic/todo/types/todo.dart';
import 'interface.dart';

/// prdフレーバー用の Firestore
class PrdFirestore implements Firestore {
  @override
  Future<List<Todo>> findTodosByUserId(String userId) {
    throw UnimplementedError();
  }
}
