// Project imports:
import '../logger.dart';
import '../state/logger/models.dart';
import '../state/logger/notifier.dart';

Logger get logicLogger {
  buildModeLogger.layer = Layer.logic;
  return buildModeLogger;
}
