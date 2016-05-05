Scala
=====
[**Scala**](http://scala-lang.org) is a object-oriented functional programming language.

* [**Windows**](#scala-on-windows)
* [**Mac**](#scala-on-mac)
* [**Ubuntu**](#scala-on-ubuntu)
* [**Fedora**](#scala-on-fedora)

### Scala on Windows
Download the installer from [here](http://www.scala-lang.org/files/archive/scala-2.11.7.msi).

Double click to install.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


### Scala on Mac
```sh
brew install scala
brew install sbt
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


### Scala on Ubuntu
```sh
wget http://www.scala-lang.org/files/archive/scala-2.11.8.deb
sudo dpkg -i scala-2.11.8.deb
sudo apt-get update
sudo apt-get install scala
echo "deb http://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-get update
sudo apt-get install sbt
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


### Scala on Fedora
Follow the same instruction as [Ubuntu](#scala-on-ubuntu).

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)
