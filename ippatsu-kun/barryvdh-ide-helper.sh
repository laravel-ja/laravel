#!/bin/bash

set -e

if [ ! -d vendor/barryvdh/laravel-ide-helper ]
then
  echo  barryvdh/laravel-ide-helper インストール開始

  # requireセクションに追加の場合（推奨）
  sed -i -e 's+"laravel/framework": "4.0.\*"+"barryvdh/laravel-ide-helper": "dev-master",\n\t\t"laravel/framework": "4.0.*"+' composer.json

  # require-devセクションに追加の場合
  # sed -i -e 's+"phpunit/phpunit": "3.7.\*@dev",+"phpunit/phpunit": "3.7.*@dev",\n\t\t"barryvdh/laravel-ide-helper": "dev-master",+' composer.json

  composer update

  echo ============================================
  echo コードを生成するには、データベース環境の設定後、
  echo php artisan ide-helper:generate を実行し
  echo 生成してください。DB設定を行わなくても
  echo 生成可能ですが、一部エラーが表示されます。
  echo ============================================

  echo barryvdh/laravel-ide-helper インストール終了
fi
