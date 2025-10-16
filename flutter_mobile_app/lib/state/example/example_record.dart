import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/example/index.dart';

class ExampleRecordNotifier extends AutoDisposeNotifier<ExampleRecord> {
  @override
  ExampleRecord build() {
    return ExampleRecord(exampleField: '初期状態');
  }
}
