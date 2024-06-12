/// 画面ID
enum PageId {
  home,
  splash,
  signIn,
  edit,
}

/// 画面パス
extension PagePath on PageId {
  String get path => switch (this) {
        PageId.home => '/',
        PageId.splash => '/splash',
        PageId.signIn => '/sign-in',
        PageId.edit => '/:id/edit',
      };
}
