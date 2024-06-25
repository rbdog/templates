// Project imports:
import '../logger.dart';
import '../state/logger/models.dart';
import '../state/logger/notifier.dart';

Logger get externalLogger {
  buildModeLogger.layer = Layer.external_;
  return buildModeLogger;
}
