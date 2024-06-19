// Project imports:

import '../../logic/types/auth_user.dart';
import 'interface.dart';
import '../../logic/types/sign_in_with.dart';

/// prdフレーバー用の Firebase Auth
class PrdAuth implements Auth {
  @override
  Stream<AuthUser?> watchUser() {
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignedIn() {
    throw UnimplementedError();

    // しばらく待ってもらうための Completer
    // final completer = Completer<bool>();
    // // ストリームを一度のイベント分だけリッスン
    // late final StreamSubscription<User?> subs;
    // subs = dammyController.stream.listen((user) {
    //   subs.cancel();
    //   // 待ってもらっている相手に、完了を伝える
    //   final signedIn = user != null;
    //   completer.complete(signedIn);
    // });
    // return completer.future;
  }

  @override
  Future<void> signIn(SignInWith signInWith) {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }
}