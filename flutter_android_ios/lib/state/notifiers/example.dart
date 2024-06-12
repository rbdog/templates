// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Example
class ExampleNotifier extends Notifier<String> {
  @override
  String build() {
    return '初期状態';
  }
}
