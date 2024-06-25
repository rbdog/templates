// Project imports:
import '../logger.dart';
import '../state/logger/models.dart';
import '../state/logger/notifier.dart';

Logger get viewLogger {
  buildModeLogger.layer = Layer.view;
  return buildModeLogger;
}
