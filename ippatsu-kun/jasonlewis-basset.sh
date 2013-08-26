#!/bin/bash

set -e

if [ ! -d vendor/jasonlewis/basset ]
then
  echo jasonlewis/basset インストール開始

  # requireセクションに追加する場合（推奨）
  sed -i -e 's+"laravel/framework": "4.0.\*"+"jasonlewis/basset": "dev-master",\n\t\t"laravel/framework": "4.0.*"+' composer.json

  # require-devセクションに追加する場合
  #sed -i -e 's+"phpunit/phpunit": "3.7.\*@dev",+"phpunit/phpunit": "3.7.*@dev",\n\t\t"jasonlewis/basset": "dev-master",+' composer.json

  composer update

  echo jasonlewis/basset インストール終了
fi
