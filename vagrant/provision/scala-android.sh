#!/usr/bin/env bash

cd /tmp

# maven
echo "Installing maven..."

TARGET="apache-maven-3.2.1"
if [ ! -d /usr/local/"$TARGET" ]; then
  sudo wget http://ftp.riken.jp/net/apache/maven/maven-3/3.2.1/binaries/"$TARGET"-bin.tar.gz
  sudo tar zxf "$TARGET"-bin.tar.gz
  sudo mv /tmp/"$TARGET" /usr/local/"$TARGET"
  sudo ln -fs /usr/local/"$TARGET"/bin/mvn /usr/local/bin/mvn
  sudo rm -rf "$TARGET"-bin.tar.gz
else
  echo "Already insalled maven, skip install..."
fi

# giter8
echo "Installing giter8..."

if [ ! `which g8` ]; then
  sudo curl https://raw.github.com/n8han/conscript/master/setup.sh | sudo sh
  sudo ~/bin/cs n8han/giter8
  sudo ln -fs ~/bin/cs /usr/local/bin/cs
  sudo ln -fs ~/bin/g8 /usr/local/bin/g8
else
  echo "Already insalled giter8, skip install..."
fi


