// Project imports:
import '../logger.dart';
import '../state/logger/notifier.dart';

Logger get logicLogger {
  featureLogger.layer = Layer.logic;
  return featureLogger;
}
