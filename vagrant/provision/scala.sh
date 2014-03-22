#!/usr/bin/env bash

echo "Installing scala..."

apt-get update
apt-get install -y python-software-properties wget curl unzip git

if [ ! `which java` ]; then
  add-apt-repository ppa:webupd8team/java
  apt-get update
  apt-get install -y openjdk-6-jre-headless openjdk-7-jre-headless openjdk-7-jdk libjansi-java ia32-libs
fi

cd /tmp

if [ ! `which scala` ]; then
  wget http://www.scala-lang.org/files/archive/scala-2.10.3.tgz
  tar zxf scala-2.10.3.tgz
  chown root:root scala-2.10.3
  mkdir /usr/local/scala
  mv scala-2.10.3 /usr/local/scala/2.10.3
  ln -fs /usr/local/scala/2.10.3 /usr/local/scala/current

  ln -fs /usr/local/scala/current/bin/scala /usr/bin/scala
  ln -fs /usr/local/scala/current/bin/scalac /usr/bin/scalac
  ln -fs /usr/local/scala/current/bin/fsc /usr/bin/fsc
  ln -fs /usr/local/scala/current/bin/sbaz /usr/bin/sbaz
  ln -fs /usr/local/scala/current/bin/sbaz-setup /usr/bin/sbaz-setup
  ln -fs /usr/local/scala/current/bin/scaladoc /usr/bin/scaladoc
  ln -fs /usr/local/scala/current/bin/scalap /usr/bin/scalap

  rm -f scala-2.10.3.tgz
else
  echo "Already installed Scala, skip install..."
fi

if [ ! `java -version | grep 1.7` ]; then
  echo 'debconf shared/accepted-oracle-license-v1-1 select true' | debconf-set-selections
  apt-get install -y oracle-java7-set-default
fi

if [ ! `which sbt` ]; then
  apt-get install -y sbt
  wget http://repo.scala-sbt.org/scalasbt/sbt-native-packages/org/scala-sbt/sbt/0.13.1/sbt.deb
  dpkg -i sbt.deb
  rm -f sbt.deb
fi

java -version
scala -version || true
sbt --version
