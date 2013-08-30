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
# 取っておきたい場合は、最後にあるrmコマンドを
# 削除してください。


# コマンド失敗の場合、終了させる

set -e


# インストール未実行ならば、先ずインストールする

if [ ! -f composer.lock ]
then
  echo Laravelインストール開始
  composer install
  echo Laravelインストール終了

  echo app/storage下のパーミッション設定（o+w）
  chmod -R o+w app/storage
fi

echo 自動登録パッケージのPrepperを有効に設定
vendor/bin/prepper-start.sh


# require-divセクション追加

set +e
grep '"require\-dev"' composer.json > /dev/null

if [ "$?" -eq 1 ]
then
  set -e
  echo PHPUnit、Mockeryインストール開始
  sed -i -e 's+\t"autoload":+\t"require-dev": {\n\t\t"phpunit/phpunit": "3.7.*@dev",\n\t\t"mockery/mockery": "dev-master"\n\t},\n\t"autoload":+' composer.json
  composer update
  echo PHPUnit、Mockeryインストール終了
fi

set -e


# < テスト関連パッケージ >

# Codeseption BDDスタイルテストフレームワーク
# sh ippatsu-kun/codeception.sh

# Mamcrest マッチャー(matcher)
# sh ippatsu-kun/hamcrest.sh

# way laravel-test-helpers ユニットテストヘルパー
# sh ippatsu-kun/way-test-helpers.sh



# < ツール >

# juy profiler セッション単位のプロファイラー
# sh ippatsu-kun/juy-profiler.sh

# loic-sharma profiler セッション単位のプロファイラー
# sh ippatsu-kun/loic-sharma-profiler.sh

# 注意！
# 二つのプロファイラーを同時にインストールすると、
# 正しく動作しません。機能的にはjuy profilerをおすすめします。

# way generators Laravel4向けコードジェネレーター
# sh ippatsu-kun/way-generators.sh

# way guard-laravel 自動テスト、自動コンパイルなど
# sh ippatsu-kun/way-guard-laravel.sh

# barryvdh IDEヘルパー IDE/エディターコード補完用コード生成
# sh ippatsu-kun/barryvdh-ide-helper.sh



# < 認証パッケージ >

# 複数の認証パッケージを一度に利用しないほうがよろしいでしょう。
# ただし、zizaco氏のconfideとentrustは異なる機能の
# パッケージで、２つ同時に使用したほうが本領を発揮します。

# cartalyst sentry 一番人気の認証パッケージ
# sh ippatsu-kun/cartalyst-sentry.sh

# zizaco confide Laravelライクな記述の認証パッケージ
# sh ippatsu-kun/zizaco-confide.sh

# zizaco entrust ロールベースな許可制御パッケージ　PHP5.4以上必要
# sh ippatsu-kun/zizaco-entrust.sh



# < Eloquent強化パッケージ >

# laravelbook　ardent ORMに自己バリデーション機能を追加
# sh ippatsu-kun/laravelbook-ardent.sh

# frozennode administrator モデルの管理画面
# sh ippatsu-kun/frozennode-administrator.sh



# < アセット管理 >

# jasonlewis basset アセット管理
# sh ippatsu-kun/jasonlewis-basset.sh



# 後片付け

# このシェルとスクリプト保存ディレクトリーippatsu-kunは
# 自動的に消去されます。

echo ippatsu-kun関連ファイル削除
rm -R ippatsu-kun
rm ippatsu-kun.sh


