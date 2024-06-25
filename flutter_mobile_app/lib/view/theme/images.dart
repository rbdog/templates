enum ImageName {
  statusTodo('status-todo.png'),
  statusDoing('status-doing.png'),
  statusDone('status-done.png');

  const ImageName(this.name);

  final String name;
  String get path => 'assets/images/$name';
}
