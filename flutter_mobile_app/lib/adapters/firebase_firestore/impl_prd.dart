import '../../domain/todo/index.dart';
import '../../ports/firebase_firestore.dart';

/// prdフレーバー用の Firestore
class ImplPrd implements FirebaseFirestore {
  @override
  Future<List<Todo>> findTodosByUserId(String userId) {
    throw UnimplementedError();
  }
}
