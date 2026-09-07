import '../../domain/todo/index.dart';
import '../../ports/firebase_firestore.dart';

/// stgフレーバー用の Firestore
class ImplStg implements FirebaseFirestore {
  @override
  Future<List<Todo>> findTodosByUserId(String userId) {
    throw UnimplementedError();
  }
}
