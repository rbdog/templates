import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_app/view/theme/fonts.dart';

/// 文字編集フィールド
class MyTextField extends HookWidget {
  const MyTextField({
    super.key,
    required this.value,
    required this.onChanged,
  });

  /// 現在の値
  final String value;

  /// コールバック 編集
  final void Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    /// Hook コントローラー
    final controller = useTextEditingController(text: value);
    if (controller.text != value) {
      // 外から変更された時は反映する
      controller.text = value;
    }

    return TextField(
      style: BrandTextStyle.bodyL,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        errorText: null,
      ),
      onChanged: onChanged,
      controller: controller,
    );
  }
}
