#!/bin/bash

if [ ! -d vendor/juy/profiler ]
then
  echo Juy/profiler installing...

  # requireセクションに追加
  sed -i -e 's+"laravel/framework": "4.0.\*"+"juy/profiler": "dev-master",\n\t\t"laravel/framework": "4.0.*"+' composer.json
  # require-devセクションに追加
  #sed -i -e 's+"phpunit/phpunit": "3.7.\*@dev",+"phpunit/phpunit": "3.7.*@dev",\n\t\t"juy/profiler": "dev-master",+' composer.json

  composer update

  # app.phpの書き換え
  sed -i -e "s+'Illuminate\\\\Workbench\\\\WorkbenchServiceProvider',+'Illuminate\\\\Workbench\\\\WorkbenchServiceProvider',\\n\\t\\t'Juy\\\\Profiler\\\\Providers\\\\ProfilerServiceProvider',+" app/config/app.php

  sed -i -e "s+'Illuminate\\\\Support\\\\Facades\\\\View',+'Illuminate\\\\Support\\\\Facades\\\\View',\\n\\t\\t'Profiler' => 'Juy\\\\Profiler\\\\Facades\\\\Profiler',+" app/config/app.php

  # 設定ファイルをコピー
  php artisan config:publish juy/profiler

  echo Juy/profiler installed.
fi
