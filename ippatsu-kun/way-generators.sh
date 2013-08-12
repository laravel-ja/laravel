#!/bin/bash

if [ ! -d vendor/way/generators ]
then
  echo Way/generators installing...

  # requireセクションに追加
  sed -i -e 's+"laravel/framework": "4.0.\*"+"way/generators": "1.0.*@dev",\n\t\t"laravel/framework": "4.0.*"+' composer.json
  # require-devセクションに追加
  # sed -i -e 's+"phpunit/phpunit": "3.7.\*@dev",+"phpunit/phpunit": "3.7.*@dev",\n\t\t"way/generators": "1.0.*@dev",+' composer.json

  composer update

  # app.phpの書き換え
  sed -i -e "s+'Illuminate\\\\Workbench\\\\WorkbenchServiceProvider',+'Illuminate\\\\Workbench\\\\WorkbenchServiceProvider',\\n\\t\\t'Way\\\\Generators\\\\GeneratorsServiceProvider',+" app/config/app.php

  echo Way/generators installed.
fi
