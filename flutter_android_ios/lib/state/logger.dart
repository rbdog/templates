// Project imports:
import '../logger.dart';
import 'logger/notifier.dart';

Logger get stateLogger {
  featureLogger.layer = Layer.state;
  return featureLogger;
}
