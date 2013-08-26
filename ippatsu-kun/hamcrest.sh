#!/bin/bash

set -e

if [ ! -d vendor/davedevelopment/hamcrest-php ]
then
 echo Hamcrestインストール開始

  sed -i -e 's+"phpunit/phpunit": "3.7.\*@dev",+"phpunit/phpunit": "3.7.*@dev",\n\t\t"davedevelopment/hamcrest-php": "dev-master",+' composer.json
  composer update
  
  echo Hamcrestインストール終了
fi

