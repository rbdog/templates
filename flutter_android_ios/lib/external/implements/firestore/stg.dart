// Project imports:
import '../../interfaces/firestore.dart';
import '../../../logic/types/todo.dart';

/// stgフレーバー用の Firestore
class StgFirestore implements Firestore {
  @override
  Future<List<Todo>> findTodosByUserId(String userId) {
    throw UnimplementedError();
  }
}
