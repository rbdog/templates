// Project imports:
import '../logger.dart';
import '../state/logger/notifier.dart';

Logger get viewLogger {
  featureLogger.layer = Layer.view;
  return featureLogger;
}
