#!/bin/bash

if [ ! -d vendor/barryvdh/laravel-ide-helper ]
then
  echo  installing barryvdh/laravel-ide-helper...

  # requireセクションに追加
  sed -i -e 's+"laravel/framework": "4.0.\*"+"barryvdh/laravel-ide-helper": "dev-master",\n\t\t"laravel/framework": "4.0.*"+' composer.json
  # require-devセクションに追加
  # sed -i -e 's+"phpunit/phpunit": "3.7.\*@dev",+"phpunit/phpunit": "3.7.*@dev",\n\t\t"barryvdh/laravel-ide-helper": "dev-master",+' composer.json

  composer update

  # app.phpの書き換え
  sed -i -e "s+'Illuminate\\\\Workbench\\\\WorkbenchServiceProvider',+'Illuminate\\\\Workbench\\\\WorkbenchServiceProvider',\\n\\t\\t'Barryvdh\\\\LaravelIdeHelper\\\\IdeHelperServiceProvider',+" app/config/app.php

  echo データベース環境の設定後、
  echo php artisan ide-helper:generate を実行して
  echo コードを生成してください。

  echo barryvdh/laravel-ide-helper installed.
fi
