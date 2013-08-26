#!/bin/bash

set -e

if [ ! -d vendor/zizaco/confide ]
then
  echo zizaco/confide インストール開始

  # requireセクションに追加する場合（推奨）
  sed -i -e 's+"laravel/framework": "4.0.\*"+"zizaco/confide": "1.0.x",\n\t\t"laravel/framework": "4.0.*"+' composer.json

  # require-devセクションに追加する場合
  #sed -i -e 's+"phpunit/phpunit": "3.7.\*@dev",+"phpunit/phpunit": "3.7.*@dev",\n\t\t"zizaco/confide": "1.0.x",+' composer.json

  composer update

  echo zizaco/confide インストール終了
fi
