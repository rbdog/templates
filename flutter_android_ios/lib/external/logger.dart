// Project imports:
import '../state/notifiers/logger.dart';
import '../logger.dart';

Logger get externalLogger {
  featureLogger.layer = Layer.external_;
  return featureLogger;
}
