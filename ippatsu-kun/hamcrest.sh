#!/bin/bash

set -e

echo Hamcrestインストール開始

if [ ! -d vendor/davedevelopment/hamcrest-php ]
then
  echo Hamcrest installing...
  sed -i -e 's+"phpunit/phpunit": "3.7.\*@dev",+"phpunit/phpunit": "3.7.*@dev",\n\t\t"davedevelopment/hamcrest-php": "dev-master",+' composer.json
  composer update
  echo Hamcrest installed.
fi

echo Hamcrestインストール終了
