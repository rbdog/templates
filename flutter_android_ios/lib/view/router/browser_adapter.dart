import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/state/providers/debug_event.dart';

/// デバッグ用 Widget
/// ブラウザでもスマホのような画面比率で表示する
class BrowserDebugView extends ConsumerWidget {
  const BrowserDebugView({
    super.key,
    required this.child,
    this.aspectRatio = 9.0 / 16.0,
  });

  final Widget? child;
  final double aspectRatio;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kIsWeb) {
      return Scaffold(
        backgroundColor: Colors.grey,
        body: CallbackShortcuts(
          bindings: {
            const SingleActivator(LogicalKeyboardKey.digit0, meta: true): () {
              ref.read(debugEventProvider.notifier).onEvent(0);
            },
            const SingleActivator(LogicalKeyboardKey.digit1, meta: true): () {
              ref.read(debugEventProvider.notifier).onEvent(1);
            },
            const SingleActivator(LogicalKeyboardKey.digit2, meta: true): () {
              ref.read(debugEventProvider.notifier).onEvent(2);
            },
            const SingleActivator(LogicalKeyboardKey.digit3, meta: true): () {
              ref.read(debugEventProvider.notifier).onEvent(3);
            },
            const SingleActivator(LogicalKeyboardKey.digit4, meta: true): () {
              ref.read(debugEventProvider.notifier).onEvent(4);
            },
            const SingleActivator(LogicalKeyboardKey.digit5, meta: true): () {
              ref.read(debugEventProvider.notifier).onEvent(5);
            },
            const SingleActivator(LogicalKeyboardKey.digit6, meta: true): () {
              ref.read(debugEventProvider.notifier).onEvent(6);
            },
            const SingleActivator(LogicalKeyboardKey.digit7, meta: true): () {
              ref.read(debugEventProvider.notifier).onEvent(7);
            },
            const SingleActivator(LogicalKeyboardKey.digit8, meta: true): () {
              ref.read(debugEventProvider.notifier).onEvent(8);
            },
            const SingleActivator(LogicalKeyboardKey.digit9, meta: true): () {
              ref.read(debugEventProvider.notifier).onEvent(9);
            },
          },
          child: Focus(
            child: Center(
              child: AspectRatio(
                aspectRatio: aspectRatio,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 5,
                    ),
                  ),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      );
    }
    // Web以外のときは何もしない
    return child ?? const SizedBox.shrink();
  }
}
