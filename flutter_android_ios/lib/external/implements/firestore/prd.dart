import 'package:my_app/external/interfaces/firestore.dart';
import 'package:my_app/logic/types/todo.dart';

/// prdフレーバー用の Firestore
class PrdFirestore implements Firestore {
  @override
  Future<List<Todo>> findTodosByUserId(String userId) {
    throw UnimplementedError();
  }
}
