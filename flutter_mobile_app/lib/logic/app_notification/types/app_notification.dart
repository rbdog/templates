sealed class AppNotification {}

class TextNotification extends AppNotification {
  TextNotification({required this.text});
  final String text;
}
