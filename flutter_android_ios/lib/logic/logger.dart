import 'package:my_app/state/notifiers/logger.dart';

import '../logger.dart';

Logger get logicLogger {
  featureLogger.layer = Layer.logic;
  return featureLogger;
}