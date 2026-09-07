# アプリ テンプレート for Android, iOS

## Ver.0.21

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

✅ ports & adapters (ヘキサゴナルアーキテクチャ) で組んだテンプレートです

![image](https://github.com/rbdog/templates/blob/main/docs/architecture/mobile-app.svg?raw=true)

- `ui`: 相手からのアクセス (依存) に応答する側
- `adapters`: こちらからアクセス (依存) する側。port の実装
- `usecases`: アプリの操作単位
- `ports`: usecases から見える唯一の外界。abstract interface
- `domain`: 型と純粋関数のみ。全レイヤーから依存される
- `di.dart`: 起動時に adapter を port へ注入する

依存は `ui → usecases → ports` の一方向。`domain` は他のどこにも依存しません。
向きが守られているかは以下で検査できます。

```sh
python3 scripts/check_layers.py
```

<br />

## サポート

✅ 質問は以下までどうぞ

- [X (旧 Twitter) Rubydog](https://x.com/rubydog_jp)

<br />

## 検索用キーワード

`go_router`, `firebase`, `認証`, `アナリティクス`, `Firestore`, `riverpod`, `アップデート`, `メンテナンス`, `l10n`,
