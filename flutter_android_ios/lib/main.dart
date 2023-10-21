import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/view/router/app.dart';

void main() {
  runApp(
    // riverpod のルールに従ってアプリ全体を囲む
    const ProviderScope(
      child: App(),
    ),
  );
}
