// Project imports:
import '../logger.dart';
import '../state/logger/notifier.dart';

Logger get externalLogger {
  featureLogger.layer = Layer.external_;
  return featureLogger;
}
