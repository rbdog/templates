import 'package:my_app/core/types/memo.dart';

/// Firestore
abstract interface class Firestore {
  /// ユーザーIDでメモを取得
  Future<List<Memo>> findMemosByUserId(String userId);
}
