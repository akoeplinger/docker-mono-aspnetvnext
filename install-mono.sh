#!/bin/bash

sudo apt-get -y install curl unzip git-core build-essential autoconf libtool gettext libgdiplus libgtk2.0-0 xsltproc
cd /tmp
git clone https://github.com/mono/mono
cd /tmp/mono
git checkout d8eaf05
./autogen.sh --prefix=/usr --with-mcs-docs=no

make get-monolite-latest
make -j4
sudo make install
cd /
sudo rm -r /tmp/mono
