// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../logic/todo/types/status.dart';
import '../theme/images.dart';

/// ステータス画像
class StatusImage extends StatelessWidget {
  const StatusImage({
    super.key,
    required this.status,
  });

  /// ステータス
  final Status status;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case Status.todo:
        return Image.asset(
          ImageName.statusTodo.path,
        );
      case Status.doing:
        return Image.asset(
          ImageName.statusDoing.path,
        );
      case Status.done:
        return Image.asset(
          ImageName.statusDone.path,
        );
    }
  }
}
