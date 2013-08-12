#!/bin/bash

if [ ! -d vendor/cartalyst/sentry ]
then
  echo cartalyst/sentry installing...

  # requireセクションに追加
  sed -i -e 's+"laravel/framework": "4.0.\*"+"cartalyst/sentry": "2.0.*",\n\t\t"laravel/framework": "4.0.*"+' composer.json

  composer update

  # app.phpの書き換え
  sed -i -e "s+'Illuminate\\\\Workbench\\\\WorkbenchServiceProvider',+'Illuminate\\\\Workbench\\\\WorkbenchServiceProvider',\\n\\t\\t'Cartalyst\\\\Sentry\\\\SentryServiceProvider',+" app/config/app.php

  sed -i -e "s+'Illuminate\\\\Support\\\\Facades\\\\View',+'Illuminate\\\\Support\\\\Facades\\\\View',\\n\\t\\t'Sentry' => 'Cartalyst\\\\Sentry\\\\Facades\\\\Laravel\\\\Sentry',+" app/config/app.php

  echo ==============================================
  echo sentryのデフォルトマイグレーションを行うには、
  echo データベースの設定を済ませた後で、
  echo php artisan migrate --package=cartalyst/sentry
  echo を実行してください。
  echo ==============================================

  echo cartalyst/sentry installed.
fi
