// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get hello => 'こんにちは';

  @override
  String get statusTodo => '予定';

  @override
  String get statusDoing => '進行中';

  @override
  String get statusDone => '完了';

  @override
  String get edit => '編集';

  @override
  String get createNew => '新規作成';

  @override
  String get delete => '削除';

  @override
  String get save => '保存';

  @override
  String get ok => 'OK';

  @override
  String get textIsTooLong => '入力文字が長すぎます';
}
