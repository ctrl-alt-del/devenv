Open JDK
========

* [**Ubuntu**](#java-on-ubuntu)
* [**Fedora**](#java-on-fedora)


### Oracle JDK on Ubuntu
#### Manual
Download the latest Java for Ubuntu from [Oracle](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html).

Follow the instruction on there to read and accept the license agreement, then click the `tar.gz` download link for [Linux x86](http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-i586.tar.gz) or [Linux x64](http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz) based on your operation system.

Once the `tar.gz` file is downloaded, double click it to unzip the file, and move it to `/usr/lib/jvm/`

It is also recommended to setup `$JAVA_HOME` variable if it hasn't been automatically set up during the installation process.
```sh
echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle" >> ~/.bashrc
echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle" >> ~/.profile
```
Since `~/.bashrc` will be loaded whenever you start a new terminal, `$JAVA_HOME` will be ready as well.


#### Automate
Alternatively, you can use PPA to install Oracle JDK as well.
```sh
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer
sudo apt-get install oracle-java7-set-default
sudo apt-get autoremove
```



### Java on Fedora
To install Oracle Java for Ubuntu, download the `tar.gz` file, move it to `/opt` folder, unzip it, create a symbolic link between the unzipped folder and one of the PATH, such as `usr/bin`.
```sh
cd /opt
wget http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz
sudo tar xvf jdk-7u79-linux-x64.tar.gz
sudo ln -s /opt/jdk-7u79-linux-x64/bin/java /usr/bin/java
sudo rm jdk-7u79-linux-x64.tar.gz
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)
