// Project imports:

import '../../logic/types/user.dart';
import 'interface.dart';

/// stg
class StgUserApi implements UserApi {
  @override
  Future<User?> getUser({required String id}) {
    throw UnimplementedError();
  }
}
