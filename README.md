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

## Cheatsheet
* [AngularJS](https://github.com/ctrl-alt-del/devenv/blob/master/cheatsheet/angularjs)
* [bash](https://github.com/ctrl-alt-del/devenv/blob/master/cheatsheet/bash)
* [Hacker Rank](https://github.com/ctrl-alt-del/devenv/blob/master/cheatsheet/hackerrank.md)
* [Overview](https://github.com/ctrl-alt-del/devenv/blob/master/cheatsheet/overview.md)
* [Redis](https://github.com/ctrl-alt-del/devenv/blob/master/cheatsheet/redis.md)
* [Regular Expression](https://github.com/ctrl-alt-del/devenv/blob/master/cheatsheet/regular_expression.md)
* [Sorting Algorithms](https://github.com/ctrl-alt-del/devenv/blob/master/cheatsheet/sorting_algorithms.md)
* [Unit Testing](https://github.com/ctrl-alt-del/devenv/blob/master/cheatsheet/unit_testing.md)



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
	* [OpenJDK](https://github.com/ctrl-alt-del/devenv/tree/master/language/java/openjdk)
	* [OracleJDK](https://github.com/ctrl-alt-del/devenv/tree/master/language/java/oraclejdk)
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
	* [django](https://github.com/ctrl-alt-del/devenv/tree/master/language/python/django)
	* [ipython](https://github.com/ctrl-alt-del/devenv/tree/master/language/python/ipython)
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
* [tilda](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/tilda)
* [tree](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/tree)
* [zsh](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/zsh)
	* [oh-my-zsh](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/zsh/oh-my-zsh)



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


# Network Issues

## Exclamation mark (!) right next to network icon
This issue occurs when your network is not able to connect to Google, or Google is walled.

The easiest way to bypass/solve this issue is to use `adb` and set the `captive_portal_server` under `global` manually.

The `<host_name>` needs to be a domain with `/generate_204` sub-domain returning HTTP 204.
```
adb shell "settings put global captive_portal_server <host_name>" # e.g. g.cn, google.cn
```

To determine if a given domain is capable of being a `<host_name>`, run something similar to:
```
curl -I http://www.g.cn/generate_204
```

It is capable of being the `<host_name>` if it returns something like this:
```
HTTP/1.1 204 No Content
Content-Length: 0
```

To reset the variable, simply remove the variable by doing:
```
adb shell "settings delete global captive_portal_server"
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
