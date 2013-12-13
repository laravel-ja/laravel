# Laravelアップグレードガイド

## 4.0から4.1へのアップグレード

- `composer.json`のrequireセクションを`"laravel/framework": "4.1.*"`へ更新する。
- `bootstrap/start.php`ファイルの`redirectIfTrailingSlash`呼び出しを削除する。
- `/public/index.php`を[この内容](https://github.com/laravel/laravel/blob/develop/public/index.php)に更新する。続いて`/artisan`を[この内容](https://github.com/laravel/laravel/blob/develop/artisan)へ変更する。
- 新しいファイル`app/config/remote.php`を[ここから](https://github.com/laravel/laravel/blob/develop/app/config/remote.php)取得する。
- [ここを参照し](https://github.com/laravel/laravel/blob/develop/app/config/session.php)、`session`設定ファイルへ、新しい`expire_on_close`と`secure`オプションを追加する。
- [ここを参照し](https://github.com/laravel/laravel/blob/develop/app/config/queue.php)、`queue`設定ファルへ、新しい`failed`キュージョブオプションを追加する。
- `app/config/database.php`を開き、`redis.cluster`オプションを`false`にし、デフォルトではRedisクラスタリングを行わないように変更する。
- `app/config/view.php`を開き、`pagination`オプションをデフォルトのペジネーションビューとしてbootstrap 3を使用する。（オプション、必ず変更する必要はない）
- `app/config/app.php`を開き、`aliases`と`providers`配列を[このコード](https://github.com/laravel/laravel/blob/develop/app/config/app.php)と合わせる。
  - `aliases`配列の中の、`'Controller' => 'Illuminate\Routing\Controllers\Controller',`で、
  `Illuminate\Routing\Controller`を使用するように変更する。
  - `providers`配列の中へ、`'Illuminate\Remote\RemoteServiceProvider',`を追加する。
  - `aliases`配列へ、`'SSH' => 'Illuminate\Support\Facades\SSH',`を追加する。
- もしも`app/controllers/BaseController.php`の最初で、`use Illuminate\Routing\Controllers\Controller;`を使用していたら、`use Illuminate\Routing\Controller;`へ変更する。また、自分でもとのクラスをuseで使用していたり、クラスエリアスを登録していたら、それらも削除する。
- コントローラーの中で`missingMethod`をオーバーライドしていたら、最初の引数として`$method`を追加する。
- パスワードのリセットシステムは開発者が自由に変更できるように調整された。`auth:reminders-controller` Artisanコマンドを実行することで生成されるスタブコントローラーを確認すること。
- [ここを参照し](https://github.com/laravel/laravel/blob/master/app/lang/en/reminders.php)、`reminders.php`言語ファイルを更新する。
- もし、bootstrap/start.phpファイルの中で、http hostsを$env変数をセットするために使用しているのであれば、PHPのgethostname()関数が返すマシーン名に変更するべきである。

最後に、

- `composer update`を実行する
