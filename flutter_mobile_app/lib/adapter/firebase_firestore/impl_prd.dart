import '../../logic/todo/index.dart';
import 'interface.dart';

/// prdフレーバー用の Firestore
class ImplPrd implements FirebaseFirestore {
  @override
  Future<List<Todo>> findTodosByUserId(String userId) {
    throw UnimplementedError();
  }
}
