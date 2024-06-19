/// 画面ID
enum PageId {
  home('/'),
  signIn('/sign-in'),
  edit('/:id/edit');

  const PageId(this.path);
  final String path;
}
