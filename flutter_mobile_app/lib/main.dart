// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'ui/router/app.dart';

void main() {
  runApp(
    // riverpod のルールに従ってアプリ全体を囲む
    const ProviderScope(child: App()),
  );
}
