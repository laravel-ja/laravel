#!/bin/bash

set -e

if [ ! -d vendor/zizaco/entrust ]
then
  echo zizaco/entrust インストール開始

  # requireセクションに追加する場合（推奨）
  sed -i -e 's+"laravel/framework": "4.0.\*"+"zizaco/entrust": "dev-master",\n\t\t"laravel/framework": "4.0.*"+' composer.json

  # require-devセクションに追加する場合
  #sed -i -e 's+"phpunit/phpunit": "3.7.\*@dev",+"phpunit/phpunit": "3.7.*@dev",\n\t\t"zizaco/entrust": "dev-master",+' composer.json

  composer update

  echo 設定ファイルをコピー
  php artisan config:publish zizaco/entrust

  echo zizaco/entrust インストール終了
fi
