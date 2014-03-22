#!/usr/bin/env bash

echo "Installing Android SDK ..."

cd /tmp

#---------------------------
# for SDK only ...
#---------------------------
# This recipe is not full automation.
# I could not sdk update to install platform-tools because of license agreement.
# If use this recipe, you should run commands below.
#   vagrant ssh
#   sudo su
#   android update sdk --no-ui -s -t platform-tools,android-19,extra-android-support
# And this command doesn't include build-tool, so I didn't use aapt.
# Because the provision commented out. Use adt-bundle.

# DIR_NAME="r22.6.1"
# if [ ! -d /usr/local/android/"$DIR_NAME" ]; then
#   sudo wget http://dl.google.com/android/android-sdk_"$DIR_NAME"-linux.tgz
#   sudo tar zxf /tmp/android-sdk_"$DIR_NAME"-linux.tgz >/dev/null 2>&1
#   sudo chown -R root:root /tmp/android-sdk-linux
#   sudo mkdir -p /usr/local/android
#   sudo mv /tmp/android-sdk-linux /usr/local/android/"$DIR_NAME"
#   sudo ln -fs /usr/local/android/"$DIR_NAME" /usr/local/android/sdk
#   sudo rm -rf rm android-sdk*
# else
#   echo "Already installed Android SDK, skip install..."
# fi


#---------------------------
# for adt-bundle
#---------------------------

DIR_NAME=20131030
if [ ! -d /usr/local/android/"$DIR_NAME" ]; then
  sudo wget http://dl.google.com/android/adt/adt-bundle-linux-x86_64-"$DIR_NAME".zip
  sudo unzip /tmp/adt-bundle-linux-x86_64-"$DIR_NAME".zip >/dev/null 2>&1
  sudo mkdir -p /usr/local/android
  sudo mv /tmp/adt-bundle-linux-x86_64-"$DIR_NAME" /usr/local/android/"$DIR_NAME"
  sudo rm -f /usr/local/android/{sdk,eclipse}
  sudo ln -fs /usr/local/android/"$DIR_NAME"/sdk /usr/local/android/sdk
  sudo ln -fs /usr/local/android/"$DIR_NAME"/eclipse /usr/local/android/eclipse
  sudo mkdir /usr/local/android/sdk/add-ons
  sudo rm -rf /tmp/adt-bundle-linux-x86_64-*
else
  echo "Already installed Android SDK, skip install..."
fi


#---------------------------
# Common commands
#---------------------------

# Create link for android/adb commands enabled.

sudo chmod -R 755 /usr/local/android
sudo ln -s /usr/local/android/sdk/tools/android /usr/bin/android
sudo ln -s /usr/local/android/sdk/platform-tools/adb /usr/bin/adb


if [ ! `cat ~/.bashrc | grep "export ANDROID_HOME"` ]; then

  echo "Updating ANDROID_HOME..."
  cd ~/
  cat << End >> .bashrc
export ANDROID_HOME="/usr/local/android/sdk"
export PATH=\$ANDROID_HOME/tools:\$ANDROID_HOME/platform-tools:\$PATH
End

fi
