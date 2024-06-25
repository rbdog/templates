sealed class MyNotification {}

class TextOnlyNotification extends MyNotification {
  TextOnlyNotification({
    required this.text,
  });
  final String text;
}
