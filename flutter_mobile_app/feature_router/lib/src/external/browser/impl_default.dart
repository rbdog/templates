import 'interface.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

class DefaultBrowser implements Browser {
  @override
  void setPathUrlStrategy() {
    usePathUrlStrategy();
    GoRouter.optionURLReflectsImperativeAPIs = true;
  }
}
