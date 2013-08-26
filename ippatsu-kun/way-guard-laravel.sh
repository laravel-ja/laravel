#!/bin/bash

set -e

if [ ! -d vendor/way/guard-laravel ]
then
  echo way/guard-laravel インストール開始

  # requireセクションに追加する場合（推奨）
  sed -i -e 's+"laravel/framework": "4.0.\*"+"way/guard-laravel": "dev-master",\n\t\t"laravel/framework": "4.0.*"+' composer.json

  # require-devセクションに追加する場合
  #sed -i -e 's+"phpunit/phpunit": "3.7.\*@dev",+"phpunit/phpunit": "3.7.*@dev",\n\t\t"way/guard-laravel": "dev-master",+' composer.json

  composer update

  echo way/guard-laravel インストール終了
fi
