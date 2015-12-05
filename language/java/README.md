Java
====

Both Java 7 and 8 are available today.  This instruction will focus on Java 7, but the processes are similar to Java 8.

* [**Windows**](#java-on-windows)
* [**Mac**](#java-on-mac)
* [**Ubuntu**](#java-on-ubuntu)
* [**Fedora**](#java-on-fedora)

### Java on Windows
Download the latest Java for Windows from [Oracle](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html).

Choose the appropriate Thread Safe zip to download, either [Windows x86](http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-windows-i586.exe) or [Windows x64](http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-windows-x64.exe) based on your operation system.

Run the downloaded executable file and install java under `~/Applications/Java`, create the folder if it is not yet existed.

Run git bash as administrator, then create a symbolic link by running:
```sh
ln -s ~/Applications/Java/java.exe /usr/bin/java.exe
```

Verify the symbolic link is working properly by running:
```sh
which java # should see /usr/bin/java
java -version
```

if there is error saying java is not found on sh.exe, restart the git bash and run above line again.

Alternatively, you can also add `~/Applications/Java` as `%JAVA_HOME%` on the Windows environment variables list.

[BACK TO TOP](#table-of-contents)


### Java on Mac
Download the latest Java for Mac from [Oracle](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html).

Follow the instruction on there to read and accept the license agreement, then click the download link for [Mac OS X x64](http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-macosx-x64.dmg).

Once the `dmg` file is downloaded, double click it to start the installation.

Once the installation is done, you can verify your Java version by running the following line on terminal:
```sh
java -version
```
[BACK TO TOP](#table-of-contents)


### Java on Ubuntu
Download the latest Java for Ubuntu from [Oracle](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html).

Follow the instruction on there to read and accept the license agreement, then click the `tar.gz` download link for [Linux x86](http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-i586.tar.gz) or [Linux x64](http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz) based on your operation system.

Once the `tar.gz` file is downloaded, double click it to start the installation.

Alternatively, you can use PPA to install Oracle Java as well.
```sh
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer
```

#### OpenJDK
If you want to install OpenJDK on Ubuntu, you can do so by running:
```sh
sudo apt-get update
sudo apt-get install openjdk-7-jdk
```

Once installation process is done, you can verify the version of Java by running:
```sh
java -version
```

It is also recommended to setup `$JAVA_HOME` variable if it hasn't been automatically set up during the installation process.
```sh
echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle" >> ~/.bashrc
echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle" >> ~/.profile
```
Since `~/.bashrc` will be loaded whenever you start a new terminal, `$JAVA_HOME` will be ready as well.
[BACK TO TOP](#table-of-contents)


### Java on Fedora
To install Oracle Java for Ubuntu, download the `tar.gz` file, move it to `/opt` folder, unzip it, create a symbolic link between the unzipped folder and one of the PATH, such as `usr/bin`.
```sh
cd /opt
wget http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz
sudo tar xvf jdk-7u79-linux-x64.tar.gz
sudo ln -s /opt/jdk-7u79-linux-x64/bin/java /usr/bin/java
sudo rm jdk-7u79-linux-x64.tar.gz
```

Similarly, if you want to install OpenJDK on Fedora, you can do so by running:
```sh
sudo yum install java-1.7.0-openjdk-devel
```
[BACK TO TOP](#table-of-contents)
