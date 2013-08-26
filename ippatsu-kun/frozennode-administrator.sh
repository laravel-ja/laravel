#!/bin/bash

set -e

if [ ! -d vendor/frozennode/administrator ]
then
  echo frozennode/administrator インストール開始

  # requireセクションに追加する場合（推奨）
  sed -i -e 's+"laravel/framework": "4.0.\*"+"frozennode/administrator": "dev-master",\n\t\t"laravel/framework": "4.0.*"+' composer.json

  # require-devセクションに追加する場合
  #sed -i -e 's+"phpunit/phpunit": "3.7.\*@dev",+"phpunit/phpunit": "3.7.*@dev",\n\t\t"frozennode/administrator": "dev-master",+' composer.json

  composer update

  echo 設定ファイルをコピー
  php artisan config:publish frozennode/administrator

  echo アセットをpublicディレクトリーへコピー
  php artisan asset:publish frozennode/administrator

  echo frozennode/administrator インストール終了
fi
