#!/bin/bash

set -e

if [ ! -d vendor/loic-sharma/profiler ]
then
  echo loic-sharma/profiler インストール開始

  # requireセクションに追加する場合（推奨）
  sed -i -e 's+"laravel/framework": "4.0.\*"+"loic-sharma/profiler": "1.1.*",\n\t\t"laravel/framework": "4.0.*"+' composer.json

  # require-devセクションに追加する場合
  #sed -i -e 's+"phpunit/phpunit": "3.7.\*@dev",+"phpunit/phpunit": "3.7.*@dev",\n\t\t"loic-sharma/profiler": "1.1.*",+' composer.json

  composer update

  echo 設定ファイルをコピー
  php artisan config:publish loic-sharma/profiler

  echo loic-sharma/profiler インストール終了
fi
