// Project imports:
import '../../logic/types/todo.dart';
import 'interface.dart';

/// prdフレーバー用の Firestore
class PrdFirestore implements Firestore {
  @override
  Future<List<Todo>> findTodosByUserId(String userId) {
    throw UnimplementedError();
  }
}
