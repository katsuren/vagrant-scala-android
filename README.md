vagrant-scala-android
=====================

Automated provisioning and configuration of an Ubuntu VM containing the Android development environment, including Android ADT Bundle with SDK, Scala, SBT.
This Vagrantfile uses sync-folder, so you can edit the projects from host.

Specs
======

* Ubuntu 13.04 64bit
* Java 1.7.0_51
* Scala 2.10.3
* SBT 0.13.1
* Android SDK r22.6.1
* Maven 3.2.1
* giter8

Mem 1024

Private network 192.168.56.201

How to
=======

Install libraries.
* Vagrant
* Virtual Box

Clone repos.

```bash
$ cd somewhere work space
$ git clone git@github.com:katsuren/vagrant-scala-android.git
```

Vagrant up

```bash
$ cd vagrant-scala-android/vagrant
$ vagrant up
```

If you want to use Android NDK, modify Vagrantfile.
Uncomment out the line.
```ruby
# config.vm.provision "shell", path: "provision/android-ndk.sh"
```

Development
==========

The project folder is shared. In guest, it is /home/project .

Create project using template. And specify target sdk 19.
```bash
$ sudo su
$ cd /home/project
$ g8 mackler/android-app
```

mackler's template is not work in default, fix Android.xml (target SDK)
```bash
cd [project]/src/main
vim Android.xml
```

for example, Android 2.3.3 ~
```xml
<uses-sdk android:minSdkVersion="10" />
```

And go to project root, start sbt.
```bash
$ cd /path/to/project/
$ sbt
```

You can use commands below

COMMAND | NOTE
--- | ---
compile | Compile project
apk | Generate APK file
install | Transfer APK file to device, and generates APK file if has not generated.
start | Install APK file and start.
reload | Reload build definitions.
console | start REPL.
exit | exit sbt.

You can use Emulator in Hosts machine. Start Emulator at hosts, and try this command at guests `adb connect 192.168.56.1`. Then, instal/start command is apply to host's emulator.

