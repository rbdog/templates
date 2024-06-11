import 'package:my_app/external/interfaces/firestore.dart';
import 'package:my_app/logic/types/todo.dart';

/// stgフレーバー用の Firestore
class StgFirestore implements Firestore {
  @override
  Future<List<Todo>> findTodosByUserId(String userId) {
    throw UnimplementedError();
  }
}
