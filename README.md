devenv
======

### About
I use both Mac and Windows regularly and sometimes Ubuntu as well.  Although I mostly use Mac as my coding machine, I am very interested in coding on my Windows machine as well.  After some researches as well as trials and errors, I am able to setup the dev environment on my Windows machine and I am pretty happy with it so far.  I think it may be a good idea to share the setup process with the community, and hopefully it can save other people some time :).

### Disclaimer
This document and bash scripts will be updated piece by piece and I will try my best to describe the process step by step.  Please feel free to let me know if you see anything confusing/unclear/wrong or you have any recommendations.  Thank you :).

# Table of Contents

|Tools                       | [Windows 7](#windows)          | [Mac 10.9.+](#mac)        | [Ubuntu 14.04](#ubuntu)     | [Fedora 20](#fedora)        |
|:-------------------------- | :----------------------------: | :-----------------------: | :-------------------------: | :-------------------------: |
|[Preps](#configuration)     | [-->](#configure-windows)      | N/A                       | N/A                         | N/A                         |
|[Wget](#wget)               | [   ](#wget-on-windows)        | [   ](#wget-on-mac)       | [-->](#wget-on-ubuntu)      | [-->](#wget-on-fedora)      |
|[Curl](#curl)               | [-->](#curl-on-windows)        | [-->](#curl-on-mac)       | [-->](#curl-on-ubuntu)      | [   ](#curl-on-fedora)      |
|[devkit](#devkit)           | [-->](#devkit)                 | N/A                       | N/A                         | N/A                         |
|[OpenSSL](#openssl)         | [   ](       )                 | [   ](            )       | [-->](#openssl-on-ubuntu)   | [   ](               )      |
|[WAMP](#wamp)               | [-->](#wamp)                   | N/A                       | N/A                         | N/A                         |
|[MAMP](#mamp)               | N/A                            | [-->](#mamp)              | N/A                         | N/A                         |
|[LAMP](#lamp)               | N/A                            | N/A                       | [-->](#lamp-on-ubuntu)      | [-->](#lamp-on-fedora)      |
|[Chef](#chef)               | [   ](       )                 | [-->](#chef-on-mac)       | [   ](               )      | [   ](               )      |
|[Vagrant](#Vagrant)         | [-->](#vagrant-on-windows)     | [-->](#vagrant-on-mac)    | [-->](#vagrant-on-ubuntu)   | [-->](#vagrant-on-fedora)   |
|[VirtualBox](#virtualbox)   | [   ](#virtualbox-on-windows)  | [   ](#virtualbox-on-mac) | [-->](#virtualbox-on-ubuntu)| [-->](#virtualbox-on-fedora)|
|[iPython](#ipython)         | [   ](#ipython-on-windows)     | [-->](#ipython-on-mac)    | [-->](#ipython-on-ubuntu)   | [-->](#ipython-on-fedora)   |
|[Tree](#tree)               | [-->](#tree-on-windows)        | [-->](#tree-on-mac)       | [-->](#tree-on-ubuntu)      | [-->](#tree-on-fedora)      |



* [General Setup](#general-setup)
* [Setup .bash_profile](#setup-bash_profile)
* [Chrome](#chrome)
* [EditThisCookie](#editthiscookie)
* [REST Console](#rest-console)
* [JSON View](#json-view)
* [Setup Android dev environment](#setup-android-dev-enviroment)
* [Flash Issue on older PC](#flash-issue-on-older-pc)

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

## Database
* [MySQL](https://github.com/ctrl-alt-del/devenv/tree/master/database/mysql)
* [PostgreSQL](https://github.com/ctrl-alt-del/devenv/tree/master/database/postgresql)
* [Redis](https://github.com/ctrl-alt-del/devenv/tree/master/database/redis)
* [SQLite](https://github.com/ctrl-alt-del/devenv/tree/master/database/sqlite)


## Configuration

### Configure Windows
It is a good idea to centralize all your packages in one folder.  Not only does it help to better organize your packages, having a dedicated folder for your packages also makes navigating with command line easier.  In this instruction for Windows, all packages will be put or installed under `~/Applications`, a.k.a `%USERPROFILE%\Applications`.  Please create the folder if it is not existed, and of course, feel free to name your own directory.

If you are familiar with Window's PowerShell, you can create the folder by opening PowerShell and run:
```sh
cd %USERPROFILE%
mkdir Applications
```
[BACK TO TOP](#table-of-contents)


### Run as Administrator
For Windows's default command prompt or PowerShell, you will sometimes need the administrative permission to perform some tasks.  To run as administrator, right click on the `cmd.exe` or `powershell.exe` and select `Run as Administrator` option from the list.

[BACK TO TOP](#table-of-contents)


### Environment Variables
For Windows users, it is necessary to modified the Environment Variables (Env) so that some applications can be accessed through [terminal](#terminal).

Follow the steps to reach the interface of Env:
<br>
Right click `My Computer` -> click `Properties` -> click `Environment Variables`

Whenever a new application is installed and you want to access it through terminal, you can press `New` under the `System variables` section to add the application's path as an environment variable.

For `Variable name`, the convention is to use the upper case of the application's name and then concatenate it with `_HOME` (e.g. Python would be `PYTHON_HOME`).

For `Variable value`, just enter the full path of the application.

Once new Env is added, select `Path` row under the `User variables` section, and click the `Edit` button on below.  Go to the end of its `Variable value` and append the name of Env that you just created with a `;` as separator.  Click `OK` and you are done.

Alternatively, you can also use PowerShell script to add and update your Env.

To list all existing Env, open a PowerShell terminal and execute:
```powershell
Get-ChildItem Env:
```
Or you can just list the particular Env by executing: (replacing <variable_name> with the variable name)
```powershell
$Env:<variable_name>
```
[BACK TO TOP](#table-of-contents)



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



### Git Theme
The theme of Git can be easily modified on the `/Git/etc/profile.d/git-prompt.sh` file.

One example theme would be:
```sh
PS1='\[\033]0;$MSYSTEM:${PWD//[^[:ascii:]]/?}\007\]' # set window title
PS1="$PS1"'\[\033[1;32m\]'       # change to bold green
PS1="$PS1"'→ '                 # add an right arrow
PS1="$PS1"'\[\033[1;36m'       # change to bold cyan
PS1="$PS1"'\w'                 # current working directory
if test -z "$WINELOADERNOEXEC"
then
	GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
	COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
	COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
	COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
	if test -f "$COMPLETION_PATH/git-prompt.sh"
	then
		. "$COMPLETION_PATH/git-completion.bash"
		. "$COMPLETION_PATH/git-prompt.sh"
		PS1="$PS1"'\[\033[1;31m\]'  # change color to bold red
		PS1="$PS1"'`__git_ps1`'   # bash function

	fi
fi
PS1="$PS1"'\[\033[0m\]'        # change color
PS1="$PS1"' '                 # prompt: always space
```

The color is in ANSI 16-Colors code, and here is a short summary for the colors and styles:

##### Escape sequence:
There are two escape sequences: `\033[<code>m` or `\e[<code>m`

##### Text attributes
* `0` All attributes off
* `1` Bold on
* `4` Underscore
* `5` Blink on
* `7` Reverse video on
* `8` Concealed on

##### Foreground colors
* `30` Black
* `31` Red
* `32` Green
* `33` Yellow
* `34` Blue
* `35` Purple
* `36` Cyan
* `37` White

##### Background colors
* `40` Black
* `41` Red
* `42` Green
* `43` Yellow
* `44` Blue
* `45` Purple
* `46` Cyan
* `47` White
[BACK TO TOP](#table-of-contents)



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



## Django
[**Django**](https://www.djangoproject.com) is a Python Web Framework.

You need to have [Python](#python) installed before you install Django, and you also need to remove older version of Django if you have one of those installed.

* [**Mac**](#django-on-mac)
* [**Ubuntu**](#django-on-ubuntu)
* [**Fedora**](#django-on-fedora)

### Django on Mac
```sh
sudo pip install django
```
[BACK TO TOP](#table-of-contents)


### Django on Ubuntu
Follow the same instruction as [Mac](#django-on-mac).
[BACK TO TOP](#table-of-contents)


### Django on Fedora
Follow the same instruction as [Mac](#django-on-mac).
[BACK TO TOP](#table-of-contents)



## Laravel
[**Laravel**](http://laravel.com) is a PHP framework for web application development.

* [**Windows**](#laravel-on-windows)
* [**Mac**](#laravel-on-mac)

### Laravel on Windows
```sh
composer create-project laravel/laravel {directory} 5.0 --prefer-dist
```
[BACK TO TOP](#table-of-contents)


### Laravel on Mac
```sh
composer global require "laravel/installer=~1.1"
```
[BACK TO TOP](#table-of-contents)


### Known Issues
* Not able to build project on remote server
remote server has limited resources and may not be capable of crawling through remote hosted repositories to search for the latest dependencies, therefore, you need to commit and push your `composer.lock` file as well.  This file contains the exact locations of the dependencies that your project needs.
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



## WAMP
[**WAMP**](http://www.wampserver.com/en) stands for Windows-Apache-MySQL-PHP; it is a stack emulating server behaviors for web application development.

Choose the appropriate Thread Safe zip to download, either `x86` or `x64` based on your operation system.

Install the downloaded file to /c/usr/bin/wamp, or whatever directory you chose. Keep installation configurations default.

[BACK TO TOP](#table-of-contents)


## MAMP
[**MAMP**](http://www.mamp.info/en/downloads) stands for Mac-Apache-MySQL-PHP.

Once download is done, double click the `.pkg` file to install.

[BACK TO TOP](#table-of-contents)

## LAMP
[**LAMP**]() stands for Linux-Apache-MySQL-PHP.

* [**Ubuntu**](#lamp-on-ubuntu)
* [**Fedora**](#lamp-on-fedora)

### LAMP on Ubuntu
Install LAMP stack in Fedora is pretty simple.
```sh
sudo apt-get update
sudo apt-get install apache2
sudo apt-get install mysql-server libapache2-mod-auth-mysql php5-mysql
sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt
```

[BACK TO TOP](#table-of-contents)


### LAMP on Fedora
Install LAMP stack in Fedora is pretty straightforward.
```sh
yum update
sudo yum install httpd
sudo yum install mysql mysql-server
sudo yum install php php-mysql
```
You are done! LAMP stack is now installed into your Fedora.

[BACK TO TOP](#table-of-contents)



## Chef
[**Chef**](https://www.chef.io) is a tool for provisioning servers.

* [**Windows**](#chef-on-windows)
* [**Mac**](#chef-on-mac)
* [**Chef Tools**](#chef-tools)
* [**Knife-solo**](#knife-solo)
* [**Librarian-Chef**](#librarian-chef)

### Chef on Windows
Visit [Chef's download page](http://www.chef.io/chef/install) and download the `msi` installer for your specific Windows version.

Once downloaded, double click to install.  Installation details can be found on [here](https://docs.chef.io/install_windows.html#use-msi-installer).

[BACK TO TOP](#table-of-contents)


### Chef on Mac
You can install `chef` through `gem`:
```sh
gem install chef
```

However, a self-contained package is recommended, so you can also install `chef` through this script provided by the creators of `chef`:
```sh
curl -L https://www.opscode.com/chef/install.sh | bash
```
[BACK TO TOP](#table-of-contents)


### Chef Tools

#### Knife-solo
[**Knife-solo**](http://matschaffer.github.io/knife-solo) contains a set of command line tools that would make using `chef-solo` as easier.

```sh
gem install knife-solo
```
[BACK TO TOP](#table-of-contents)


#### Librarian-Chef
[**Librarian-Chef**](https://github.com/applicationsonline/librarian-chef) is a tool that helps you to manage cookbooks.

```sh
gem install librarian-chef
```
[BACK TO TOP](#table-of-contents)



## Vagrant
[**Vagrant**](https://www.vagrantup.com) is a tool for building development environment.

* [**Windows**](#vagrant-on-windows)
* [**Mac**](#vagrant-on-mac)
* [**Ubuntu**](#vagrant-on-ubuntu)
* [**Fedora**](#vagrant-on-fedora)

### Vagrant on Windows
Visit [Vagrant's download page](https://www.vagrantup.com/downloads.html) and download the `.msi` file for Windows.

Once downloaded, double click to install.

[BACK TO TOP](#table-of-contents)


### Vagrant on Mac
Visit [Vagrant's download page](https://www.vagrantup.com/downloads.html) and download the `.dmg` file for Mac OS.

Once downloaded, double click to install.

[BACK TO TOP](#table-of-contents)


### Vagrant on Ubuntu
Visit [Vagrant's download page](https://www.vagrantup.com/downloads.html) and download the `.deb` file for Ubuntu.

Once downloaded, navigate to the download destination, and execute:
```sh
sudo dpkg -i vagrant*
```

There are some know issues for Vagrant on Ubuntu:
1. `mount.nfs`: requested NFS version or transport protocol is not supported
```sh
sudo apt-get install nfs-kernel-server
```


[BACK TO TOP](#table-of-contents)


### Vagrant on Fedora
Visit [Vagrant's download page](https://www.vagrantup.com/downloads.html) and download the `.rpm` file for Fedora.
```sh
rpm -U vagrant*
```
[BACK TO TOP](#table-of-contents)



## VirtualBox
[**VirtualBox**](https://www.virtualbox.org) is a tool for setting up virtualization machine maintained by Oracle.

* [**Windows**](#virtualbox-on-windows)
* [**Mac**](#virtualbox-on-mac)
* [**Ubuntu**](#virtualbox-on-ubuntu)
* [**Fedora**](#virtualbox-on-fedora)

### VirtualBox on Windows
Visit [VirtualBox's download page](https://www.virtualbox.org/wiki/Downloads) and download its `.exe` file for Windows.

Once downloaded, double click to install.

[BACK TO TOP](#table-of-contents)


### VirtualBox on Mac
Visit [VirtualBox's download page](https://www.virtualbox.org/wiki/Downloads) and download its `.dmg` file for Mac.

Once downloaded, double click to install.

[BACK TO TOP](#table-of-contents)


### VirtualBox on Ubuntu
The easy way is to use `apt-get`, but it may not be providing you the latest version.
```sh
sudo apt-get install virtualbox
```

You can download and install the latest version manually.

For Ubuntu 13.04 and above, you can download:
*[**x86 `deb` file**](http://download.virtualbox.org/virtualbox/4.3.30/virtualbox-4.3_4.3.30-101610~Ubuntu~raring_i386.deb)
*[**x64 `deb` file**](http://download.virtualbox.org/virtualbox/4.3.30/virtualbox-4.3_4.3.30-101610~Ubuntu~raring_amd64.deb)

Once download is completed, navigate to the download destination, and then install it with command: `sudo dpkg -i virtualbox*`.

For other ubuntu version or linux distro, just visit its [download page for Linux](https://www.virtualbox.org/wiki/Linux_Downloads), and download the `deb` or `rpm` file accordingly.

[BACK TO TOP](#table-of-contents)


### VirtualBox on Fedora
It requires a little bit more work to install VirtualBox on Fedora.

Before all, please run `sudo yum update` to get the latest updates and then restart the computer if there are new updates were installed.

Navigate to the repository directory and add the virtualbox repo
```sh
cd /etc/yum.repos.d/
sudo  wget http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
```

Then, perform another `sudo yum update` and install the required libraries:
```sh
sudo yum install kernel-devel dkms binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers
```

Once the libraries are installed, you can install VirtualBox:
```sh
sudo yum install VirtualBox-4.3.x86_64
```
[BACK TO TOP](#table-of-contents)



## SmartGit
[SmartGit](http://www.syntevo.com/smartgithg) is an open source GUI for Git.

* [**Ubuntu**](#smartgit-on-ubuntu)
* [**Fedora**](#smartgit-on-fedora)

### SmartGit on Ubuntu
You can install SmartGit through PPA or do so manually.

#### Install Through PPA
To add the SmartGit PPA, run:
```sh
sudo add-apt-repository ppa:eugenesan/ppa
sudo apt-get update
```

Once the PPA is added and updated, you can install SmartGit by running:
```sh
sudo apt-get install smartgithg
```
[BACK TO TOP](#table-of-contents)


#### Install Through `deb` Package Manager
```sh
cd ~/Downloads
wget http://www.syntevo.com/downloads/smartgit/smartgit-6_5_8.deb
sudo dpkg -i smartgit-6_5_8.deb
```
[BACK TO TOP](#table-of-contents)


### SmartGit on Fedora
```sh
sudo yum install smartgithg
```
[BACK TO TOP](#table-of-contents)



## git-cola
[**git-cola**](https://git-cola.github.io) is an open source GUI for git.  Its design aim at making commits and pushes easier than other alternatives.

* [**Ubuntu**](#git-cola-on-ubuntu)
* [**Fedora**](#git-cola-on-fedora)

### git-cola on Ubuntu
```sh
sudo apt-get install git-cola
```
[BACK TO TOP](#table-of-contents)


### git-cola on Fedora
```sh
sudo yum install git-cola
```
[BACK TO TOP](#table-of-contents)



## LAMP
LAMP referes to a software bundle including Linux Apache MySQL PHP. You can learn more about it on its [server guide](https://help.ubuntu.com/14.04/serverguide/lamp-overview.html) or [wiki](https://help.ubuntu.com/community/ApacheMySQLPHP).

* [**Ubuntu**](#lamp-on-ubuntu)
* [**Fedora**](#lamp-on-fedora)

### LAMP on Ubuntu
You can install LAMP in Ubuntu by running:
```sh
sudo tasksel install lamp-server
```

Or alternatively:
```sh
sudo apt-get update
sudo apt-get install lamp-server^
```
[BACK TO TOP](#table-of-contents)


### LAMP on Fedora
```sh
sudo yum update
sudo yum install httpd mysql php php-mysql
```
[BACK TO TOP](#table-of-contents)



## iPython
[**iPython**](http://ipython.org) An enhanced Interactive Python.  To install `ipython`, you will need to have [`pip`](#pip)

* [**Mac**](#ipython-on-mac)
* [**Ubuntu**](#ipython-on-ubuntu)
* [**Fedora**](#ipython-on-fedora)

### iPython on Mac
```sh
sudo pip install ipython gnureadline
```
`gnureadline` is strongly recommended because `readline` will not behave well without it.

[BACK TO TOP](#table-of-contents)


### iPython on Ubuntu
```sh
sudo pip install ipython
```
[BACK TO TOP](#table-of-contents)


### iPython on Fedora
Follow the same instruction as [Ubuntu](#ipython-on-ubuntu)

[BACK TO TOP](#table-of-contents)



## Tree
[**Tree**](http://mama.indstate.edu/users/ice/tree) is a recursive directory listing tool with nice indentation and color codes.

* [**Windows**](#tree-on-windows)
* [**Mac**](#tree-on-mac)
* [**Ubuntu**](#tree-on-ubuntu)
* [**Fedora**](#tree-on-fedora)

### Tree on Mac
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



## Chrome
[**Chrome**](https://www.google.com/intl/en/chrome/browser) is a browser, but it can also be a very useful web development tool with some extensions.

Once Chrome is installed, you can start installing extensions by navigating to `chrome://extensions/` on its address bar to enter the extension manager.  Scroll to the bottom of the page and click on `get more extensions` to reach the chrome web store page of extensions.

Alternatively, you can visit the [Chrome web store page](https://chrome.google.com/webstore/category/extensions) to get the extensions.

[BACK TO TOP](#table-of-contents)


### EditThisCookie
[**EditThisCookie**](https://chrome.google.com/webstore/detail/editthiscookie/fngmhnnpilhplaeedifhccceomclgfbg) is a cookie manager that allow developer to modify cookies of a page in real for development and testing purpose.

To install the extension, just click on the blue `+ Free` button the top right corner.

[BACK TO TOP](#table-of-contents)


### REST Console
[**REST Console**](https://chrome.google.com/webstore/detail/rest-console/cokgbflfommojglbmbpenpphppikmonn) is an tool for testing HTTP requests on APIs.  It allows user to quickly test a url.

To install the extension, just click on the blue `+ Free` button the top right corner.

[BACK TO TOP](#table-of-contents)


### Postman
[**Postman**](https://chrome.google.com/webstore/detail/postman-rest-client/fdmmgilgnpjigdojojpjoooidkmcomcm) is similar with REST Console, but it has history of all the requests that you have made.

To install the extension, just click on the blue `+ Free` button the top right corner.

Starting from version 3.0.0, Postman becomes an Chrome App, you can get it from [here](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop).

[BACK TO TOP](#table-of-contents)


### JSON View
[**JSON View**](https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc) is a tool that parses JSON into a more human readable format.

To install the extension, just click on the blue `+ Free` button the top right corner.

[BACK TO TOP](#table-of-contents)


### ScriptSafe
[**ScriptSafe**](https://chrome.google.com/webstore/detail/scriptsafe/oiigbmnaadbkfbmpbfijlflahbdbdgdf?hl=en) is an Chrome extension that disables WebRTC.

[BACK TO TOP](#table-of-contents)



## Flash Issue on older PC
Newer Flash (version 11 and after) requires SSE2 feature in the CPU, which Intel first introduced on its Pentium 4.  However, AMD and other manufacturers only include such feature on their 64-bit chips.  Therefore, older computers with Pentium 3 or AMD 32-bit chips won't be able to get newer version of Flash to work.

The alternatives would be either using the [Chromium](https://www.chromium.org), or installing Flash 10 plugins.
