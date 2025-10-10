sealed class AppMaintAnnounce {}

class AppMaintAnnounceNone extends AppMaintAnnounce {}

class AppMaintAnnounceSoon extends AppMaintAnnounce {
  AppMaintAnnounceSoon({
    required this.startAt,
    required this.endAt,
  });
  final DateTime startAt;
  final DateTime endAt;
}

class AppMaintAnnounceInProgress extends AppMaintAnnounce {
  AppMaintAnnounceInProgress({
    required this.startAt,
    required this.endAt,
  });
  final DateTime startAt;
  final DateTime endAt;
}
