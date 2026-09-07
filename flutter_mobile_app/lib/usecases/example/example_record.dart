import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/example/index.dart';

class ExampleRecordNotifier extends Notifier<ExampleRecord> {
  @override
  ExampleRecord build() {
    return ExampleRecord(exampleField: '初期状態');
  }
}
