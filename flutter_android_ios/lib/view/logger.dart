import 'package:my_app/state/notifiers/logger.dart';

import '../logger.dart';

Logger get viewLogger {
  featureLogger.layer = Layer.view;
  return featureLogger;
}
