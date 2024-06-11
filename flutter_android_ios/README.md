# アプリ テンプレート v0.6

## for iOS & Android

[ダウンロードはこちらから](https://github.com/rbdog/templates)

> **Warning**
> まだ仮の部分が含まれています。今後大きく変更される可能性があります。

<br />

# こんにちは

✅ このアプリには以下のテンプレートがセットアップ済みです。

- 多言語対応 「英語」「日本語」
- サインイン / サインアウト機能
- アプリアップデートのお知らせ
- アプリ起動時の初期化
- 画面の移動サンプル
- 状態管理
- データベース接続
- 実機が不要なブラウザでのデバッグ実行

実際に通信はしないようにダミーとなっておりますので、各自で書き換えて使ってください。(通信クラスは `external` フォルダの中。 詳細は以下の設計へ)

<br />

✅ アプリ実行前にプロジェクト直下で以下のコマンドを実行してください. `scripts/l10n` フォルダ内にある多言語翻訳が適用されます.

```sh
flutter gen-l10n --arb-dir=scripts/l10n
```

<br />

✅ **必要な準備はこれだけです**

<br />
<br />
<br />

# 設計

✅ できるだけシンプルに必要最低限で、実務に耐えられる構成を目指しています。
✅ オニオンアーキテクチャと DDD 設計 を簡易化して採用しています

![image](https://github.com/rbdog/templates/blob/main/docs/static/images/minimal-archit.png?raw=true)

- `view`: ... `presentation` を簡易化
- `logic`: ... `domain` を簡易化
- `state`: ... `application` を簡易化
- `external`: ... `infrastructure` を簡易化

<br />

✅ 質問は以下までお願いします。気軽にどうぞ！

- [X (旧 Twitter) ルビー Dog](https://twitter.com/rubydog725)

<br />

✅ その他キーワード

`go_router`, `firebase`, `認証`, `アナリティクス`, `Firestore`, `riverpod`, `アップデート`, `l10n`,
