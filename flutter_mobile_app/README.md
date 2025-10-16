# アプリ テンプレート for Android, iOS

## Ver.0.20

[ダウンロードはこちら](https://github.com/rbdog/templates)

> まだ仮の部分が含まれます。今後大きく変更される可能性があります。


<br />

## 含まれるもの

- ✅ アップデートのお知らせ
- ✅ メンテナンスのお知らせ
- ✅ サインイン / サインアウト (Firebase Auth)
- ✅ 通知を受け取る
- ✅ データベース接続 (Cloud Firestore)
- ✅ 開発用のログ収集 (コンソール)
- ✅ マーケティング用のデータ収集 (Firebase Analytics)
- ✅ 英語その他の言語

<br />

## セットアップ

アプリ実行前にプロジェクト直下で以下のコマンドを実行してください. `scripts/l10n` フォルダ内にある多言語翻訳が適用されます.

```sh
flutter gen-l10n
```

<br />

## 説明

✅ 一般的な クリーンアーキテクチャ 及び DDD 設計 を実務に耐えられる最小限まで極力簡易化したテンプレートです

- `adapter`: ... `infrastructure` を簡易化
- `logic`: ... `domain` を簡易化
- `state`: ... `application` を簡易化
- `ui`: ... `presentation` を簡易化

![image](https://github.com/rbdog/templates/blob/main/docs/static/images/nano-archit.png?raw=true)

<br />

## サポート

✅ 質問は以下までどうぞ

- [X (旧 Twitter) Rubydog](https://x.com/rubydog_jp)

<br />

## 検索用キーワード

`go_router`, `firebase`, `認証`, `アナリティクス`, `Firestore`, `riverpod`, `アップデート`, `メンテナンス`, `l10n`,
