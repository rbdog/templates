import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ui/router/app.dart';

void main() {
  runApp(
    // riverpod で状態管理
    const ProviderScope(child: App()),
  );
}
