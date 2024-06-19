// Project imports:
import '../logger.dart';
import 'logger/models.dart';
import 'logger/notifier.dart';

Logger get stateLogger {
  buildModeLogger.layer = Layer.state;
  return buildModeLogger;
}
