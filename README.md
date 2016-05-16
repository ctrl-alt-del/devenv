devenv
======

### About
I use both Mac and Windows regularly and sometimes Ubuntu as well.  Although I mostly use Mac as my coding machine, I am very interested in coding on my Windows machine as well.  After some researches as well as trials and errors, I am able to setup the dev environment on my Windows machine and I am pretty happy with it so far.  I think it may be a good idea to share the setup process with the community, and hopefully it can save other people some time :).

### Disclaimer
This document and bash scripts will be updated piece by piece and I will try my best to describe the process step by step.  Please feel free to let me know if you see anything confusing/unclear/wrong or you have any recommendations.  Thank you :).

# Table of Contents

|Tools                       | [Windows 7](#windows)          | [Mac 10.9.+](#mac)        | [Ubuntu 14.04](#ubuntu)     | [Fedora 20](#fedora)        |
|:-------------------------- | :----------------------------: | :-----------------------: | :-------------------------: | :-------------------------: |
|[Wget](#wget)               | [   ](#wget-on-windows)        | [   ](#wget-on-mac)       | [-->](#wget-on-ubuntu)      | [-->](#wget-on-fedora)      |
|[Curl](#curl)               | [-->](#curl-on-windows)        | [-->](#curl-on-mac)       | [-->](#curl-on-ubuntu)      | [   ](#curl-on-fedora)      |
|[OpenSSL](#openssl)         | [   ](       )                 | [   ](            )       | [-->](#openssl-on-ubuntu)   | [   ](               )      |
|[Tree](#tree)               | [-->](#tree-on-windows)        | [-->](#tree-on-mac)       | [-->](#tree-on-ubuntu)      | [-->](#tree-on-fedora)      |



* [General Setup](#general-setup)
* [Setup .bash_profile](#setup-bash_profile)
* [Setup Android dev environment](#setup-android-dev-enviroment)

## Database
* [MySQL](https://github.com/ctrl-alt-del/devenv/tree/master/database/mysql)
* [PostgreSQL](https://github.com/ctrl-alt-del/devenv/tree/master/database/postgresql)
* [Redis](https://github.com/ctrl-alt-del/devenv/tree/master/database/redis)
* [SQLite](https://github.com/ctrl-alt-del/devenv/tree/master/database/sqlite)



## Integrated Development Environment (IDE)
* [Android Studio](https://github.com/ctrl-alt-del/devenv/tree/master/ide/android%20studio)
* [eclipse](https://github.com/ctrl-alt-del/devenv/tree/master/ide/eclipse)
* [IntelliJ](https://github.com/ctrl-alt-del/devenv/tree/master/ide/intellij)
* [PyCharm](https://github.com/ctrl-alt-del/devenv/tree/master/ide/pycharm)



## Language
* [Go](https://github.com/ctrl-alt-del/devenv/tree/master/language/go)
	* [BeeGo](https://github.com/ctrl-alt-del/devenv/tree/master/language/go/beego)
	* [godep](https://github.com/ctrl-alt-del/devenv/tree/master/language/go/godep)
* [Java](https://github.com/ctrl-alt-del/devenv/tree/master/language/java)
* [JavaScript](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript)
	* [bower](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript/bower)
	* [jQuery](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript/jquery)
	* [NodeJS](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript/nodejs)
		* [CoffeeScript](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript/nodejs/coffeescript)
		* [Express](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript/nodejs/express)
		* [nodemon](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript/nodejs/coffeescript/nodemon)
		* [npm](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript/nodejs/npm)
		* [Sail.js](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript/nodejs/sailjs)
* [PHP](https://github.com/ctrl-alt-del/devenv/tree/master/language/php)
	* [composer](https://github.com/ctrl-alt-del/devenv/tree/master/language/php/composer)
	* [Laravel](https://github.com/ctrl-alt-del/devenv/tree/master/language/php/laravel)
* [Python](https://github.com/ctrl-alt-del/devenv/tree/master/language/python)
	* [matplotlib](https://github.com/ctrl-alt-del/devenv/tree/master/language/python/matplotlib)
	* [numpy](https://github.com/ctrl-alt-del/devenv/tree/master/language/python/numpy)
	* [pip](https://github.com/ctrl-alt-del/devenv/tree/master/language/python/pip)
	* [virtualenv](https://github.com/ctrl-alt-del/devenv/tree/master/language/python/virtualenv)
* [Ruby](https://github.com/ctrl-alt-del/devenv/tree/master/language/ruby)
	* [Rails](https://github.com/ctrl-alt-del/devenv/tree/master/language/ruby/rails)
	* [rspec](https://github.com/ctrl-alt-del/devenv/tree/master/language/ruby/rspec)
* [Rust](https://github.com/ctrl-alt-del/devenv/tree/master/language/rust)
* [Scala](https://github.com/ctrl-alt-del/devenv/tree/master/language/scala)



## Operating System (OS)
* [Fedora](https://github.com/ctrl-alt-del/devenv/tree/master/os/fedora)
* [LXLE](https://github.com/ctrl-alt-del/devenv/tree/master/os/lxle)
* [Mac](https://github.com/ctrl-alt-del/devenv/tree/master/os/mac)
* [Ubuntu](https://github.com/ctrl-alt-del/devenv/tree/master/os/ubuntu)
* [Windows](https://github.com/ctrl-alt-del/devenv/tree/master/os/windows)



## Terminal
* [bash](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/bash)
* [git](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/git)
* [guake](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/guake)
* [iterm2](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/iterm2)
* [package manager](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/package%20manager)
	* [apt](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/package%20manager/apt)
	* [bower](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/package%20manager/bower)
	* [chocolatey](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/package%20manager/chocolatey)
	* [cygwin](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/package%20manager/cywin)
	* [dpkg](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/package%20manager/dpkg)
	* [homebrew](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/package%20manager/homebrew)
	* [macport](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/package%20manager/macport)
	* [pacman](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/package%20manager/pacman)
	* [yum](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/package%20manager/yum)
* [tilda](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/tilda)
* [zsh](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/zsh)
	* [oh-my-zsh](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/zsh/oh-my-zsh)


## Virtualization
* [Chef]()
* [Vagrant]()
* [VirtualBox]()



## Wget
[**Wget**](http://www.gnu.org/software/wget) is a free, open-source, command-line tool that downloads content from internet

* [**Mac**](#wget-on-mac)
* [**Ubuntu**](#wget-on-ubuntu)
* [**Fedora**](#wget-on-fedora)

### Wget on Mac
```sh
brew install wget
```
[BACK TO TOP](#table-of-contents)


### Wget on Ubuntu
```sh
sudo apt-get update
sudo apt-get install wget
```
[BACK TO TOP](#table-of-contents)


### Wget on Fedora
```sh
sudo yum install wget
```
[BACK TO TOP](#table-of-contents)



### GCC Support
`gcc`, or [GNU Complier Collection](https://gcc.gnu.org) is a tricky part for Windows users.  Often times, only the binaries are provided along with other projects, such as [Cygwin](http://sourceware.org/cygwin), [MinGW](http://www.mingw.org) or [mingw-w64](http://mingw-w64.org).

Since I want to use git-bash, I need to find the GCC compiler toolset, and I found [**TDM-GCC**](http://tdm-gcc.tdragon.net), which can fulfill my needs.




## Curl
[**Curl**](http://curl.haxx.se/docs/manpage.html) is a tool to transfer data from or to a server.

Curl comes with Mac and some distros of Linux by default.  For Windows, it should comes with [Git](#git-on-windows).  In case Curl is not installed on your system, you can follow the instructions below to install it yourself.

* [**Windows**](#curl-on-windows)
* [**Mac**](#curl-on-mac)
* [**Ubuntu**](#curl-on-ubuntu)
* [**Fedora**](#curl-on-fedora)

### Curl on Windows
Visit [Curl](http://curl.haxx.se/download.html) to download the latest version of [`curl-[version].zip`](http://curl.haxx.se/download/curl-7.43.0.zip).

Once it is downloaded, unzip it to `/c/usr/bin/curl`, or whatever directory your chose.

Run git bash as administrator, then create a symbolic link by running:
```sh
ln -s /c/usr/bin/curl/curl.exe /usr/bin/curl.exe
```
[BACK TO TOP](#table-of-contents)


### Curl on Mac
Mac should have Curl by default.  You can verify your curl version by opening your terminal and running:
```sh
curl --version
```

If curl does not come with your Mac somehow, you can follow the same instruction of [Windows](#curl-on-windows) to manually install it on your Mac.

Or you can install it through [Homebrew](#homebrew) by running:
```sh
brew install curl
```
[BACK TO TOP](#table-of-contents)


### Curl on Ubuntu
```sh
sudo apt-get install curl
```
[BACK TO TOP](#table-of-contents)


### Curl on Fedora
```sh
sudo yum install curl
```
[BACK TO TOP](#table-of-contents)



## Wget

* [**Mac**](#wget-on-mac)

### Wget on Mac
```sh
brew install wget
```
[BACK TO TOP](#table-of-contents)


### Wget on Ubuntu
It takes some effort to install `wget` on Ubuntu, you need to first download the `tar.gz` file of `wget` from [here](http://ftp.gnu.org/gnu/wget/wget-1.16.tar.gz), and then unzip it `tar -xvf wget-1.16.tar.gz`.  Once folder is unzipped, go into it and build the `make` file.

```sh
sudo apt-get update
sudo apt-get build-dep wget
curl --remote-name "http://ftp.gnu.org/gnu/wget/wget-1.16.tar.gz"
tar -xvf wget-1.16.tar.gz
cd wget-1.16/
./configure --with-ssl=openssl --prefix=/opt/wget
make
sudo make install
sudo ln -s /opt/wget /usr/bin/wget
```
[BACK TO TOP](#table-of-contents)




## OpenSSL

* [**Mac**](#openssl-on-mac)
* [**Ubuntu**](#openssl-on-ubuntu)

### OpenSSL on Mac
```sh
brew install openssl
```
[BACK TO TOP](#table-of-contents)


### OpenSSL on Ubuntu
Ubuntu comes with OpenSSL, but it may need to be upgraded because of the [Heartbleed Bug](http://heartbleed.com).  Moreover, newer version of OpenSSL is also required to install the latest Rails.

You can upgrade OpenSSL by running:
```sh
sudo apt-get upgrade openssl
```
[BACK TO TOP](#table-of-contents)



## Tree
[**Tree**](http://mama.indstate.edu/users/ice/tree) is a recursive directory listing tool with nice indentation and color codes.

* [**Windows**](#tree-on-windows)
* [**Mac**](#tree-on-mac)
* [**Ubuntu**](#tree-on-ubuntu)
* [**Fedora**](#tree-on-fedora)

### Tree on Windows
`tree` is a built-in command for Windows.

[BACK TO TOP](#table-of-contents)


### Tree on Mac
```sh
brew install tree
```
[BACK TO TOP](#table-of-contents)


### Tree on Ubuntu
```sh
sudo apt-get update
sudo apt-get install tree
```
[BACK TO TOP](#table-of-contents)


### Tree on Fedora
```sh
sudo yum install tree
```
[BACK TO TOP](#table-of-contents)



## Trailer
[**Trailer**](http://ptsochantaris.github.io/trailer) is a Github pull request tracker for Mac.

* [**Mac**](#trailer-on-mac)

### Trailer on Mac
Download the app from its [home page](http://ptsochantaris.github.io/trailer).

Once download is completed, unzip the file and then drag the `.app` file to `Applications` folder to install it.

[BACK TO TOP](#table-of-contents)



## Openswan
Open source IPsec implementation for Linux.

* [**Ubuntu**](#openswan-on-ubuntu)
* [**Fedora**](#openswan-on-fedora)

### Openswan on Ubuntu
```sh
sudo apt-get install openswan
```
[BACK TO TOP](#table-of-contents)


### Openswan on Fedora
```sh
sudo yum install openswan
```
[BACK TO TOP](#table-of-contents)



# General Setup

## Setup .bash_profile

* [**Automatic Way**](#automatic-way)
* [**Manual Way**](#manual-way)

You can configure your shell to have it memorize some convenient shortcuts.

If you are in Windows, you can open git bash as administrator by right click on the icon of git bash and select "Run as Administrator".

If you are in Mac or other Unix/Linux-base operating system, just open up your terminal.

### Automatic Way
Copy and paste the following codes to your terminal and hit enter/return to run them:
```sh
cd ~
\curl -O https://raw.githubusercontent.com/ctrl-alt-del/devenv/master/util/setup_bash_profile.sh
chmod 755 setup_bash_profile.sh
./setup_bash_profile.sh
```
this should create a .bash_profile file if it is not existed and inject the shortcuts to the file.

[BACK TO TOP](#table-of-contents)


## Manual Way
If you prefer to create the .bash_profile file manually, you can do so by running:
`touch -pv ~/.bash_profile` on your terminal, if will create the file if it hasn't been created.  Afterwards, you can open it by running: `sudo vi ~/.bash_profile`and then add the scripts to it.  I use `vi` in this case, but you are free to use whatever editor you like, such as `vim`, `nano`, `gedit`, `subl`, `atom` and etc.

After the .bash_profile is created, restart the git bash to let the changes take effect.

[BACK TO TOP](#table-of-contents)
