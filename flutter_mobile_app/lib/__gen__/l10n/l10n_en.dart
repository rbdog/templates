// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get hello => 'Hello';

  @override
  String get statusTodo => 'Todo';

  @override
  String get statusDoing => 'Doing';

  @override
  String get statusDone => 'Done';

  @override
  String get edit => 'Edit';

  @override
  String get createNew => 'Create new';

  @override
  String get delete => 'Delete';

  @override
  String get save => 'Save';

  @override
  String get ok => 'OK';

  @override
  String get textIsTooLong => 'Text is Too Long';
}
