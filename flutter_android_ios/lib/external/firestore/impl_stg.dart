// Project imports:
import '../../logic/todo/types/todo.dart';
import 'interface.dart';

/// stgフレーバー用の Firestore
class StgFirestore implements Firestore {
  @override
  Future<List<Todo>> findTodosByUserId(String userId) {
    throw UnimplementedError();
  }
}
