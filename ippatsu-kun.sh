#!/bin/bash

#
# Laravel4向けパッケージインストールヘルパー
#
# 実行にはbashが必要です。Linux/Unix向けです。
#
# PHPunitとMockeryは必ずインストールされます。
# その他のインストールしたいパッケージ名の
# "sh ippatu-kun/...."の行をアンコメントしてください。
#
# 実行法：
#   sh ./ippatu-kun.sh
#
# 注意：実行後、関連ファイルを削除します。
# 取っておきたい場合は、最後にある２つのrmコマンドを
# 削除してください。


if [ ! -f composer.lock ]
then
  composer install
fi



# require-divセクション追加
# PHPUnit,Mockeryインストール

grep '"require\-dev"' composer.json > /dev/null

if [ "$?" -eq 1 ]
then
  sed -i -e 's+\t"autoload":+\t"require-dev": {\n\t\t"phpunit/phpunit": "3.7.*@dev",\n\t\t"mockery/mockery": "dev-master"\n\t},\n\t"autoload":+' composer.json
  composer update
fi


# テスト関連パッケージ

# Codeseption BDDスタイルテストフレームワーク
# sh ippatsu-kun/codeception.sh

# Mamcrest マッチャー(matcher)
# sh ippatsu-kun/hamcrest.sh


# ツール

# Juy Profiler セッション単位のプロファイラー
# sh ippatsu-kun/juy-profiler.sh

# Way Generators Laravel4向けコードジェネレーター
# sh ippatsu-kun/way-generators.sh

# Barryvdh IDEヘルパー IDE/エディターコード補完コード生成
# sh ippatsu-kun/barryvdh-ide-helper.sh



# 後片付け

# このシェルとスクリプト保存ディレクトリーippatsu-kunは
# 自動的に消去されます。

rm -R ippatsu-kun
rm ippatsu-kun.sh


