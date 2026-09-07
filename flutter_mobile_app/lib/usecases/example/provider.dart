import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/example/index.dart';
import 'example_record.dart';

final exampleRecordProvider =
    NotifierProvider.autoDispose<ExampleRecordNotifier, ExampleRecord>(() {
      return ExampleRecordNotifier();
    });
