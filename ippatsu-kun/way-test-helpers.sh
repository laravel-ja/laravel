#!/bin/bash

set -e

if [ ! -d vendor/way/laravel-test-helpers ]
then
  echo way/laravel-test-helpers インストール開始

  # requireセクションに追加
  sed -i -e 's+"laravel/framework": "4.0.\*"+"way/laravel-test-helpers": "dev-master",\n\t\t"laravel/framework": "4.0.*"+' composer.json

  composer update

  echo way/laravel-test-helpers インストール終了
fi
