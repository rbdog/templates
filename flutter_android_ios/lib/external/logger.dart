import 'package:my_app/state/notifiers/logger.dart';

import '../logger.dart';

Logger get externalLogger {
  featureLogger.layer = Layer.external_;
  return featureLogger;
}
