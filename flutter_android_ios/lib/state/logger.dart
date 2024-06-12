import 'package:my_app/state/notifiers/logger.dart';

import '../logger.dart';

Logger get stateLogger {
  featureLogger.layer = Layer.state;
  return featureLogger;
}
