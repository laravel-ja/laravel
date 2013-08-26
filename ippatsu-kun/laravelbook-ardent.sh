#!/bin/bash

set -e

if [ ! -d vendor/laravelbook/ardent ]
then
  echo laravelbook/ardent インストール開始

  # requireセクションに追加
  sed -i -e 's+"laravel/framework": "4.0.\*"+"laravelbook/ardent": "dev-master",\n\t\t"laravel/framework": "4.0.*"+' composer.json

  composer update

  echo laravelbook/ardent インストール終了
fi
