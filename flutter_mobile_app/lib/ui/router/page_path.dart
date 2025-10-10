/// 画面ID
enum PagePath {
  home('/'),
  signIn('/sign-in'),
  todoList('/todos'),
  todoEdit('/todos/:id/edit');

  const PagePath(this.path);
  final String path;
}
