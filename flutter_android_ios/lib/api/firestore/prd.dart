import 'package:my_app/core/interfaces/firestore.dart';
import 'package:my_app/core/types/memo.dart';

/// prdフレーバー用の Firestore
class PrdFirestore implements Firestore {
  @override
  Future<List<Memo>> findMemosByUserId(String userId) {
    throw UnimplementedError();
  }
}
