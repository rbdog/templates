import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseEffectView extends HookWidget {
  const UseEffectView({
    super.key,
    required this.onAppear,
    required this.child,
  });

  final VoidCallback onAppear;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      onAppear();
      return null;
    }, const []);
    return child;
  }
}
