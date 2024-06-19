import 'package:flutter/foundation.dart';

import '../../external/browser/provider.dart';

class Router {
  void initUrlStrategy() {
    if (kIsWeb) {
      browser.setPathUrlStrategy();
    }
  }
}
