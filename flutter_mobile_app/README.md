# アプリ テンプレート v0.18

## for iOS & Android

[ダウンロードはこちらから](https://github.com/rbdog/templates)

> **Warning**
> まだ仮の部分が含まれています。今後大きく変更される可能性があります。

<br />

# こんにちは

✅ このアプリには以下のテンプレートがセットアップ済みです。

- アプリアップデートのお知らせ
- アプリメンテナンスのお知らせ
- サインイン / サインアウト機能
- 通知を受け取る
- データベース接続
- 開発用のログ収集
- マーケティング用のデータ収集
- 英語その他の言語

<br />

✅ アプリ実行前にプロジェクト直下で以下のコマンドを実行してください. `scripts/l10n` フォルダ内にある多言語翻訳が適用されます.

```sh
flutter pub run

flutter gen-l10n --arb-dir=scripts/l10n
```

<br />

# 設計

✅ できるだけシンプルに必要最低限で、実務に耐えられる構成を目指しています
✅ オニオンアーキテクチャと DDD 設計 を簡易化したものです

![image](https://github.com/rbdog/templates/blob/main/docs/static/images/minimal-archit.png?raw=true)

- `view`: ... `presentation` を簡易化
- `logic`: ... `domain` を簡易化
- `state`: ... `application` を簡易化
- `external`: ... `infrastructure` を簡易化

<br />

✅ 質問は以下までどうぞ

- [X (旧 Twitter) Rubydog](https://x.com/rubydog_jp)

<br />

✅ 検索キーワード

`go_router`, `firebase`, `認証`, `アナリティクス`, `Firestore`, `riverpod`, `アップデート`, `メンテナンス`, `l10n`,
