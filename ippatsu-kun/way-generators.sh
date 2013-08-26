#!/bin/bash

set -e

if [ ! -d vendor/way/generators ]
then
  echo Way/generators インストール開始

  # requireセクションに追加する場合（推奨）
  sed -i -e 's+"laravel/framework": "4.0.\*"+"way/generators": "1.0.*@dev",\n\t\t"laravel/framework": "4.0.*"+' composer.json

  # require-devセクションに追加する場合
  # sed -i -e 's+"phpunit/phpunit": "3.7.\*@dev",+"phpunit/phpunit": "3.7.*@dev",\n\t\t"way/generators": "1.0.*@dev",+' composer.json

  composer update

  echo Way/generators　インストール終了
fi
