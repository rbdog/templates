import 'package:flutter/material.dart';

import '../../logic/todo/index.dart';
import '../theme/images.dart';

/// ステータス画像
class StatusImage extends StatelessWidget {
  const StatusImage({super.key, required this.status});

  /// ステータス
  final Status status;

  @override
  Widget build(BuildContext context) {
    final imagePath = switch (status) {
      Status.todo => ImageName.statusTodo.path,
      Status.doing => ImageName.statusDoing.path,
      Status.done => ImageName.statusDone.path,
    };
    return Image.asset(imagePath);
  }
}
