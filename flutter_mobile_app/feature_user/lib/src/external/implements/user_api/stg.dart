// Project imports:

import '../../../logic/types/user.dart';
import '../../interfaces/user_api.dart';

/// stg
class StgUserApi implements UserApi {
  @override
  Future<User?> getUser({required String id}) {
    throw UnimplementedError();
  }
}
