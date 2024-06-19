// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:feature_router/feature_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'view/router/app.dart';

void main() {
  router.initUrlStrategy();
  runApp(
    // riverpod のルールに従ってアプリ全体を囲む
    const ProviderScope(
      child: App(),
    ),
  );
}
