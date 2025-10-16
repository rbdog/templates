import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/example/index.dart';
import 'example_record.dart';

final exampleRecordProvider =
    AutoDisposeNotifierProvider<ExampleRecordNotifier, ExampleRecord>(() {
      return ExampleRecordNotifier();
    });
