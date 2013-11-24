# Laravelアップグレードガイド

## 4.0から4.1へのアップグレード

- composer.json中のlaravel/frameworkのバージョンを4.0から4.1へ更新し、`composer update`を実行する。
- `public/index.php`と`artisan.php`を新しいバージョンのものに置き換える。
- `session`設定ファイルに、新しい`expire_on_close`オプションを追加する。
- `bootstrap/start.php`ファイル中の`redirectIfTrailingSlash`の呼び出しを削除する。
- `app/config/app.php`ファイルを開き、`aliases`配列中の`Controller => 'Illuminate\Routing\Controllers\Controller',`を
  `Illuminate\Routing\Controller`を使用するように書き換える。
- `app/controllers/BaseController.php`を開き、`use Illuminate\Routing\Controllers\Controller;`を`use Illuminate\Routing\Controller;`へ変更する
`
- `app/config/app.php`を開き、`providers`配列へ、`'Illuminate\Remote\RemoteServiceProvider',`を追加する。
- `app/config/app.php`を開き、`aliases`配列に`'SSH' => 'Illuminate\Support\Facades\SSH',`を追加する

- あなたのコントローラー中で`missingMethod`をオーバーライドしているなら、最初の引数として、$methodを追加する。
- パスワードリマンダーシステムは開発者がより自由に変更できるよう改良された。`auth:reminders-controller` Artisanコマンドを実行し、作成されるスタブコントローラーの中身を確認すること。
- `reminders.php`言語ファイルを更新する。
