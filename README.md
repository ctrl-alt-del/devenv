devenv
======

### About
I use both Mac and Windows regularly and sometimes Ubuntu as well.  Although I mostly use Mac as my coding machine, I am very interested in coding on my Windows machine as well.  After some researches as well as trials and errors, I am able to setup the dev environment on my Windows machine and I am pretty happy with it so far.  I think it may be a good idea to share the setup process with the community, and hopefully it can save other people some time :).

### Disclaimer
This document and bash scripts will be updated piece by piece and I will try my best to describe the process step by step.  Please feel free to let me know if you see anything confusing/unclear/wrong or you have any recommendations.  Thank you :).

# Table of Contents

## Browser
* [Chrome](https://github.com/ctrl-alt-del/devenv/blob/master/browser/chrome)
* [Firefox](https://github.com/ctrl-alt-del/devenv/blob/master/browser/firefox)
* [Flash](https://github.com/ctrl-alt-del/devenv/blob/master/browser/flash)



## Build Tool
* [Ant](https://github.com/ctrl-alt-del/devenv/blob/master/build-tool/ant)
* [Gnu Make](https://github.com/ctrl-alt-del/devenv/blob/master/build-tool/gnu-make)
* [Gradle](https://github.com/ctrl-alt-del/devenv/blob/master/build-tool/gradle)
* [Ivy](https://github.com/ctrl-alt-del/devenv/blob/master/build-tool/ivy)
* [Make](https://github.com/ctrl-alt-del/devenv/blob/master/build-tool/make)
* [Maven](https://github.com/ctrl-alt-del/devenv/blob/master/build-tool/maven)



## Cache
* [Memcached](https://github.com/ctrl-alt-del/devenv/blob/master/cache/memcached)
* [Redis](https://github.com/ctrl-alt-del/devenv/blob/master/cache/redis)
* [Varnish](https://github.com/ctrl-alt-del/devenv/blob/master/cache/varnish)




## [Cheatsheet](https://github.com/ctrl-alt-del/devenv/blob/master/cheatsheet)
* [Android](https://github.com/ctrl-alt-del/devenv/blob/master/cheatsheet/android)
* [AngularJS](https://github.com/ctrl-alt-del/devenv/blob/master/cheatsheet/angularjs)
* [bash](https://github.com/ctrl-alt-del/devenv/blob/master/cheatsheet/bash)
* [Go](https://github.com/ctrl-alt-del/devenv/blob/master/cheatsheet/go)
* [Hacker Rank](https://github.com/ctrl-alt-del/devenv/blob/master/cheatsheet/hacker-rank)
* [JavaScript](https://github.com/ctrl-alt-del/devenv/blob/master/cheatsheet/javascript)
* [PHP](https://github.com/ctrl-alt-del/devenv/blob/master/cheatsheet/php)
* [Redis](https://github.com/ctrl-alt-del/devenv/blob/master/cheatsheet/redis)
* [Regular Expression](https://github.com/ctrl-alt-del/devenv/blob/master/cheatsheet/regular-expression)
* [Sorting Algorithms](https://github.com/ctrl-alt-del/devenv/blob/master/cheatsheet/sorting-algorithms)
* [Unit Testing](https://github.com/ctrl-alt-del/devenv/blob/master/cheatsheet/unit-testing)



## Compiler
* [gcc](https://github.com/ctrl-alt-del/devenv/blob/master/compiler/gcc)



## Database
* [Kyoto Tycoon](https://github.com/ctrl-alt-del/devenv/tree/master/database/kyoto-tycoon)
* [MySQL](https://github.com/ctrl-alt-del/devenv/tree/master/database/mysql)
* [PostgreSQL](https://github.com/ctrl-alt-del/devenv/tree/master/database/postgresql)
* [Redis](https://github.com/ctrl-alt-del/devenv/tree/master/database/redis)
* [SQLite](https://github.com/ctrl-alt-del/devenv/tree/master/database/sqlite)



## Editor
* [atom](https://github.com/ctrl-alt-del/devenv/tree/master/editor/atom)
* [sublime](https://github.com/ctrl-alt-del/devenv/tree/master/editor/sublime)



## Integrated Development Environment (IDE)
* [Android Studio](https://github.com/ctrl-alt-del/devenv/tree/master/ide/android-studio)
	* [Android SDK](https://github.com/ctrl-alt-del/devenv/tree/master/ide/android-studio/android-sdk)
* [eclipse](https://github.com/ctrl-alt-del/devenv/tree/master/ide/eclipse)
* [IntelliJ](https://github.com/ctrl-alt-del/devenv/tree/master/ide/intellij)
* [PyCharm](https://github.com/ctrl-alt-del/devenv/tree/master/ide/pycharm)



## Language
* [elm](https://github.com/ctrl-alt-del/devenv/tree/master/language/elm)
* [Go](https://github.com/ctrl-alt-del/devenv/tree/master/language/go)
	* [BeeGo](https://github.com/ctrl-alt-del/devenv/tree/master/language/go/beego)
	* [godep](https://github.com/ctrl-alt-del/devenv/tree/master/language/go/godep)
* [Java](https://github.com/ctrl-alt-del/devenv/tree/master/language/java)
	* [OpenJDK](https://github.com/ctrl-alt-del/devenv/tree/master/language/java/openjdk)
	* [OracleJDK](https://github.com/ctrl-alt-del/devenv/tree/master/language/java/oraclejdk)
* [JavaScript](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript)
	* [bower](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript/bower)
	* [Inferno](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript/inferno)
	* [jQuery](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript/jquery)
	* [NodeJS](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript/nodejs)
		* [CoffeeScript](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript/nodejs/coffeescript)
		* [Express](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript/nodejs/express)
		* [nodemon](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript/nodejs/coffeescript/nodemon)
		* [Sail.js](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript/nodejs/sailjs)
	* [npm](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript/npm)
	* [React](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript/react)
	* [Yarn](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript/yarn)
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



## Network
* [curl](https://github.com/ctrl-alt-del/devenv/tree/master/network/curl)
* [openswan](https://github.com/ctrl-alt-del/devenv/tree/master/network/openswan)
* [wget](https://github.com/ctrl-alt-del/devenv/tree/master/network/wget)



## Operating System (OS)
* [Android](https://github.com/ctrl-alt-del/devenv/tree/master/os/android)
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
* [package manager](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/package-manager)
* [Terminator](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/terminator)
* [tilda](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/tilda)
* [zsh](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/zsh)
	* [oh-my-zsh](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/zsh/oh-my-zsh)



## Utility
* [alien](https://github.com/ctrl-alt-del/devenv/tree/master/util/alien)
* [apktool](https://github.com/ctrl-alt-del/devenv/tree/master/util/apktool)
* [bash_profile](https://github.com/ctrl-alt-del/devenv/tree/master/util/bash_profile)
* [bashrc](https://github.com/ctrl-alt-del/devenv/tree/master/util/bashrc)
* [fbreader](https://github.com/ctrl-alt-del/devenv/tree/master/util/fbreader)
* [gemrc](https://github.com/ctrl-alt-del/devenv/tree/master/util/gemrc)
* [hdparm](https://github.com/ctrl-alt-del/devenv/tree/master/util/hdparm)
* [htop](https://github.com/ctrl-alt-del/devenv/tree/master/util/htop)
* [killall](https://github.com/ctrl-alt-del/devenv/tree/master/util/killall)
* [profile](https://github.com/ctrl-alt-del/devenv/tree/master/util/profile)
* [smartmontools](https://github.com/ctrl-alt-del/devenv/tree/master/util/smartmontools)
* [synclient](https://github.com/ctrl-alt-del/devenv/tree/master/util/synclient)
* [tree](https://github.com/ctrl-alt-del/devenv/tree/master/util/tree)
* [xkill](https://github.com/ctrl-alt-del/devenv/tree/master/util/xkill)



## Virtualization
* [chef](https://github.com/ctrl-alt-del/devenv/tree/master/virtualization/chef)
* [docker](https://github.com/ctrl-alt-del/devenv/tree/master/virtualization/docker)
* [LAMP](https://github.com/ctrl-alt-del/devenv/tree/master/virtualization/lamp)
* [MAMP](https://github.com/ctrl-alt-del/devenv/tree/master/virtualization/mamp)
* [vagrant](https://github.com/ctrl-alt-del/devenv/tree/master/virtualization/vagrant)
* [VirtualBox](https://github.com/ctrl-alt-del/devenv/tree/master/virtualization/virtualbox)
* [WAMP](https://github.com/ctrl-alt-del/devenv/tree/master/virtualization/wamp)
