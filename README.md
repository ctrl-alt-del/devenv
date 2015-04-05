devenv
======

### About
I use both Mac and Windows regularly and sometimes Ubuntu as well.  Although I mostly use Mac as my coding machine, I am very interested in coding on my Windows machine as well.  After some reseaches as well as trials and errors, I am able to setup the dev environment on my Windows machine and I am pretty happy with it so far.  I think it may be a good idea to share the setup process with the community, and hopefully it can save other people some time :).

### Disclaimer
This document and bash scripts will be updated piece by piece and I will try my best to describe the process step by step.  Please feel free to let me know if you see anything confusing/unclear/wrong or you have any recommendations.  Thank you :).

# Table of Contents

|Tools                       | [Windows 7](#windows)          | [Mac 10.9.+](#mac)        | [Ubuntu 14.04](#ubuntu)     | [Fedora 20](#fedora)        |
|:-------------------------- | :----------------------------: | :-----------------------: | :-------------------------: | :-------------------------: |
|[Preps](#configuration)     | [-->](#configure-windows)      | N/A                       | N/A                         | N/A                         |
|[iTerm2](#iterm2)           | N/A                            | [-->](#iterm2)            | N/A                         | N/A                         |
|[Tilda](#tilda)             | N/A                            | N/A                       | [-->](#tilda-on-ubuntu)     | [-->](#tilda)               |
|[Guake](#guake)             | N/A                            | N/A                       | [-->](#guake-on-ubuntu)     | [-->](#guake-on-fedora)     |
|[Zsh](#zsh)                 | N/A                            | [   ](#zsh-on-mac)        | [-->](#zsh-on-ubuntu)       | [-->](#zsh-on-fedora)       |
|[Oh-My-Zsh](#oh-my-zsh)     | [   ](#oh-my-zsh-on-windows)   | [-->](#oh-my-zsh-on-mac)  | [-->](#oh-my-zsh-on-ubuntu) | [-->](#oh-my-zsh-on-fedora) |
|[Homebrew](#homebrew)       | N/A                            | [-->](#homebrew)          | N/A                         | N/A                         |
|[Sublime](#sublime)         | [-->](#sublime-on-windows)     | [-->](#sublime-on-mac)    | [-->](#sublime-on-ubuntu)   | [-->](#sublime-on-fedora)   |
|[Git](#git)                 | [-->](#git-on-windows)         | [-->](#git-on-mac)        | [-->](#git-on-ubuntu)       | [-->](#git-on-fedora)       |
|[Gitg](#gitg)               | [   ](#gitg-on-windows)        | [   ](#gitg-on-mac)       | [   ](#gitg-on-ubuntu)      | [   ](#gitg-on-fedora)      |
|[Gitk](#gitk)               | [   ](#gitk-on-windows)        | [   ](#gitk-on-mac)       | [-->](#gitk-on-ubuntu)      | [   ](#gitk-on-fedora)      |
|[SmartGit](#smartgit)       | [   ](#smartgit-on-windows)    | [   ](#smartgit-on-mac)   | [-->](#smartgit-on-ubuntu)  | [   ](#smartgit-on-fedora)  |
|[Wget](#wget)               | [   ](#wget-on-windows)        | [   ](#wget-on-mac)       | [-->](#wget-on-ubuntu)      | [-->](#wget-on-fedora)      |
|[Curl](#curl)               | [-->](#curl-on-windows)        | [-->](#curl-on-mac)       | [-->](#curl-on-ubuntu)      | [   ](#curl-on-fedora)      |
|[Ruby](#ruby)               | [-->](#ruby-on-windows)        | [-->](#ruby-on-mac)       | [-->](#ruby-on-ubuntu)      | [   ](#ruby-on-fedora)      |
|[devkit](#devkit)           | [-->](#devkit)                 | N/A                       | N/A                         | N/A                         |
|[Rails](#rails)             | [-->](#rails-on-windows)       | [-->](#rails-on-mac)      | [-->](#rails-on-ubuntu)     | [-->](#rails-on-fedora)     |
|[RSpec](#rspec)             | [-->](#rspec-on-windows)       | [   ](#rspec-on-mac)      | [   ](#rspec-on-ubuntu)     | [   ](#rspec-on-fedora)     |
|[Java](#java)               | [-->](#java-on-windows)        | [-->](#java-on-mac)       | [-->](#java-on-ubuntu)      | [   ](#java-on-fedora)      |
|[Python](#python)           | [-->](#python-on-windows)      | [-->](#python-on-mac)     | [-->](#python-on-ubuntu)    | [-->](#python-on-fedora)    |
|[PHP](#php)                 | [-->](#php-on-windows)         | [-->](#php-on-mac)        | [-->](#php-on-ubuntu)       | [-->](#php-on-fedora)       |
|[Node.js](#nodejs)          | [-->](#nodejs)                 | [-->](#nodejs-on-mac)     | [-->](#nodejs-on-ubuntu)    | [   ](               )      |
|[npm](#npm)                 | [   ](       )                 | N/A                       | [-->](#npm-on-ubuntu)       | [   ](               )      |
|[Express](#express)         | [   ](       )                 | [-->](#express-on-mac)    | [   ](                 )    | [   ](               )      |
|[Nodemon](#nodemon)         | [   ](       )                 | [-->](#nodemon-on-mac)    | [   ](                 )    | [   ](               )      |
|[OpenSSL](#openssl)         | [   ](       )                 | [   ](            )       | [-->](#openssl-on-ubuntu)   | [   ](               )      |
|[Gradle](#gradle)           | [-->](#gradle-on-windows)      | [-->](#gradle-on-mac)     | [-->](#gradle-on-ubuntu)    | [-->](#gradle-on-fedora)    |
|[WAMP](#wamp)               | [-->](#wamp)                   | N/A                       | N/A                         | N/A                         |
|[MAMP](#mamp)               | N/A                            | [-->](#mamp)              | N/A                         | N/A                         |
|[LAMP](#lamp)               | N/A                            | N/A                       | [-->](#lamp-on-ubuntu)      | [-->](#lamp-on-fedora)      |
|[SQLite](#sqlite)           | [-->](#sqlite-on-windows)      | [-->](#sqlite-on-mac)     | [-->](#sqlite-on-ubuntu)    | [   ](#sqlite-on-fedora)    |
|[MySQL](#mysql)             | [   ](       )                 | [-->](#mysql-on-mac)      | [-->](#mysql-on-ubuntu)     | [-->](#mysql-on-fedora)     |
|[PostgreSQL](#postgreSQL)   | [   ](       )                 | [-->](#postgreSQL-on-mac) | [   ](               )      | [   ](               )      |
|[Chef](#chef)               | [   ](       )                 | [-->](#chef-on-mac)       | [   ](               )      | [   ](               )      |
|[Vagrant](#Vagrant)         | [-->](#vagrant-on-windows)     | [-->](#vagrant-on-mac)    | [-->](#vagrant-on-ubuntu)   | [-->](#vagrant-on-fedora)   |
|[Android SDK](#android-sdk) | [-->](#sdk-on-windows)         | [-->](#android-sdk)       | [-->](#sdk-on-ubuntu)       | [-->](#sdk)                 |
|[ADT](#adt)                 | [-->](#adt)                    | [-->](#adt)               | [-->](#adt)                 | [-->](#adt)                 |
|[PyCharm](#pycharm)         | [   ](#pycharm-on-windows)     | [   ](#pycharm-on-mac)    | [-->](#pycharm-on-ubuntu)   | [-->](#pycharm-on-fedora)   |
|[Eclipse](#eclipse)         | [-->](#eclipse)                | [-->](#eclipse-on-mac)    | [   ](#eclipse-on-ubuntu)   | [   ](#eclipse-on-fedora)   |
|[VirtualBox](#virtualbox)   | [   ](#virtualbox-on-windows)  | [   ](#virtualbox-on-mac) | [-->](#virtualbox-on-ubuntu)| [-->](#virtualbox-on-fedora)|
|[Redis](#redis)             | [   ](#redis-on-windows)       | [-->](#redis-on-mac)      | [-->](#redis-on-ubuntu)     | [-->](#redis-on-fedora)     |
|[iPython](#ipython)         | [   ](#ipython-on-windows)     | [-->](#ipython-on-mac)    | [-->](#ipython-on-ubuntu)   | [-->](#ipython-on-fedora)   |
|[Bower](#bower)             | [   ](#bower-on-windows)       | [-->](#bower-on-mac)      | [-->](#bower-on-ubuntu)     | [-->](#bower-on-fedora)     |
|[Go](#go)                   | [-->](#go-on-windows)          | [-->](#go-on-mac)         | [-->](#go-on-ubuntu)        | [   ](#go-on-fedora)        |
|[Android Studio](#android-studio) | [-->](#android-studio-on-windows) | [-->](#android-studio-on-mac) | [-->](#android-studio-on-ubuntu) | [-->](#android-studio-on-fedora) |



* [General Setup](#general-setup)
* [Setup .bash_profile](#setup-bash_profile)
* [Chrome](#chrome)
* [EditThisCookie](#editthiscookie)
* [REST Console](#rest-console)
* [JSON View](#json-view)
* [Setup Android dev environment](#setup-android-dev-enviroment)

## Configuration

### Configure Windows
It is a good idea to centralize all your packages in one folder.  Not only does it help to better organize your packages, having a dedicated folder for your packages also makes navigating with command line easier.  In this instruction for Windows, all packages will be put or installed under /c/usr/bin (a.k.a "C:\usr\bin").  Please create the folder if it is not existed, and of course, feel free to name your own directory.  One popular alternative would be making an `Applications` folder under your personal folder and install all packages in there.  To reach your personal folder, you can do so by simply typing in `%USERPROFILE%` in you folder navigator.

If you are familiar with Window's PowerShell, you can create the folder by opening PowerShell and run:
```sh
mkdir -p /c/usr/bin
```
[BACK TO TOP](#table-of-contents)


### Run as Administrator
For Windows's default command prompt or PowerShell, you will sometimes need the administrative permission to perform some tasks.  To run as administrator, right click on the `cmd.exe` or `powershell.exe` and select `Run as Administrator` option from the list.

[BACK TO TOP](#table-of-contents)


### Environment Variables
For Windows users, it is necessary to modified the Environment Variables (EV) so that some applications can be accessed through [terminal](#terminal).

Follow the steps to reach the interface of EV:
<br>
Right click `My Computer` -> click `Properties` -> click `Environment Variables`

Whenever a new application is installed and you want to access it through terminal, you can press `New` under the `System variables` section to add the application's path as an enviroment variable.

For `Variable name`, the convention is to use the upper case of the application's name and then concatenate it with `_HOME` (e.g. Python would be `PYTHON_HOME`).

For `Variable value`, just enter the full path of the application.

Once new EV is added, select `Path` row under the `User variables` section, and click the `Edit` button on below.  Go to the end of its `Variable value` and append the name of EV that you just created with a `;` as separator.  Click `OK` and you are done.

[BACK TO TOP](#table-of-contents)



## Terminal
[Terminal](http://en.wikipedia.org/wiki/Command-line_interface), sometime also known as the command line interface (cli) is used to interact with computer programs.

* [**Windows**](#terminal-on-windows)
* [**Mac**](#terminal-on-mac)
* [**Ubuntu**](#terminal-on-ubuntu)
* [**Fedora**](#terminal-on-fedora)

### Terminal on Windows
We are just going to use the Git Bash that comes with [Git](#git-on-windows).

[BACK TO TOP](#table-of-contents)


### Terminal on Mac
You can either use the system default terminal, or you can also use [iTerm2](#iterm2), which is an enhanced terminal for Mac.

[BACK TO TOP](#table-of-contents)


### Terminal on Ubuntu
For Ubuntu, Fedora, and all other Unix/Linux base operating system users, you can either use the system default terminal, or some other terminal applications, such as [Tilda](#tilda) or [Guake](#guake).

[BACK TO TOP](#table-of-contents)


### Terminal on Fedora
See [Ubuntu](#terminal-on-ubuntu)

[BACK TO TOP](#table-of-contents)



## Zsh
Zsh stands for Z shell is a Unix base interactive login shell.  You can learn more about it on its [Wiki](http://en.wikipedia.org/wiki/Zsh) page.

* [**Mac**](#zsh-on-mac)
* [**Ubuntu**](#zsh-on-ubuntu)
* [**Fedora**](#zsh-on-fedora)

#### Zsh on Mac
```sh
brew install zsh
```
[BACK TO TOP](#table-of-contents)


#### Zsh on Ubuntu
```sh
sudo apt-get update
sudo apt-get install zsh
```
[BACK TO TOP](#table-of-contents)


#### Zsh on Fedora
```sh
sudo yum install zsh
```
[BACK TO TOP](#table-of-contents)



## Wget
`wget` utility is a free, open-source, command-line tool that downloads content from internet

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



## Oh-My-Zsh
Oh-My-Zsh is an framework for managing your ZSH configuration.  You can learn more about it on its [homepage](http://ohmyz.sh/), or on its [git repository](https://github.com/robbyrussell/oh-my-zsh)

* [**Mac**](#oh-my-zsh-on-mac)
* [**Ubuntu**](#oh-my-zsh-on-ubuntu)
* [**Fedora**](#oh-my-zsh-on-fedora)

### Oh-My-Zsh on Mac
According to the README file on [here](https://github.com/robbyrussell/oh-my-zsh#via-curl), installing oh-my-zsh on Mac can be done by executing this line into your terminal.
```sh
curl -L http://install.ohmyz.sh | sh
```
[BACK TO TOP](#table-of-contents)


### Oh-My-Zsh on Ubuntu
You need [Git](git-on-ubuntu) and [Zsh](zsh-on-ubuntu) as the prerequisites.

Once you have installed the prerequisites, you can:
```sh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
sudo chsh -s `which zsh`
```
[BACK TO TOP](#table-of-contents)


### Oh-My-Zsh on Fedora
You need [Git](git-on-fedora) and [Zsh](zsh-on-fedora) as the prerequisites.

Once you have installed the prerequisites, you can:

```sh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
sudo chsh -s `which zsh`
```
[BACK TO TOP](#table-of-contents)



## Homebrew
Homebrew is a package manager for **Mac**.  You can learn more about it on its [homepage](http://brew.sh/)

Since Mac comes with Ruby by default, you can install Homebrew by running:
```sh
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```
[BACK TO TOP](#table-of-contents)



## Sublime
[**Sublime**](http://www.sublimetext.com/) is a very useful and convenient text editor.

* [**Windows**](#sublime-on-windows)
* [**Ubuntu**](#sublime-on-ubuntu)
* [**Fedora**](#sublime-on-fedora)
* [**Configuration**](#sublime-configuration)

### Sublime on Windows
You can download `Sublime` from its [homepage](www.sublimetext.com).

Once the exe file is downloaded, double click to install it.

[BACK TO TOP](#table-of-contents)


### Sublime on Ubuntu
You can install it on Ubuntu through PPA.
To add the sublime PPA, run:
```sh
sudo add-apt-repository ppa:webupd8team/sublime-text-2
sudo apt-get update
```

Once the PPA is added and updated, you can install Sublime by running:
```sh
sudo apt-get install sublime-text
```

If you prefer to install Sublime manually, you can follow the instruction for [Fedora](#sublime-on-fedora) instead.

[BACK TO TOP](#table-of-contents)


### Sublime on Fedora
Please make sure you have root permission and then you can install Sublime manually by copy and paste the following script into terminal:

For 64-bit System:
```sh
wget http://c758482.r82.cf2.rackcdn.com/Sublime\ Text\ 2.0.2\ x64.tar.bz2
tar vxjf Sublime\ Text\ 2.0.2\ x64.tar.bz2
sudo mv Sublime\ Text\ 2 /opt/sublime
sudo rm -rf Sublime\ Text\ 2.0.2\ x64.tar.bz2
sudo ln -s /opt/sublime/sublime_text /usr/bin/subl
```

For 32-bit System:
```sh
wget http://c758482.r82.cf2.rackcdn.com/Sublime\ Text\ 2.0.2.tar.bz2
tar vxjf Sublime\ Text\ 2.0.2.tar.bz2
sudo mv Sublime\ Text\ 2 /opt/sublime
sudo rm -rf Sublime\ Text\ 2.0.2.tar.bz2
sudo ln -s /opt/sublime/sublime_text /usr/bin/subl
```
[BACK TO TOP](#table-of-contents)


### Sublime Configuration
Once Sublime is successfully installed, you can use it to open a single file by running:
`subl <FILE_PATH>`, or open all files of the current directory by running `subl .`

#### Package Control
**Package Control** is the simplest way of install packages to sublime. You can learn about how to install Package Controll from [here](https://sublime.wbond.net/installation#st2).

[BACK TO TOP](#table-of-contents)


#### Setup Desktop Icon:
```sh
sudo touch /usr/share/applications/sublime.desktop

content="
[Desktop Entry]
Version=1.0
Type=Application
Name[en]=Sublime 2.0.2
Icon=/opt/sublime/Icon/256x256/sublime_text.png
Exec="/opt/sublime/sublime_text.sh" %f
Comment=The text editor you will fall in love with
Categories=GNOME;GTK;Utility;TextEditor;Development;IDE;
Terminal=false
GenericName=Text Editor

";

echo "$content" >> /usr/share/applications/sublime.desktop;
```
[BACK TO TOP](#table-of-contents)



## Git
[**Git**](http://git-scm.com/) is a distributed version control and code management system.

* [**Windows**](#git-on-windows)
* [**Mac**](#git-on-mac)
* [**Ubuntu**](#git-on-ubuntu)
* [**Fedora**](#git-on-fedora)
* [**Configuration**](#git-configuration)

### Git on Windows
Since Git contains many convenient built-in functions as well as a useful bash shell, it is recommended to be installed first in setting up the dev environment on Windows.

You can download the latest git install file for Windows from [here](http://git-scm.com/download/win)

Once the installation file is downloaded, install it under /c/usr/bin/git or whatever directory you chose.  Don't worry about the configuration choices available during the installation process, it would be fine to just keep them in default.

### Git on Mac
Git should've come with Mac by default.  You can verify your git version by opening your terminal and running:
```sh
git --version
```

If git does not come with your Mac somehow, you can follow their [instruction](http://git-scm.com/book/en/Getting-Started-Installing-Git) to install git manually.

Or you can install it through [Homebrew](#homebrew) by running:
```sh
brew install git
```
[BACK TO TOP](#table-of-contents)


### Git on Ubuntu
To install git on Ubuntu:
```sh
sudo apt-get update
sudo apt-get install git
```

To upgrade to the latest version of Git, you can do so by running:
```sh
sudo apt-get upgrade git
```
[BACK TO TOP](#table-of-contents)


### Git on Fedora
To install git on Fedora:
```sh
sudo yum install git
```

To upgrade git on Fedora:
```sh
sudo yum upgrade git
```
[BACK TO TOP](#table-of-contents)


### Git Configuration
Once Git is installed, you can check about its version using `git -v`.

There are some shortcuts are very convenient as well, you can set them up with following:
```sh
git config --global alias.co checkout
git config --global alias.cm !git add -A && git commit -m
```
[BACK TO TOP](#table-of-contents)



## Gitg
Gitg is a graphic user interface for git.

* [**Ubuntu**](#gitk-on-ubuntu)
* [**Fedora**](#gitk-on-fedora)

### Gitg on Ubuntu
```sh
sudo apt-get install gitg
```
[BACK TO TOP](#table-of-contents)


### Gitg on Fedora
```sh
sudo yum install gitg
```
[BACK TO TOP](#table-of-contents)



## Gitk
Gitk is a graphic user interface for git.

* [**Ubuntu**](#gitk-on-ubuntu)
* [**Fedora**](#gitk-on-fedora)

### Gitk on Ubuntu
```sh
sudo apt-get install gitk
```
[BACK TO TOP](#table-of-contents)


### Gitk on Fedora
```sh
sudo yum install gitk
```
[BACK TO TOP](#table-of-contents)



## SmartGit
Similar to Gitk, SmartGit is an UI for git too, yet it has more functionalities than Gitk.  However, it is not free.

* [**Ubuntu**](#smartgit-on-ubuntu)
* [**Fedora**](#smartgit-on-fedora)

### SmartGit on Ubuntu
```sh
sudo apt-get install smartgit
```
[BACK TO TOP](#table-of-contents)


### SmartGit on Fedora
```sh
sudo yum install smartgit
```
[BACK TO TOP](#table-of-contents)



## Curl
[Curl](http://curl.haxx.se/docs/manpage.html) is a tool to transfer data from or to a server.

Curl comes with Mac and some distros of Linux by default.  For Windows, it should comes with [Git](#git-on-windows).  In case Curl is not installed on your system, you can follow the instructions below to install it yourself.

* [**Windows**](#curl-on-windows)
* [**Mac**](#curl-on-mac)
* [**Ubuntu**](#curl-on-ubuntu)
* [**Fedora**](#curl-on-fedora)

### Curl on Windows
Visit [Curl](http://curl.haxx.se/download.html) to download the latest version of [`curl-[version].zip`](http://curl.haxx.se/download/curl-7.40.0.zip).

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


## Ruby

* [**Windows**](#ruby-on-windows)
* [**Mac**](#ruby-on-mac)
* [**Ubuntu**](#ruby-on-ubuntu)
* [**Fedora**](#ruby-on-fedora)

### Ruby on Windows
You can install Ruby on Windows by using [RubyInstaller](http://rubyinstaller.org/downloads/) with either the [x86 installer](http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.2.1.exe) or [x64 installer](http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.2.1-x64.exe) based on your operation system.

To download the installer through command line, you can do so by running:
For 64-bit system:
```sh
curl --remote-name "http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.2.1-x64.exe"
```

For 32-bit system:
```sh
curl --remote-name "http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.2.1.exe"
```

Install Ruby under /c/usr/bin/ruby or whatever directory you chose

Once the installation is done, the executable `ruby.exe` should then be under:
`/c/usr/bin/ruby/bin`

Run git bash as administrator, then create a symbolic link by running:
```sh
ln -s /c/usr/bin/ruby/bin/ruby.exe /usr/bin/ruby.exe
```

Verify the symbolic link is working properly by running:
```sh
which ruby # should see /usr/bin/ruby
```

If there is error saying ruby is not found on sh.exe, restart the git bash and redo the verification.

Once you restarted the git bash and verified ruby is installed on your machine, you can check its version by running:
```sh
ruby --version
```

If you want to call Ruby from the PowerShell of Windows's default terminal, you need to add Ruby to the system environment vairables.


#### devkit
devkit is the prerequisite for Rails on Windows.  You can download its latest version for Windows from [here](http://rubyinstaller.org/downloads/).

Scroll down to "Other Userful Downloads" and it is under "development kit" section.

Choose the appropriate devkit to download, either [x86](http://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe) or [x64](http://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe) based on your operation system.

Once the download is done, double click on the executable file and install/unzip it to /c/usr/bin/devkit, or whatever directory you chose.

Run git bash as administrator and go to the directory of devkit by running:
```sh
cd /c/usr/bin/devkit
```

Initialize the devkit and then install it by running:
```sh
ruby dk.rb init
ruby dk.rb install
```

If there is no error shows up, the setup is successful.

[BACK TO TOP](#table-of-contents)


### Ruby on Mac
Mac should have Ruby installed by default and it is the prerequisite for installing Rails.  To verify it, you can open your terminal and run:
```sh
ruby --version
```
It should show you the version of your currently installed Ruby.

If Ruby does not come with your Mac somehow or you want to have a newer version of Ruby, you can get it with these approaches:
1. Download the latest Ruby from its [homepage](https://www.ruby-lang.org/en/downloads/) and install it manually according to its instruction.
2. Install the latest version of Ruby through [Homebrew](#homebrew) by running `brew install ruby`.
3. Use RVM to install Ruby, see the instruction for [**Ubuntu**](#ruby-on-ubuntu).

[BACK TO TOP](#table-of-contents)


### Ruby on Ubuntu
Since Ruby Version Manager (RVM) is also available for Linux and other Unix-like operation system, you can install Ruby easily through using RVM.  You can learn more about RVM on their home page: `https://rvm.io/`
RVM is a convenient way to manage multiple versions of Ruby and Rails (e.g. the system default version and the latest version) because sometimes you may want to keep the older version of Ruby to keep the compatibility or whatever.

To install RVM and Ruby, you need to have [Curl](#curl-on-ubuntu), follow the instruction to get it if you haven't have it.

To install the latest RVM along with the latest stable RVM + Ruby, you can simply run:
```sh
\curl -sSL https://get.rvm.io | bash -s stable --ruby
```

Similarly, you can install the latest stable version of RVM + Ruby + Rails by running:
```sh
\curl -sSL https://get.rvm.io | bash -s stable --rails
```

If you already have RVM setup, you can update it to the latest version by running:
```sh
rvm get stable
```

Once installation is done, you can verify it by running:
```sh
ruby -v
```

To select the latest ruby version as the default:
```sh
rvm --default <ruby_version>
```

To setup the Ruby environment, you can simply check if the Ruby environment is setup by a RVM command:
```sh
rvm requirements
```

While installing gems, the process will automatically generate documents, which can be time consuming.  If you perfer online documents over local generated ones, you can skip the auto documents generating process, which would save you some time.

To disable the process, you can create a gem configuration file by running:
```sh
subl ~/.gemrc
```

and then paste and save the following two lines into `.gemrc`
```sh
install: --no-rdoc --no-ri
update:  --no-rdoc --no-ri
```
[BACK TO TOP](#table-of-contents)


### Ruby on Fedora
Same as Ubuntu, see the instruction for [**Ubuntu**](#ruby-on-ubuntu).

[BACK TO TOP](#table-of-contents)



## Rails

* [**Windows**](#rails-on-windows)
* [**Mac**](#rails-on-mac)
* [**Ubuntu**](#rails-on-ubuntu)
* [**Fedora**](#rails-on-fedora)

### Rails on Windows
Ruby and devkit are the prerequisite for Rails.  To verify both Ruby and devkit are installed in your machine, run the following lines on your git bash:
```sh
which ruby # should see a path similar to /c/usr/bin/ruby/bin/ruby
which gem # should see a path similar to /c/usr/bin/devkit/gem
```

Then run following line to install Rails:
```sh
gem install rails
```

Once installation is done, verify it by running:
```sh
which rails # should see a path similar to /c/usr/bin/rails/rails
rails -v # should see the version of rails
```
[BACK TO TOP](#table-of-contents)


## Rails on Mac
As it is shown [here](#ruby-on-mac) earlier, Mac should have come with Ruby by default.  Therefore, you can install Rails through terminal by simply running:
```sh
gem install rails
```

To install latest stable Rails through RVM, you can simply run:
```sh
\curl -sSL https://get.rvm.io | bash -s stable --rails
```

Once installation is done, verify it through running:
```sh
which rails
rails -v
```

If you encounter issue while running `gem install pg`, you need to install PostgreSQL and you can do so by follow the instruction [here](#postgresql-on-mac).

[BACK TO TOP](#table-of-contents)


## Rails on Ubuntu
Please follow the same instruction of [Mac](#rails-on-mac).

If you come across an error that compliant about no having a Javascript runtime environment, you can resolve it by installing [Node.js](#nodejs-on-ubuntu).
[BACK TO TOP](#table-of-contents)


## Rails on Fedora
Please follow the same instruction of [Mac](#rails-on-mac).

[BACK TO TOP](#table-of-contents)



## Java
Both Java 7 and 8 are available today.  This instruction will focus on Java 7, but the processes are similar to Java 8.

* [**Windows**](#java-on-windows)
* [**Mac**](#java-on-mac)
* [**Ubuntu**](#java-on-ubuntu)
* [**Fedora**](#java-on-fedora)

### Java on Windows
Download the latest Java for Windows from [Oracle](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html).

Choose the appropriate Thread Safe zip to download, either [Windows x86](http://download.oracle.com/otn-pub/java/jdk/7u75-b13/jdk-7u75-windows-i586.exe) or [Windows x64](http://download.oracle.com/otn-pub/java/jdk/7u75-b13/jdk-7u75-windows-x64.exe) based on your operation system.

Run the downloaded executable file and install java under:
```sh
/c/usr/bin/java
```
Run git bash as administrator, then go to the bin of git bash by running:
```sh
cd /usr/bin
```

Create a symbolic link by running:
```sh
ln -s /c/usr/bin/java/java.exe java.exe
```

Verify the symbolic link is working properly by running:
```sh
which java # should see /usr/bin/java
java -version
```

if there is error saying java is not found on sh.exe, restart the git bash and run above line again.

[BACK TO TOP](#table-of-contents)


### Java on Mac
Download the latest Java for Mac from [Oracle](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html).

Follow the instruction on there to read and accept the license agreement, then click the download link for [Mac OS X x64](http://download.oracle.com/otn-pub/java/jdk/7u75-b13/jdk-7u75-macosx-x64.dmg).

Once the dmg file is downloaded, double click it to start the installation.

Once the installation is done, you can verify your Java version by running the following line on terminal:
```sh
java -version
```
[BACK TO TOP](#table-of-contents)


### Java on Ubuntu
Download the latest Java for Mac from [Oracle](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html).

Follow the instruction on there to read and accept the license agreement, then click the `tar.gz` download link for [Linux x86](http://download.oracle.com/otn-pub/java/jdk/7u75-b13/jdk-7u75-linux-i586.tar.gz) or [Linux x64](http://download.oracle.com/otn-pub/java/jdk/7u75-b13/jdk-7u75-linux-x64.tar.gz) based on your operation system.

Once the dmg file is downloaded, double click it to start the installation.

Alternatively, you can use PPA to install Oracle Java as well.
```sh
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer
```

If you want to install OpenJDK on Ubuntu, you can do so by running:
```sh
sudo apt-get update
sudo apt-get install openjdk-7-jdk
```

Once installation process is done, you can verify the version of Java by running:
```sh
java -version
```
[BACK TO TOP](#table-of-contents)


### Java on Fedora
To install Oracle Java for Ubuntu, follow the same process for [Ubuntu](#java-on-ubuntu).

Similarily, if you want to install OpenJDK on Fedora, you can do so by running:
```sh
sudo yum install java-1.7.0-openjdk-devel
```
[BACK TO TOP](#table-of-contents)



## Python

* [**Windows**](#python-on-windows)
* [**Mac**](#python-on-mac)
* [**Ubuntu**](#python-on-ubuntu)
* [**Fedora**](#python-on-fedora)

### Python on Windows
There are Python 2.x and Python 3.x available.  This instruction will focus on 2.x, but similar steps can be easily applied to 3.x as well.

Download the Python 2.7.9 for Windows from [here](https://www.python.org/downloads/release/python-279).

Under the Download tab, choose the appropriate msi file to download, either x86 or x64 based on your operation system.

You can also use the following command to download the 32-bit version:
```sh
curl --remote-name https://www.python.org/ftp/python/2.7.9/python-2.7.9.msi
```

Or use the following command to download the 64-bit version:
```sh
curl --remote-name https://www.python.org/ftp/python/2.7.9/python-2.7.9.amd64.msi
```

Once the `*.msi` file is downloaded, double click it to install under /c/usr/bin/python.

the executable python.exe should then be under:
```sh
/c/usr/bin/python/python.exe
```

Run git bash as administrator, then go to the bin of git bash by running:
```sh
cd /usr/bin
```

Create a symbolic link by running:
```sh
ln -s /c/usr/bin/python/python.exe python.exe
```

Verify the symbolic link is working properly by running:
```sh
which python # should see /usr/bin/python
python -V # using uppercase V to see the version of installed python
```

if there is error saying php is not found on sh.exe, restart the git bash and run above line again.

[BACK TO TOP](#table-of-contents)


### Python on Mac

Mac should have Python installed by default.  To verify it, you can open your terminal and run:
```sh
python --version
```
It should show you the version of your currently installed Python.

If Python does not come with your Mac somehow or you want to have a newer version of Python, (e.g. Python 3.x rather than Python 2.7.x), you can download and follow the installation instruction on Python's website:
```sh
https://www.python.org/downloads/
```

Or you can install the latest version of Python through Homebrew by running:
```sh
brew install python
```
[BACK TO TOP](#table-of-contents)


### Python on Ubuntu
Install Python can be very easy with the help from the DeadSnakes PPA:
```sh
sudo add-apt-repository ppa:fkrull/deadsnakes
sudo apt-get update
sudo apt-get install python2.7
```
[BACK TO TOP](#table-of-contents)


### Python on Fedora
```sh
sudo yum update
sudo yum install python27
```
[BACK TO TOP](#table-of-contents)



## Pip

* [**Mac**](#pip-on-mac)
* [**Ubuntu**](#pip-on-ubuntu)

### Pip on Mac
To install `pip`, you can download its installer file from [here]
(https://pip.pypa.io/en/latest/installing.html#install-pip)

Once download is completed, you can install `pip` by running:
```sh
cd ~/Downloads
sudo python get-pip.py
```

You can verify its version by running:
```sh
pip -V
```
[BACK TO TOP](#table-of-contents)


### Pip on Ubuntu
```sh
sudo apt-get install python-pip
```
[BACK TO TOP](#table-of-contents)



## Django

* [**Mac**](#django-on-mac)

### Django on Mac
```sh
sudo pip install django
```
[BACK TO TOP](#table-of-contents)



## PHP

PHP is a scripting language for web applications.

* [**Windows**](#php-on-windows)
* [**Mac**](#php-on-mac)
* [**Ubuntu**](#php-on-ubuntu)
* [**Fedora**](#php-on-fedora)

### PHP on Windows
Download the latest PHP for Windows from [here](http://windows.php.net/download/).

Choose the appropriate Thread Safe zip to download, either [VC11 x86 Thread Safe](http://windows.php.net/downloads/releases/php-5.6.7-Win32-VC11-x86.zip) or [VC11 x64 Thread Safe](http://windows.php.net/downloads/releases/php-5.6.7-Win32-VC11-x64.zip) based on your operation system.

You can also use the following command to download the 32-bit version:
```sh
curl --remote-name http://windows.php.net/downloads/releases/php-5.6.7-Win32-VC11-x86.zip
```

Or use the following command to download the 64-bit version:
```sh
curl --remote-name http://windows.php.net/downloads/releases/php-5.6.7-Win32-VC11-x64.zip
```

Unzip the downloaded file to /c/usr/bin/php, or whatever directory you chose.

the executable php.exe should then be under:
```sh
/c/usr/bin/php/php.exe
```

Run git bash as administrator, then go to the bin of git bash by running:
```sh
cd /usr/bin
```

Create a symbolic link by running:
```sh
ln -s /c/usr/bin/php/php.exe php.exe
```

Verify the symbolic link is working properly by running:
```sh
which php # should see /usr/bin/php
```

if there is error saying php is not found on sh.exe, restart the git bash and run above line again.

[BACK TO TOP](#table-of-contents)


### PHP on Mac
PHP is bundled with Mac.

[BACK TO TOP](#table-of-contents)


### PHP on Ubuntu
Installing PHP on Ubuntu is as simple as running:
```sh
sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt
```

Once installation is done, you can verify it by running:
```sh
php -v
```
[BACK TO TOP](#table-of-contents)


### PHP on Fedora
Installing PHP on Fedora should be pretty straightforward if you configuration is correct.
```sh
sudo yum install php
```

**Known Issue for Fedora**
<br>
1. None of the mirrors contains the required packages
<br>
**Solution**: enable fedora-source
<br>
```sh
yum repolist disabled
sudo yum-config-manager --enable fedora-source
sudo yum install php
```
[BACK TO TOP](#table-of-contents)



## Node.js
Node.js is an platform for Javascript.  To install Node.js, download the install file from its [homepage](http://nodejs.org/download).

Once download is done, double click the file and follow the instruction to install it into your computer.

Once installation is done, Node.js and Node Packaged Modules (npm) should be ready on your computer.

You can verify them by running:
```sh
node -v
npm -v
```

* [**Mac**](#nodejs-on-mac)
* [**Ubuntu**](#nodejs-on-ubuntu)
* [**Fedora**](#nodejs-on-fedora)

### Node.js on Mac
Alternatively, you can install Node.js through [Homebrew](#homebrew).
```sh
brew intall node
```
[BACK TO TOP](#table-of-contents)


## Node.js on Ubuntu
```sh
sudo apt-get install nodejs
```
[BACK TO TOP](#table-of-contents)

If you want to have the latest version of Node.js, you can install it through PPA maintained by Chris Lea.  You can do so by running:
```sh
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs
```
[BACK TO TOP](#table-of-contents)


### Node.js on Fedora
```sh
sudo yum install nodejs
```
[BACK TO TOP](#table-of-contents)



## npm
npm is a package manager for Node.js

* [**Ubuntu**](#npm-on-ubuntu)

### npm on Ubuntu
npm is a tool to manage the packages used by [Node.js](#nodejs)
```sh
sudo apt-get install npm
```
[BACK TO TOP](#table-of-contents)


## CoffeeScript

* [**Mac**](#gradle-on-mac)

### CoffeeScript on Mac
Before install CoffeeScript, you need to make sure you have [Node.js](#nodejs) and Node Packaged Modules (npm) installed.  To verify that, just run:
```sh
node -v
npm -v
```
Both of them should return version number.

To install CoffeeScript, you can do so by running:
```sh
npm install -g coffee-script
```
You may need root permission to install it.


[BACK TO TOP](#table-of-contents)


## Express

* [**Mac**](#express-on-mac)

### Express on Mac
Express is a web development framework for node.js. You can install it by running:
```sh
sudo npm install -g express-generator
```

Once installation is done, open a terminal window and verify it by running:
```sh
express --version
```

[BACK TO TOP](#table-of-contents)


## Nodemon
Nodemon is a monitoring plugin that restart node.js application automatically if there is any changes happened to the code.

* [**Mac**](#nodemon-on-mac)

### Nodemon on Mac
```sh
sudo npm install -g nodemon
```

Once installation is done, open a terminal window and verify it by running:
```sh
nodemon -v
```

[BACK TO TOP](#table-of-contents)


## OpenSSL

* [**Ubuntu**](#openssl-on-ubuntu)

### OpenSSL on Ubuntu
Ubuntu comes with OpenSSL, but it may need to be upgraded because of the [Heartbleed Bug](http://heartbleed.com/).  Moreover, newer version of OpenSSL is also required to install the latest Rails.

You can upgrade OpenSSL by running:
```sh
sudo apt-get upgrade openssl
```

[BACK TO TOP](#table-of-contents)


## Gradle
Gradle is a build tool for project, you can learn more about it on its [homepage](http://www.gradle.org/)

* [**Windows**](#gradle-on-windows)
* [**Mac**](#gradle-on-mac)
* [**Ubuntu**](#gradle-on-ubuntu)

### Gradle on Windows
Gradle is a build tool for project, you can learn more about it on its [homepage](http://www.gradle.org)

To install Gradle on Windows, you can download its zip file from [here](http://www.gradle.org/downloads) and unzip it to `/c/usr/bin/gradle` or whatever folder you like.

Once the file is unzipped into the proper location, you can run git bash as administrator, then create a symbolic link by running:

```sh
cd /usr/bin
ln -s /c/usr/bin/gradle/gradle.exe gradle.exe
```

Verify the symbolic link is working properly by running:
```sh
which gradle # should see /usr/bin/gradle
gradle -v # should see version number
```

[BACK TO TOP](#table-of-contents)


### Gradle on Mac
Gradle is a build tool for project, you can learn more about it on its [homepage](http://www.gradle.org/)

To install gradle, the simplest way would be to install it through [Homebrew](#homebrew)

Once you have Homebrew, you can install Gradle by running:
```sh
brew install gradle
```

Once installation is done, you can verify it by running:
```sh
gradle -v
```

[BACK TO TOP](#table-of-contents)


### Gradle on Ubuntu
If you prefer installing Gradle mannually, you can follow the instruction [here](#gradle-on-fedora).

Otherwise, thanks to a PPA made by [Cheng-Wei Chien](https://launchpad.net/~cwchien), the installation process of Gradle on Ubuntu is pretty straightforward.

First of all, add the PPA repository:
```sh
sudo add-apt-repository ppa:cwchien/gradle
sudo apt-get update
```

Secondly, check about which versions are available:
```sh
sudo apt-cache search gradle
```

Lastly, install the version you want:
```sh
sudo apt-get install gradle-<__version_number__> # e.g. sudo apt-get install gradle-1.12
```

[BACK TO TOP](#table-of-contents)

### Gradle on Fedora
To install Gradle on Fedora or other Linux/Unix base distro, you need to do so mannually.

First of all, visit the [here](http://www.gradle.org/downloads) and download the version you are interesting.

Once download is done, unzip the file and the move the folder under `/opt`.

Afterwards, configure the PATH to make Gradle available in terminal, and there are multiple way to achieve this:

**Add Symbolic Link**
<br>
The easiest way is to create a symbolic link for Gradle on `/usr/bin`; since `/usr/bin` is the system default path, it will be loaded automatically whenever `.bashrc` is loaded.
```sh
sudo ln -s /opt/gradle-1.12/bin/gradle /usr/bin/gradle
```

**Add to ~/.bash_profile**
<br>
You can also add the `GRADLE_HOME` to `~/.bash_profile` and export it so that you can just `source ~/.bash_profile` when you need it.

To do so, you first need to determine if `~/.bash_profile` is existed in you system.  If not, you need to create it.
```sh
ls ~/.bash_profile # should return the full path if ~/.bash_profile is existed
touch ~/.bash_profile # if not create the file
```

Once `~/.bash_profile` is there, open it using `vi` or whatever editor you prefer, and add these two line to the end of the file:
```sh
export GRADLE_HOME="/opt/<gradle_folder_name>/bin"
export PATH=$GRADLE_HOME:$PATH
```
`<gradle_folder_name>` is something similar to `gradle-1.12` and etc.

Once you are done adding those lines, save and exist the editor and you are good to go.  Just do `source ~/.bash_profile` before you need to use Gradle.


**Add to ~/.bashrc**
<br>
Alternatively, if you use Gradle on a daily basis, you may consider just adding the `GRADLE_HOME` to your `~/.bashrc` because it will then be automatically loaded whenever you open your terminal.

To do so, it is very similar to the instruction of adding it to `~/.bash_profile`, but since `~/.bashrc` always exist, you can just open it with `vi` and add the lines to the end of it.
```sh
export GRADLE_HOME="/opt/<gradle_folder_name>/bin"
export PATH=$GRADLE_HOME:$PATH
```
Again, `<gradle_folder_name>` is something similar to `gradle-1.12` and etc.

Once you are done adding those lines, save and exist the editor and you are good to go. Gradle wuold be ready to use whenever you open a terminal.

Or you can run the script here:
```sh
wget https://services.gradle.org/distributions/gradle-1.12-bin.zip
unzip gradle-1.12-bin.zip
sudo mv gradle-1.12 /opt
sudo rm gradle-1.12-bin.zip
sudo ln -s /opt/gradle-1.12/bin/gradle /usr/bin/gradle
```

[BACK TO TOP](#table-of-contents)


## WAMP
Download the latest WAMP for Windows from [here](http://www.wampserver.com/en/)

Choose the appropriate Thread Safe zip to download, either x86 or x64 based on your operation system.

Install the downloaded file to /c/usr/bin/wamp, or whatever directory you chose. Keep installation configurations default.

[BACK TO TOP](#table-of-contents)


## MAMP
Visit MAMP's download page [here](http://www.mamp.info/en/downloads/) to download the latest version of MAMP.

Once download is done, double click the `.pkg` file to install.

[BACK TO TOP](#table-of-contents)

## LAMP

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


## SQLite

* [**Windows**](#sqlite-on-windows)
* [**Mac**](#sqlite-on-mac)
* [**Ubuntu**](#sqlite-on-ubuntu)

### SQLite on Windows
Download the latest SQLite for Windows from [here](http://www.sqlite.org/download.html)

Scroll down the page to the "Precompiled Binaries for Windows" section, and download the sqlite-shell and sqlite-dll files.

Or run the following lines on your git bash:
```sh
cd ~
curl --remote-name "http://www.sqlite.org/2015/sqlite-shell-win32-x86-3080803.zip"
curl --remote-name "http://www.sqlite.org/2015/sqlite-dll-win32-x86-3080803.zip"
```

Once both files are downloaded, unzip both of them to /c/usr/bin/sqlite, or whatever directory you chose.

Run git bash as administrator, then go to the bin of git bash by running:
```sh
cd /usr/bin
```

Create a symbolic link by running:
```sh
ln -s /c/usr/bin/sqlite/sqlite.exe sqlite.exe
```

Verified sqlite is installed and properly linked on your machine by running:
```sh
sqlite -v
```
[BACK TO TOP](#table-of-contents)


### SQLite on Mac
```sh
brew install sqlite3
```
[BACK TO TOP](#table-of-contents)


### SQLite on Ubuntu
```sh
sudo apt-get install sqlite3 libsqlite3-dev
```
[BACK TO TOP](#table-of-contents)



## MySQL

* [**Mac**](#mysql-on-mac)
* [**Ubuntu**](#mysql-on-ubuntu)
* [**Fedora**](#mysql-on-fedora)

### MySQL on Mac
If you use [Homebrew](#homebrew) as your package manager, installing MySQL is very simple.
```sh
brew install mysql
```
[BACK TO TOP](#table-of-contents)


### MySQL on Ubuntu
```sh
sudo apt-get install mysql-server
```
[BACK TO TOP](#table-of-contents)


### MySQL on Fedora
```sh
sudo yum install mysql mysql-server
```
[BACK TO TOP](#table-of-contents)



## PostgreSQL
PostgreSQL is similar to MySQL and it is the default database used on Heroku.

* [**Mac**](#postgresql-on-mac)
* [**Ubuntu**](#postgresql-on-ubuntu)

### PostgreSQL on Mac
```sh
brew update
brew install postgresql
```
[BACK TO TOP](#table-of-contents)


### PostgreSQL on Ubuntu
```sh
sudo apt-get install postgresql
```
[BACK TO TOP](#table-of-contents)



## Guake

* [**Ubuntu**](#guake-on-ubuntu)
* [**Fedora**](#guake-on-fedora)

### Guake on Ubuntu
```sh
sudo apt-get install guake
```
[BACK TO TOP](#table-of-contents)


### Guake on Fedora
To install Guake on Fedora, you can do so by running:
```sh
sudo yum install guake
```
[BACK TO TOP](#table-of-contents)



## Chef
[**Chef**](https://www.chef.io/) is a tool for provisioning servers.

* [**Mac**](#chef-on-mac)
* [**Chef Tools**](#chef-tools)
	* [**Knife-solo**](#knife-solo)
	* [**Librarian-Chef**](#librarian-chef)

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

Once downloaded, naviagate to the download destination, and execute:
```sh
sudo dpkg -i vagrant*
```
[BACK TO TOP](#table-of-contents)


### Vagrant on Fedora
Visit [Vagrant's download page](https://www.vagrantup.com/downloads.html) and download the `.rpm` file for Fedora.
```sh
rpm -U vagrant*
```
[BACK TO TOP](#table-of-contents)



## Eclipse
Eclipse is an integrated development environment (IDE) and you can learn more about it on its [homepage](http://www.eclipse.org/).  

Although it is now recommended to use [Android Studio](#android-studio) for Android development, you can use eclipse as your IDE if you prefer to.  I use one of its variant called [Eclipse IDE for Java Developers](http://www.eclipse.org/downloads/packages/eclipse-ide-java-developers/lunar) because it is relatively smaller than other variants.  You can feel to use the [standard one](http://www.eclipse.org/downloads/packages/eclipse-standard-44/lunar) or other of its variant as well.

* [**Mac**](#eclipse-on-mac)
* [**Ubuntu**](#eclipse-on-ubuntu)
* [**Fedora**](#eclipse-on-fedora)

### Eclipse on Mac
Visit the Eclipse's [homepage](http://www.eclipse.org/downloads) and download the **Eclipse IDE for Java Developers** that fits your system (either 32 or 64 bit)

Once the file is downloaded, unzip it and drag the unziped folder to application, then right click the eclipse icon inside the folder and click open.

[BACK TO TOP](#table-of-contents)


### Eclipse on Ubuntu
```sh
sudo apt-get install eclipse
```
[BACK TO TOP](#table-of-contents)


### Eclipse on Fedora
```sh
sudo yum install eclipse
```
[BACK TO TOP](#table-of-contents)



## Android SDK
You can get Android SDK from its [developer page](http://developer.android.com/sdk/index.html) under **Get SDK for an existing IDE**.

Once the compressed file is downloaded, unzip it and place it in the same folder of eclipse, or whatever folder you like.

Follow the installation process for your system:

* [**Windows**](#sdk-on-windows)
* [**Mac**](#sdk-on-mac)
* [**Ubuntu**](#sdk-on-ubuntu)
* [**Fedora**](#sdk-on-fedora)

Navigate to the SDK folder and open its user interface, which would to let you select SDKs and tools to download.

You need the following packages from the SDK:
```sh
./Tools/Android SDK Tools
./Tools/Android SDK Build-tools
./Tools/Android SDK Platform-tools
./Extra/Android Support Repository
./Extra/Android Support Library
./<whatever_API_version>/SDK Platform
./<whatever_API_version>/ARM EABI v7a System Image
```

Select those package and click on the "install packages" button on the bottom right, and then follow the instruction to complete the installation.

### SDK on Windows
Choose the appropriate Thread Safe zip to download, either x86 or x64 based on your operation system.

unzip the downloaded file to `/c/usr/bin/android`, or whatever directory you chose.

Navigate to the directory and open the SDK Manager:
```sh
cd /c/usr/bin/android/
open SDK\ Manager.exe
```

Select the packages listed in [here](#android-sdk) to install.

[BACK TO TOP](#table-of-contents)


### SDK on Mac
You can get Android SDK from its [developer page](http://developer.android.com/sdk/index.html) under "Get SDK for an existing IDE".

Once downloaded, unzip and place it in the same folder of eclipse, or whatever folder you like.

Open terminal, then running:
```sh
cd <whatever_folder_path>/sdk/tools
./android sdk
```
Once the command lines in above is executed, it should popup an user interface to let you select SDKs and tools to download.

You need the following package from the SDK:
```sh
./Tools/Android SDK Tools
./Tools/Android SDK Build-tools
./Tools/Android SDK Platform-tools
./Extra/Android Support Repository
./Extra/Android Support Library
./<whatever_API_version>/SDK Platform
./<whatever_API_version>/ARM EABI v7a System Image
```

Select those package and click on the "install packages" button on the bottom right, and then follow the instruction to complete the installation.

[BACK TO TOP](#table-of-contents)


### SDK on Ubuntu
Visit the [developer page](http://developer.android.com/sdk/index.html) and download the [SDK Tool only for Linux 32 and 64 bit](http://dl.google.com/android/android-sdk_r23.0.2-linux.tgz)

Once download is done, unzip it and move it to the `/opt/android-sdk-linux` folder, then add `export ANDROID_HOME=/opt/android-sdk-linux` to the `~/.bash_profile`.

#### Compatibility issue on Ubuntu
If you are in Linux 64 bit OS, you may also need to install the 32 bit shared libraries.
```sh
sudo apt-get install libc6:i386 libstdc++6:i386 zlib1g:i386
```
[BACK TO TOP](#table-of-contents)


### SDK on Fedora
Follow the same instruction as [Ubuntu](#sdk-on-ubuntu).

#### Compatibility issue on Fedora
If you are in Linux 64 bit OS, you may also need to install the 32 bit shared libraries.
```sh
sudo yum install glibc.i686 glibc-devel.i686 libstdc++.i686 zlib-devel.i686 ncurses-devel.i686 libX11-devel.i686 libXrender.i686 libXrandr.i686
```
[BACK TO TOP](#table-of-contents)



## ADT
ADT stands for Android Development Toolkit.  

Once Eclipse is installed, open it and navigate to its Help -> Install New Software.

On the wizard of Install New Software, click on the add button and paste `https://dl-ssl.google.com/android/eclipse/` to `location` and put `Android Development Toolkit plugin` on `name`, then press OK.

Back to the wizard, click on the drop down list of `Work with`  and select the url item that you just added.

It may take a while for eclipse to get the plugin information, but once the available plugin is displayed, click `Select All` under the displaying section, and then `Next` on the bottom right.  Then follow the instruction to install and plugin and restart Eclipse once the installation is done.

### ADT known errors
* [src folder empty on creating new Android project](http://stackoverflow.com/questions/22215499/src-folder-empty-on-creating-new-android-project)
<br>
Solution: make sure the url used to install the ADT starts with `https`, not `http`.

[BACK TO TOP](#table-of-contents)



## VirtualBox
VirtualBox is a tool for setting up virtualization machine.

* [**Windows**](#virtualbox-on-windows)
* [**Mac**](#virtualbox-on-mac)
* [**Ubuntu**](#virtualbox-on-ubuntu)
* [**Fedora**](#virtualbox-on-fedora)

### VirtualBox on Windows
Visit [VirtualBox's download page](https://www.virtualbox.org/wiki/Downloads) and download the `.exe` file for Windows.

Once downloaded, double click to install.

[BACK TO TOP](#table-of-contents)


### VirtualBox on Mac
Visit [VirtualBox's download page](https://www.virtualbox.org/wiki/Downloads) and download the `.dmg` file for Mac.

Once downloaded, double click to install.

[BACK TO TOP](#table-of-contents)


### VirtualBox on Ubuntu
The easy way is to use `apt-get`, but it may not be the latest version.
```sh
sudo apt-get install virtualbox
```

You can download and install the latest version manually.

For Ubuntu 13.04 and above, you can download the [**x86 `deb` file**](http://download.virtualbox.org/virtualbox/4.3.22/virtualbox-4.3_4.3.22-98236~Ubuntu~raring_i386.deb) or [**x64 `deb` file**](http://download.virtualbox.org/virtualbox/4.3.22/virtualbox-4.3_4.3.22-98236~Ubuntu~raring_amd64.deb), navigate to the download destination, and then install it with command: `sudo dpkg -i virtualbox*`.

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

Then, perform another `sudo yum update` and install the reuqired llibraries:
```sh
sudo yum install kernel-devel dkms binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers
```

Once the libraries are installed, you can install VirtualBox:
```sh
sudo yum install VirtualBox-4.3.x86_64
```
[BACK TO TOP](#table-of-contents)



## PyCharm
PyCharm is an IDE based on IntelliJ IDEA for Python development.

* [**Windows**](pycharm-on-windows)
* [**Mac**](pycharm-on-mac)
* [**Ubuntu**](pycharm-on-ubuntu)
* [**Fedora**](pycharm-on-fedora)

### PyCharm on Windows
Donwload PyCharm from its home page on [here](http://www.jetbrains.com/pycharm/download/)

Once download is completed, double click the `.exe` file and follow the instruction to install.

[BACK TO TOP](#table-of-contents)


### PyCharm on Mac
Donwload PyCharm from its home page on [here](http://www.jetbrains.com/pycharm/download/)

Once download is completed, double click the `.dmg` file and follow the instruction to install.

[BACK TO TOP](#table-of-contents)


### PyCharm on Ubuntu
Donwload PyCharm from its home page on [here](http://www.jetbrains.com/pycharm/download/)

Once download is down, unzip it and move it to the `/opt/pycharm`

make a symbolic link
```sh
sudo ln -s /opt/pycharm/bin/pycharm.sh /usr/bin/pycharm
```

Setup Desktop Icon:
```sh
sudo touch /usr/share/applications/pycharm.desktop

content="
[Desktop Entry]
Name=PyCharm
GenericName=Python IDE
Type=Application
Exec=pycharm %U
Terminal=false
Icon=/opt/pycharm/bin/pycharm.png
Comment=PyCharm
NoDisplay=false
Categories=Development;IDE
Keywords=IDE;PyCharm;Development;IntelliJ
Name[en]=PyCharm
";

echo "$content" >> /usr/share/applications/pycharm.desktop;
```
[BACK TO TOP](#table-of-contents)


### PyCharm on Fedora
Follow the same instruction as [Ubuntu](#pycharm-on-ubuntu).

[BACK TO TOP](#table-of-contents)



## Android Studio
Android Studio is a IDE based on IntelliJ IDEA for Android development.

Note that the latest version of Android Studio requires Gradle 2.2 and above; therefore, please make sure you have it installed.  You can also follow the instruction of installing Gradle in [here](#gradle).

Also, Android development requires [Java](#java),  please follow its instruction to install the it.

* [**Windows**](#android-studio-on-windows)
* [**Mac**](#android-studio-on-mac)
* [**Ubuntu**](#android-studio-on-ubuntu)
* [**Fedora**](#android-studio-on-fedora)

### Android Studio on Windows
Download Android Studio from its [home page](https://developer.android.com/sdk/installing/studio.html)

Once download is done, follow the instruction to install Android Studio and SDK.

Note that Android Studio requires access to public internet in order to download dependencies and build.  In case that you have denied its access, you can visit `Control Panel` -> `System and Security` -> `Windows Firewall` -> `Allow a program or feature through Windows Firewall` to grant it public internet access permission.

[BACK TO TOP](#table-of-contents)


### Android Studio on Mac
Download Android Studio from its home page [here](https://developer.android.com/sdk/installing/studio.html)

Once download is done, unzip it and then move the `.app` file to Application folder.

The newer version of Android Studio for Mac no long comes with Android SDK, therefore, you need to download the SDK seperately from [here](#sdk-on-mac).

[BACK TO TOP](#table-of-contents)


### Android Studio on Ubuntu
Donwload and install:
```sh
wget https://dl.google.com/dl/android/studio/ide-zips/1.1.0/android-studio-ide-135.1740770-linux.zip
unzip android-studio-ide-135.1740770-linux.zip
sudo mv android-studio /opt/android-studio
sudo mv -f android-studio-ide-135.1740770-linux.zip ~/Downloads/
sudo ln -s /opt/android-studio/bin/studio.sh /usr/bin/aso
```

(Optional for version 1.0.+) Setup Desktop Icon:
```sh
sudo touch /usr/share/applications/android-studio.desktop

content="
[Desktop Entry]
Name=Android Studio
GenericName=Android IDE
Type=Application
Exec=aso %U
Terminal=false
Icon=/opt/android-studio/bin/androidstudio.ico
Comment=Android Studio
NoDisplay=false
Categories=Development;IDE
Keywords=IDE;Android;Studio;Development;IntelliJ
Name[en]=Android Studio
";

echo "$content" >> /usr/share/applications/android-studio.desktop;
```

The newer version of Android Studio for Linux no long comes with Android SDK, therefore, you need to download the SDK seperately from [here](#sdk-on-ubuntu).

To setup Android Virtual Machine (AVD) on Ubuntu, you need to first enable CPU virtualization technology on your BIOS.

Afterwards, you need to install Kernel Virtual Machine (KVM)
```sh
sudo apt-get install qemu-kvm ubuntu-vm-builder
```

Once installation is done, restart your computer, and you will now be able to use AVD.

[BACK TO TOP](#table-of-contents)


### Android Studio on Fedora
Follow the same instruction of [Ubuntu](#android-studio-on-ubuntu).

[BACK TO TOP](#table-of-contents)



## RSpec
Rails is the prerequisite for RSpec.

* [**Windows**](#rspec-on-ubuntu)

### RSpec on Windows
  To verify Rails is installed in your machine, run the following lines on your git bash:
```sh
which rails # should see a path similar to /c/usr/bin/rails/rails
```

Then run following line to install RSpec:
```sh
gem install rspec
```

Once installation is done, verify it by running:
```sh
which rspec
```
[BACK TO TOP](#table-of-contents)



## iTerm2
iTerm2 is essential a terminal armed with more features, which you can download and learn more about it on its [homepage](www.http://iterm2.com/).
Once the installation package is downloaded, double click to install it.

[BACK TO TOP](#table-of-contents)



## Homebrew
Homebrew is a package manager for Mac.

To install homebrew, simply open your terminal and running:
```sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
[BACK TO TOP](#table-of-contents)



## Tilda
Tilda is an alternative of the system's default terminal, which I found some of its additional features are very handy.

* [**Ubuntu**](#tilda-on-ubuntu)
* [**Fedora**](#tilda-on-fedora)

### Tilda on Ubuntu
You can install Tilda by running:
```sh
sudo apt-get update
sudo apt-get install tilda
```

Once Tilda is successfully installed, you can configure it by running:
```sh
tilda -C
```
[BACK TO TOP](#table-of-contents)


### Tilda on Fedora
```sh
sudo yum install tilda
```
[BACK TO TOP](#table-of-contents)



## SmartGit
SmartGit is an open source GUI for Git.  You can learn more about it on its [home page](http://www.syntevo.com/smartgithg/)

* [**Ubuntu**](#smartgit-on-ubuntu)

### SmartGit on Ubuntu
You can install it through PPA.  To add the sublime PPA, run:
```sh
sudo add-apt-repository ppa:eugenesan/ppa
sudo apt-get update
```

Once the PPA is added and updated, you can install SmartGit by running:
```sh
sudo apt-get install smartgithg
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
sudo yum install httpd # install Apache 2
sudo yum install mysql mysql-server # install MySQL
sudo yum install php php-mysql # install PHP
```
[BACK TO TOP](#table-of-contents)



## Redis
Redis is an open source key-value cache.

* [**Mac**](#redis-on-mac)
* [**Ubuntu**](#redis-on-ubuntu)
* [**Fedora**](#redis-on-fedora)

### Redis on Mac
```sh
brew install redis
```
[BACK TO TOP](#table-of-contents)


### Redis on Ubuntu
You need to download and install redis mannually on Ubuntu.
```sh
wget http://download.redis.io/releases/redis-2.8.19.tar.gz
tar xzf redis-2.8.19.tar.gz
cd redis-2.8.19
make
```

Once installation is done, you can remove the folder and the zip file by running:
```sh
cd ..
rm -rf redis-2.8.19
rm redis-2.8.19.tar.gz
```
[BACK TO TOP](#table-of-contents)


### Redis on Fedora
Follow the same instruction as [Ubuntu](#redis-on-ubuntu)

[BACK TO TOP](#table-of-contents)



## iPython
[**iPython**](http://ipython.org/) An enhanced Interactive Python.  To install `ipython`, you will need to have [`pip`](#pip)

* [**Mac**](#ipython-on-mac)
* [**Ubuntu**](#ipython-on-ubuntu)
* [**Fedora**](#ipython-on-fedora)

### iPython on Mac
```sh
sudo pip install ipython gnureadline
```
`gnureadline` is strongly recommended because readline will not behave well without it.

[BACK TO TOP](#table-of-contents)


### iPython on Ubuntu
```sh
sudo pip install ipython
```
[BACK TO TOP](#table-of-contents)


### iPython on Fedora
Follow the same instruction as [Ubuntu](#ipython-on-ubuntu)

[BACK TO TOP](#table-of-contents)



## Bower
[**Bower**](http://bower.io) is a package manager for the web.  You need [npm](#npm) in order to install `bower`.

* [**Mac**](#bower-on-mac)
* [**Ubuntu**](#bower-on-ubuntu)
* [**Fedora**](#bower-on-fedora)

### Bower on Mac
```sh
npm install -g bower
```
[BACK TO TOP](#table-of-contents)


### Bower on Ubuntu
Follow the same instruction as [Mac](#bower-on-mac).

[BACK TO TOP](#table-of-contents)


### Bower on Fedora
Follow the same instruction as [Mac](#bower-on-mac).

[BACK TO TOP](#table-of-contents)


## jQuery

* [**Mac**](#jquery-on-mac)
* [**Ubuntu**](#jquery-on-ubuntu)

### jQuery on Mac
You need [`bower`](#bower) as a prerequisite
```sh
bower install jquery
```
[BACK TO TOP](#table-of-contents)


### jQuery on Ubuntu
Follow the same instruction as [Mac](#jquery-on-mac).

[BACK TO TOP](#table-of-contents)



## Rust
[**Rust**](http://www.rust-lang.org) is a system programming language.

* [**Mac**](#rust-on-mac)
* [**Ubuntu**](#rust-on-ubuntu)
* [**Fedora**](#rust-on-fedora)

### Rust on Mac
Visit its [home page](http://www.rust-lang.org) and download the [install package](https://static.rust-lang.org/dist/rust-nightly-x86_64-apple-darwin.pkg).

After download is done, just double click it to install.

If you prefer command line installation, you can do so with:
```sh
curl -s https://static.rust-lang.org/rustup.sh | sudo sh
```
[BACK TO TOP](#table-of-contents)


### Rust on Ubuntu
```sh
curl -s https://static.rust-lang.org/rustup.sh | sudo sh
```
[BACK TO TOP](#table-of-contents)


### Rust on Fedora
```sh
curl -s https://static.rust-lang.org/rustup.sh | sudo sh
```
[BACK TO TOP](#table-of-contents)



## Go

* [**Windows**](#go-on-windows)
* [**Mac**](#go-on-mac)
* [**Ubuntu**](#go-on-ubuntu)

### Go on Windows
Visit [Go's download page](https://golang.org/dl/) and download the latest `.msi` file, which is in bold.

Once download is completed, double click the file and follow its instruction to install.  Note that you need to remove any old version of **Go**.

[BACK TO TOP](#table-of-contents)


### Go on Mac
Visit [Go's download page](https://golang.org/dl/) and download the latest `.pkg` file, which is in bold.

Once download is completed, double click the file and follow its instruction to install.  Note that you need to remove any old version of **Go**.

[BACK TO TOP](#table-of-contents)


### Go on Ubuntu
Visit [Go's source install page](https://golang.org/doc/install/source) and follow there instruction there to install.

[BACK TO TOP](#table-of-contents)



## Tree
[**Tree**](http://mama.indstate.edu/users/ice/tree) is a recursive directory listing tool with nice indentation and color codes.

* [**Mac**](#tree-on-mac)
* [**Ubuntu**](#tree-on-ubuntu)
* [**Fedora**](#tree-on-fedora)

### Tree on Mac
```sh
brew install tree
```
[BACK TO TOP](#table-of-contents)


### Tree on Ubuntu
```sh
sudo apt-get install tree
```
[BACK TO TOP](#table-of-contents)


### Tree on Fedora
```sh
sudo yum install tree
```
[BACK TO TOP](#table-of-contents)



## Trailer
[Trailer](http://ptsochantaris.github.io/trailer/) is a Github pull request tracker.

* [**Mac**](#trailer-on-mac)

### Trailer on Mac
Download the app from its [home page](http://ptsochantaris.github.io/trailer/).

Once download is completed, double click the file to install.

[BACK TO TOP](#table-of-contents)



# General Setup

## Setup .bash_profile
You can configure your shell to have it memorize some convenient shortcuts.

If you are in Windows, you can open git bash as administrator by right click on the icon of git bash and select "Run as Administrator".
<br><br>
If you are in Mac or other Unix/Linux-base operating system, just open up your terminal.
<br><br>
**Automatic Way**
<br>
Copy and paste the following codes to your terminal and hit enter/return to run them:
```sh
cd ~
\curl -O https://raw.githubusercontent.com/ctrl-alt-del/devenv/master/util/setup_bash_profile.sh
chmod 755 setup_bash_profile.sh
./setup_bash_profile.sh
```
this should create a .bash_profile file if it is not existed and inject the shortcuts to the file.
<br><br>
**Manual Way**
<br>
If you prefer to create the .bash_profile file manually, you can do so by running:
`touch -pv ~/.bash_profile` on your terminal, if will create the file if it hasn't been created.  Afterwards, you can open it by running: `sudo vi ~/.bash_profile`and then add the scripts to it.  I use `vi` in this case, but you are free to use whatever editor you like, such as `vim`, `nano`, `gedit`, `subl`, `atom` and etc.

After the .bash_profile is created, restart the git bash to let the changes take effect.

[BACK TO TOP](#table-of-contents)


## Chrome
Chrome is a browser, but it can also be a very useful development tool with some extensions.  You can download Chrome on its home page:
```sh
https://www.google.com/intl/en/chrome/browser/
```

Once Chrome is installed, you can start installing extensions by entering `chrome://extensions/` into the browser address bar and hit return/enter key to enter the extension manager.  Scroll to the bottom of the page and click on `get more extensions` to reach the chrome web store page of extensions.

Alternatively, you can reach the chrome web store page by visiting:
```sh
https://chrome.google.com/webstore/category/extensions
```

### EditThisCookie
[EditThisCookie](https://chrome.google.com/webstore/detail/editthiscookie/fngmhnnpilhplaeedifhccceomclgfbg) is a cookie manager that allow developer to modify cookies of a page in real for development and testing purpose.

To intall the extension, just click on the blue `+ Free` button the top right corner.

### REST Console
[REST Console](https://chrome.google.com/webstore/detail/rest-console/cokgbflfommojglbmbpenpphppikmonn) is an tool for testing HTTP requests on APIs.  It allows user to quickly test a url.

To intall the extension, just click on the blue `+ Free` button the top right corner.

### Postman
[Postman](https://chrome.google.com/webstore/detail/postman-rest-client/fdmmgilgnpjigdojojpjoooidkmcomcm) is similar with REST Console, but it has history of all the requests that you have made.

To intall the extension, just click on the blue `+ Free` button the top right corner.

### JSON View
[JSON View](https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc) is a tool that parses JSON into a more human readable format.

To intall the extension, just click on the blue `+ Free` button the top right corner.
