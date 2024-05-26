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
        PageId.edit => '/edit/:id',
      };
}

/// 画面名
extension PageName on PageId {
  String get routeName => switch (this) {
        PageId.home => 'home',
        PageId.splash => 'splash',
        PageId.signIn => 'signIn',
        PageId.edit => 'edit',
      };
}
