#!/bin/bash

set -e

echo Codeceptionインストール開始

if [ ! -d vendor/codeception ]
then
  echo Codeception installing...
  sed -i -e 's+"phpunit/phpunit": "3.7.\*@dev",+"phpunit/phpunit": "3.7.*@dev",\n\t\t"codeception/codeception": "dev-master",+' composer.json
  composer update
  echo Codeception installed.
fi

echo Codeceptionインストール終了
