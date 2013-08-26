#!/bin/bash

set -e

if [ ! -d vendor/cartalyst/sentry ]
then
  echo cartalyst/sentry インストール開始

  # requireセクションに追加
  sed -i -e 's+"laravel/framework": "4.0.\*"+"cartalyst/sentry": "2.0.*",\n\t\t"laravel/framework": "4.0.*"+' composer.json

  composer update

  echo ==============================================
  echo sentryのデフォルトマイグレーションを行うには、
  echo データベースの設定を済ませた後で、
  echo php artisan migrate --package=cartalyst/sentry
  echo を実行してください。
  echo ==============================================

  echo cartalyst/sentry インストール終了
fi
