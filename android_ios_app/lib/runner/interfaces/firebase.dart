import 'package:my_app/core/types/analytics_event.dart';

abstract class FirebaseService {
  Future<void> init();
  Future<void> sendEvent(AnalyticsEvent event);
}
