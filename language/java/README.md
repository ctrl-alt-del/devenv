Java
====
Both Java 7 and 8 are available today.  This instruction will focus on how to install Java 7, but the processes should be similar for installing Java 8.

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

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


### Java on Mac
Download the latest Java for Mac from [Oracle](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html).

Follow the instruction on there to read and accept the license agreement, then click the download link for [Mac OS X x64](http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-macosx-x64.dmg).

Once the `dmg` file is downloaded, double click it to start the installation.

Once the installation is done, you can verify your Java version by running the following line on terminal:
```sh
java -version
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)



### Java on Ubuntu
* [Oracle JDK](https://github.com/ctrl-alt-del/devenv/tree/master/language/java/oraclejdk#oracle-jdk-on-ubuntu)
* [Open JDK](https://github.com/ctrl-alt-del/devenv/tree/master/language/java/oraclejdk#open-jdk-on-ubuntu)

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


### Java on Fedora
* [Oracle JDK](https://github.com/ctrl-alt-del/devenv/tree/master/language/java/oraclejdk#oracle-jdk-on-fedora)
* [Open JDK](https://github.com/ctrl-alt-del/devenv/tree/master/language/java/oraclejdk#open-jdk-on-fedora)

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)
