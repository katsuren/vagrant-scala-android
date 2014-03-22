#!/usr/bin/env bash

DIR_NAME=ndk-r9
if [ ! -d /usr/local/android/"$DIR_NAME" ]; then
  echo "Installing Android NDK..."
  cd /tmp
  sudo wget http://dl.google.com/android/ndk/android-"$DIR_NAME"-linux-x86_64.tar.bz2
  sudo tar -jxf /tmp/android-"$DIR_NAME"-linux-x86_64.tar.bz2 >/dev/null 2>&1
  sudo mv /tmp/android-ndk-r9 /usr/local/android/"$DIR_NAME"
  sudo ln -fs /usr/local/android/"$DIR_NAME" /usr/local/android/ndk
  sudo rm -rf /tmp/android-ndk*
else
  echo "Already installed Android NDK, skip install..."
fi

sudo chmod -R 755 /usr/local/android
