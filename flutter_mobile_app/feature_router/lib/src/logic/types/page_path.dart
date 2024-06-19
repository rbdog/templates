/// 画面ID
enum PageId {
  home,
  signIn,
  edit,
}

/// 画面パス
extension PagePath on PageId {
  String get path => switch (this) {
        PageId.home => '/',
        PageId.signIn => '/sign-in',
        PageId.edit => '/:id/edit',
      };
}
