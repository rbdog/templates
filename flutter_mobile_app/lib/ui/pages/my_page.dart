import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../containers/user_name.dart';
import '../theme/colors.dart';

class MyPagePage extends ConsumerWidget {
  const MyPagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: BrandColor.pageBackground,
      body: Center(child: UserNameContainer()),
    );
  }
}
