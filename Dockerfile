# Pythonは公式イメージ
FROM python:3.5.2

# オリジナルはJoshua Conner氏
# MAINTAINER Joshua Conner <joshua.conner@gmail.com>
# Ryosuke Kamei氏のをベースに改変
# MAINTAINER Ryosuke Kamei <sr2smail@gmail.com>
MAINTAINER Shunsuke Mazaki <shunsuke.mzk@gmail.com>

# 各ライブラリインストール
# Pythonがパッケージ依存するものもインストール
# Pythonプロフェッショナルプログラミング第2版P9より
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y 	vim \
						sudo \
						python3-dev \
						zlib1g-dev \
						libsqlite3-dev \
						libreadline6-dev \
						libgdbm-dev \
						libbz2-dev \
						tk-dev

# ユーザ作成
RUN groupadd web
RUN useradd -d /home/bottle -m bottle

# pipでインストール
# virtualenv Pythonの仮想環境構築コマンド
# bottle Pytrhonの軽量フレームワーク
# ipython Pythonのインタラクティブモード拡張
# mysql-connector 最新だとエラーなのでこのバージョン
# robobrowser スクレイピング用
RUN pip install virtualenv \
				bottle \
				ipython \
				mysql-connector==2.1.4 \
				robobrowser

# bottleのアプリケーションディレクトリをコピー
ADD ./app /home/bottle/

# ポートは8080(bottleは8080らしい)にし、サーバ起動ファイルを新しく作成した"bottle"ユーザで起動
EXPOSE 8080
# WORKDIRを指定しないとテンプレートファイルを見つけられない
WORKDIR /home/bottle/
ENTRYPOINT ["/usr/local/bin/python", "/home/bottle/index.py"]
USER bottle
