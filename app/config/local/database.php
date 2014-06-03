<?php

return array(

	/*
	|--------------------------------------------------------------------------
	| データベース接続
	|--------------------------------------------------------------------------
	|
	| ここではアプリケーションのための、各データベース接続を準備します。
	| もちろん、以下のデータベースプラットフォーム毎の設定サンプルは、
	| 開発をより簡単にするため、Laravelによりサポートされています。
	|
	|
	| Laravelで動作する全てのデータベースは、PHPのPDO機能により動作しています。
	| ですから、開発を始める前に、選択したデータベースのドライバーを
	| 確実にマシーンにインストールしておいてください。
	|
	*/

	'connections' => array(

		'mysql' => array(
			'driver'    => 'mysql',
			'host'      => 'localhost',
			'database'  => 'homestead',
			'username'  => 'homestead',
			'password'  => 'secret',
			'charset'   => 'utf8',
			'collation' => 'utf8_unicode_ci',
			'prefix'    => '',
		),

		'pgsql' => array(
			'driver'   => 'pgsql',
			'host'     => 'localhost',
			'database' => 'homestead',
			'username' => 'homestead',
			'password' => 'secret',
			'charset'  => 'utf8',
			'prefix'   => '',
			'schema'   => 'public',
		),

	),

);
