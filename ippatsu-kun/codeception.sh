#!/bin/bash

set -e

if [ ! -d vendor/codeception ]
then
  echo Codeceptionインストール開始

  sed -i -e 's+"phpunit/phpunit": "3.7.\*@dev",+"phpunit/phpunit": "3.7.*@dev",\n\t\t"codeception/codeception": "dev-master",+' composer.json
  composer update

  echo Codeceptionインストール終了
fi

