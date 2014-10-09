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
|[Terminal](#terminal)       | N/A                            | [-->](#iterm2)            | [-->](#tilda)               | [-->](#guake)               |
|[Zsh](#zsh)                 | N/A                            | [   ](#zsh-on-mac)        | [-->](#zsh-on-ubuntu)       | [-->](#zsh-on-fedora)       |
|[Oh-My-Zsh](#oh-my-zsh)     | [   ](#oh-my-zsh-on-windows)   | [   ](#oh-my-zsh-on-mac)  | [   ](#oh-my-zsh-on-ubuntu) | [   ](#oh-my-zsh-on-fedora) |
|[Homebrew](#homebrew)       | N/A                            | [-->](#homebrew)          | N/A                         | N/A                         |
|[Sublime](#sublime)         | [   ](#sublime-on-windows)     | [-->](#sublime-on-mac)    | [-->](#sublime-on-ubuntu)   | [-->](#sublime-on-fedora)   |
|[Git](#git)                 | [-->](#git-on-windows)         | [-->](#git-on-mac)        | [-->](#git-on-ubuntu)       | [-->](#git-on-fedora)       |
|[Gitk](#gitk)               | [   ](#gitk-on-windows)        | [   ](#gitk-on-mac)       | [-->](#gitk-on-ubuntu)      | [   ](#gitk-on-fedora)      |
|[SmartGit](#smartgit)       | [   ](#smartgit-on-windows)    | [   ](#smartgit-on-mac)   | [-->](#smartgit-on-ubuntu)  | [   ](#smartgit-on-fedora)  |
|[Curl](#curl)               | [-->](#curl-on-windows)        | [-->](#curl-on-mac)       | [-->](#curl-on-ubuntu)      | [   ](#curl-on-fedora)      |
|[Ruby](#ruby)               | [-->](#ruby-on-windows)        | [-->](#ruby-on-mac)       | [-->](#ruby-on-ubuntu)      | [   ](#ruby-on-fedora)      |
|[devkit](#devkit)           | [-->](#devkit)                 | N/A                       | N/A                         | N/A                         |
|[Rails](#rails)             | [-->](#rails-on-windows)       | [-->](#rails-on-mac)      | [-->](#rails-on-ubuntu)     | [-->](#rails-on-fedora)     |
|[RSpec](#rspec)             | [-->](#rspec-on-windows)       | [   ](#rspec-on-mac)      | [   ](#rspec-on-ubuntu)     | [   ](#rspec-on-fedora)     |
|[Java](#java)               | [-->](#java-on-windows)        | [-->](#java-on-mac)       | [-->](#java-on-ubuntu)      | [   ](#java-on-fedora)      |
|[Python](#python)           | [-->](#python-on-windows)      | [-->](#python-on-mac)     | [-->](#python-on-ubuntu)    | [-->](#python-on-fedora)    |
|[PHP](#php)                 | [-->](#php-on-windows)         | [-->](#php-on-mac)        | [-->](#php-on-ubuntu)       | [   ](               )      |
|[Node.js](#nodejs)          | [-->](#nodejs)                 | [-->](#nodejs-on-mac)     | [-->](#nodejs-on-ubuntu)    | [   ](               )      |
|[npm](#npm)                 | [   ](       )                 | N/A                       | [-->](#npm-on-ubuntu)       | [   ](               )      |
|[Express](#express)         | [   ](       )                 | [-->](#express-on-mac)    | [   ](                 )    | [   ](               )      |
|[Nodemon](#nodemon)         | [   ](       )                 | [-->](#nodemon-on-mac)    | [   ](                 )    | [   ](               )      |
|[OpenSSL](#openssl)         | [   ](       )                 | [   ](            )       | [-->](#openssl-on-ubuntu)   | [   ](               )      |
|[Gradle](#gradle)           | [-->](#gradle-on-windows)      | [-->](#gradle-on-mac)     | [-->](#gradle-on-ubuntu)    | [-->](#gradle-on-fedora)    |
|[WAMP](#wamp)               | [-->](#wamp)                   | N/A                       | N/A                         | N/A                         |
|[MAMP](#mamp)               | N/A                            | [-->](#mamp)              | N/A                         | N/A                         |
|[LAMP](#lamp)               | N/A                            | N/A                       | [   ](               )      | [   ](               )      |
|[SQLite](#sqlite)           | [-->](#sqlite-on-windows)      | [   ](            )       | [   ](               )      | [   ](               )      |
|[MySQL](#mysql)             | [   ](       )                 | [   ](            )       | [   ](               )      | [   ](               )      |
|[PostgreSQL](#postgreSQL)   | [   ](       )                 | [-->](#postgreSQL-on-mac) | [   ](               )      | [   ](               )      |
|[Chef](#chef)               | [   ](       )                 | [   ](            )       | [   ](               )      | [   ](               )      |
|[Android SDK](#android-sdk) | [-->](#sdk-on-windows)         | [-->](#android-sdk)       | [-->](#sdk-on-ubuntu)       | [-->](#sdk)                 |
|[ADT](#adt)                 | [-->](#adt)                    | [-->](#adt)               | [-->](#adt)                 | [-->](#adt)                 |
|[Eclipse](#eclipse)         | [-->](#eclipse)                | [-->](#eclipse)           | [   ](#eclipse-on-ubuntu)   | [   ](#eclipse-on-fedora)   |
|[VirtualBox](#virtualbox)   | [   ](#virtualbox)             | [   ](#virtualbox)        | [-->](#virtualbox-on-ubuntu)| [-->](#virtualbox-on-fedora)|



* [General Setup](#general-setup)
* [Setup .bash_profile](#setup-bash_profile)
* [Chrome](#chrome)
* [EditThisCookie](#editthiscookie)
* [REST Console](#rest-console)
* [JSON View](#json-view)

* [Setup Android dev environment](#setup-android-dev-enviroment)

## Configuration

### Configure Windows
It is a good idea to centralize all your packages in one folder.  Not only does it help  to better organize your packages, having a dedicated folder for your packages also makes navigating with command line easier.  In this instruction for Windows, all packages will be put or installed under /c/usr/bin (a.k.a "C:\usr\bin").  Please create the folder if it is not existed, and of course, feel free to name your own directory.

If you are familiar with Window's PowerShell, you can create the folder by opening PowerShell and run:
```sh
mkdir -p /c/usr/bin
```

### Run as Administrator
For Windows's default command prompt or PowerShell, you will sometimes need the administrative permission to perform some tasks.  To run as administrator, right click on the `cmd.exe` or `powershell.exe` and select `Run as Administrator` option from the list.


## Terminal
Terminal, sometime also known as the command line interface (cli) is used to interact with computer programs.  You can learn more about it on its [Wiki](http://en.wikipedia.org/wiki/Command-line_interface) page.

For Windows users, we are just going to use the Git Bash that comes with [Git](#git-on-windows).

For Mac users, you can either use the system default terminal, or you can also use [iTerm2](#iterm2), which is an enhanced terminal for Mac.

For Ubuntu, Fedora, and all other Unix/Linux base operating system users, you can either use the system default terminal, or some other terminal applications, such as [Tilda](#tilda) or [Guake](#guake).


## Zsh
Zsh stands for Z shell is a Unix base interactive login shell.  You can learn more about it on its [Wiki](http://en.wikipedia.org/wiki/Zsh) page.

#### Zsh on Ubuntu
To install Zsh on Ubuntu, you can do so by running:
```sh
sudo apt-get update
sudo apt-get install zsh
```

#### Zsh on Fedora
To install Zsh on Fedora, you can do so by running:
```sh
sudo yum install zsh
```

[BACK TO TOP](#table-of-contents)


## Oh-My-Zsh
Oh-My-Zsh is an framework for managing your ZSH configuration.  You can learn more about it on its [homepage](http://ohmyz.sh/), or on its [git repository](https://github.com/robbyrussell/oh-my-zsh)


## Homebrew
Homebrew is a package manager for **Mac**.  You can learn more about it on its [homepage](http://brew.sh/)

Since Mac comes with Ruby by default, you can install Homebrew by running:
```sh
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

[BACK TO TOP](#table-of-contents)



## Sublime

* [**Ubuntu**](#sublime-on-ubuntu)
* [**Fedora**](#sublime-on-fedora)
* [**Configuration**](#sublime-configuration)

Sublime is a very useful and convenient text editor.  You can learn more about it on its [homepage](http://www.sublimetext.com/)

### Sublime on Ubuntu
Sublime is a very useful text editor, you can install it through PPA.
To add the sublime PPA, run:
```sh
sudo add-apt-repository ppa:webupd8team/sublime-text-2
sudo apt-get update
```

Once the PPA is added and updated, you can install Sublime by running:
```sh
sudo apt-get install sublime-text
```

Once Sublime is successfully installed, you can use it to open a single file by running:
`subl <FILE_PATH>`, or open all files of the current directory by running `subl .`

[BACK TO TOP](#table-of-contents)


### Sublime on Fedora

```sh
wget http://c758482.r82.cf2.rackcdn.com/Sublime\ Text\ 2.0.2\ x64.tar.bz2
mv Sublime\ Text\ 2.0.2\ x64.tar.bz2 /opt/sublime.tar.bz2
tar vxjf sublime.tar.bz2
mv Sublime\ Text\ 2 sublime
rm -rf sublime.tar.bz2
sudo ln -s /opt/sublime/sublime_text /usr/bin/subl
```

[BACK TO TOP](#table-of-contents)


### Sublime Configuration
#### Package Control
**Package Control** is the simplest way of install packages to sublime. You can learn about how to install Package Controll from [here](https://sublime.wbond.net/installation#st2).


[BACK TO TOP](#table-of-contents)


## Git
Git is a distributed version control and code management system.  You can learn more detail about it on its [homepage](http://git-scm.com/).

For details on how to install Git on different operating system, click on:
* [Windows](#git-on-windows)
* [Mac](#git-on-mac)
* [Ubuntu](#git-on-ubuntu)
* [Fedora](#git-on-fedora)

### Git on Windows
Since Git contains many convenient built-in functions as well as a useful bash shell, it is recommended to be installed first in setting up the dev environment on Windows.

You can download the latest git install file for Windows from [here](http://git-scm.com/download/win)

Once the installation file is downloaded, install it under /c/usr/bin/git or whatever directory you chose.  Don't worry about the configuration choices available during the installation process, it would be fine to just keep them in default.

### Git on Mac
Git should've come with Mac by default.  You can verify your git version by opening your terminal and running:
```sh
git --version
```

If git does not come with your Mac somehow, you can follow the installation instruction in their website:
```sh
http://git-scm.com/book/en/Getting-Started-Installing-Git
```

Or you can install it through [Homebrew](#homebrew) by running:
```sh
brew install git
```

[BACK TO TOP](#table-of-contents)


### Git on Ubuntu
Git should've come with Ubuntu, but if it is not, you can install it easily through running:
```sh
sudo apt-get update
sudo apt-get install git-core
```

To upgrade to the latest version of Git, you can do so by running:
```sh
sudo apt-get upgrade git
```

[BACK TO TOP](#table-of-contents)


### Git on Fedora
```sh
sudo yum install git-core
```

[BACK TO TOP](#table-of-contents)




## Gitk
Gitk is a graphic user interface for git.

### Gitk on Ubuntu
Gitk is a graphical user interface for Git.  You can install it by running:
```sh
sudo apt-get install gitk
```

[BACK TO TOP](#table-of-contents)


## SmartGit
Similar to Gitk, SmartGit is an UI for git too, yet it has more functionalities than Gitk.

## Curl
Curl is a tool to transfer data from or to a server, you can learn more about it on its [homepage](http://curl.haxx.se/docs/manpage.html).

Curl comes with Mac and some distros of Linux by default.  For Windows, it should comes with the [Git](#git) you installed earlier.  In case Curl is not presented on your operating system, you can follow the instructions below to install it yourself.

* [**Windows**](#curl-on-windows)
* [**Mac**](#curl-on-mac)
* [**Ubuntu**](#curl-on-ubuntu)
* [**Fedora**](#curl-on-fedora)

### Curl on Windows
Visit the download page of Curl in [here](http://curl.haxx.se/download.html) and download the latest version of `curl-[version].zip` listed under source achieve.

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

If curl does not come with your Mac somehow, you can follow the same instruction of [Windows](#curl-on-windows) to install it on your Mac.

Or you can install it through Homebrew by running:
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

## Ruby

* [**Windows**](#ruby-on-windows)
* [**Mac**](#ruby-on-mac)
* [**Ubuntu**](#ruby-on-ubuntu)
* [**Fedora**](#ruby-on-fedora)

### Ruby on Windows
You can install Ruby on Windows by using [RubyInstaller](http://rubyinstaller.org/downloads/) with either the [x86 installer](http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.0.0-p481.exe) or [x64 installer](http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.0.0-p481-x64.exe) based on your operation system.

To download the installer through command line, you can do so by running:
For 64-bit system:
```sh
curl --remote-name "http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.0.0-p481-x64.exe"
```

For 32-bit system:
```sh
curl --remote-name "http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.0.0-p481.exe"
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

Choose the appropriate devkit to download, either x86 or x64 based on your operation system.

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
2. Install the latest version of Ruby through Homebrew by running `brew install ruby`.
3. Use RVM to install Ruby, see the instruction for [**Ubuntu**](#ruby-on-ubuntu).


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
```


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
```

If you encounter issue while running `gem install pg`, you need to install PostgreSQL and you can do so by follow the instruction [here](#postgresql-on-mac)


## Rails on Ubuntu
Please follow the same instruction of [Mac](#rails-on-mac).

If you come across an error that compliant about no having a Javascript runtime environment, you can resolve it by installing [Node.js](#nodejs-on-ubuntu).

[BACK TO TOP](#table-of-contents)


## Rails on Fedora
Please follow the same instruction of [Mac](#rails-on-mac).

[BACK TO TOP](#table-of-contents)

## Java
### Java on Windows
Download the latest Java for Windows from [Oracle](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html).

Choose the appropriate Thread Safe zip to download, either x86 or x64 based on your operation system.

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
```

if there is error saying php is not found on sh.exe, restart the git bash and run above line again.

[BACK TO TOP](#table-of-contents)


### Java on Mac

Both Java 7 and 8 are available today.  This instruction will focus on Java 7, but the processes are similar to Java 8.

Go to the home page of Oracle to choose the Java SDK version:
```sh
http://www.oracle.com/technetwork/java/javase/downloads/index.html?ssSourceSiteId=otnjp
```

You can also go directly to the download page of Java 7 SDK with following link:
```sh
http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html
```

Scroll down the page to the section of "Java SE Development Kit 7uXX", follow the instruction on there to read and accept the license agreement, then click the download link for "Mac OS X x64".

Once the dmg file is downloaded, double click to start the install process and follow its instruction to complete the process.

Once the installation is done, you can verify your Java version by running the following line on terminal:
```sh
java -version
```

[BACK TO TOP](#table-of-contents)

### Java on Ubuntu
We will use OpenJDK since it is open source.  You can install OpenJDK by running:
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
Similarily, we will install OpenJDK on Fedora by running:
```sh
yum install java-1.7.0-openjdk-devel
```

[BACK TO TOP](#table-of-contents)


## Python

* [**Windows**](#python-on-windows)
* [**Mac**](#python-on-mac)
* [**Ubuntu**](#python-on-ubuntu)
* [**Fedora**](#python-on-fedora)

### Python on Windows
There are Python 2.x and Python 3.x available.  This instruction will focus on 2.x, but similar steps can be easily applied to 3.x as well.

Download the Python 2.7.6 for Windows from [here](https://www.python.org/download/releases/2.7.6).

Under the Download tab, choose the appropriate msi file to download, either x86 or x64 based on your operation system.

You can also use the following command to download the 32-bit version:
```sh
curl --remote-name https://www.python.org/ftp/python/2.7.6/python-2.7.6.msi
```

Or use the following command to download the 64-bit version:
```sh
curl --remote-name https://www.python.org/ftp/python/2.7.6/python-2.7.6.amd64.msi
```

Once the msi file is downloaded, double click to install it under /c/usr/bin/python.

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


## PHP
## Node.js
To install Node.js, download the install file from its [homepage](http://nodejs.org/).

Once download is done, double click the file and follow the instruction to install it into your computer.

Once installation is done, Node.js and Node Packaged Modules (npm) should be ready on your computer.

You can verify them by running:
```sh
node -v
npm -v
```



### Node.js on Mac
Alternatively, you can install Node.js through [Homebrew](#homebrew).
```sh
brew intall node
```

[BACK TO TOP](#table-of-contents)


## Node.js on Ubuntu
Node.js is an platform for Javascript.  You can install Node.js by running:
```sh
sudo apt-get install nodejs
```

If you want to have the latest version of Node.js, you can install it through PPA maintained by Chris Lea.  You can do so by running:
```sh
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs
```

[BACK TO TOP](#table-of-contents)


### npm
npm is a tool to manage the packages used by Node.js
```sh
sudo apt-get install npm
```

[BACK TO TOP](#table-of-contents)


## CoffeeScript
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
## Nodemon
## OpenSSL

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
sudo apt-get-repository ppa:cwchien/gradle
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

**Add to ~/.bash_profile**
The easiest and safest way would be to add the `GRADLE_HOME` to `~/.bash_profile` and export it so that you can just `source ~/.bash_profile` when you need it.

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
Alternatively, if you use Gradle on a daily basis, you may consider just adding the `GRADLE_HOME` to your `~/.bashrc` because it will then be automatically loaded whenever you open your terminal.

To do so, it is very similar to the instruction of adding it to `~/.bash_profile`, but since `~/.bashrc` always exist, you can just open it with `vi` and add the lines to the end of it.
```sh
export GRADLE_HOME="/opt/<gradle_folder_name>/bin"
export PATH=$GRADLE_HOME:$PATH
```
Again, `<gradle_folder_name>` is something similar to `gradle-1.12` and etc.

Once you are done adding those lines, save and exist the editor and you are good to go. Gradle wuold be ready to use whenever you open a terminal.


[BACK TO TOP](#table-of-contents)


## WAMP
## MAMP
## LAMP
## SQLite

* [**Windows**](#sqlite-on-windows)
* [**Mac**]()
* [**Ubuntu**]()

### SQLite on Windows
Download the latest SQLite for Windows from the home page of SQLite.org:
```sh
http://www.sqlite.org/download.html
```

Scroll down the page to the "Precompiled Binaries for Windows" section, and download the sqlite-shell and sqlite-dll files.

Or run the following lines on your git bash:
```sh
cd ~
curl --remote-name "http://www.sqlite.org/2014/sqlite-shell-win32-x86-3080403.zip"
curl --remote-name "http://www.sqlite.org/2014/sqlite-dll-win32-x86-3080403.zip"
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


## MySQL
## PostgreSQL
## Chef

## Android SDK
You can get Android SDK from its [developer page](http://developer.android.com/sdk/index.html) under **Get SDK for an existing IDE**.

Once the compressed file is downloaded, unzip it and place it in the same folder of eclipse, or whatever folder you like.

Follow the installation process for your system:

* [**Windows**](#sdk-on-windows)
* [**Mac**](#sdk-on-mac)
* [**Ubuntu**]()
* [**Fedora**]()

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


## SDK on Windows
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

If you are in Linux 64 bit OS, you may also need to install the 32 bit shared libraries.  You can do so by running:
```sh
sudo apt-get install libc6:i386 libstdc++6:i386 zlib1g:i386
```


[BACK TO TOP](#table-of-contents)


### SDK on Fedora
Visit the [developer page](http://developer.android.com/sdk/index.html) and download the [SDK Tool only for Linux 32 and 64 bit](http://dl.google.com/android/android-sdk_r23.0.2-linux.tgz)

Once download is done, unzip it and move it to the `/opt/android-sdk-linux` folder, then add `export ANDROID_HOME=/opt/android-sdk-linux` to the `~/.bash_profile`.

If you are in Linux 64 bit OS, you may also need to install the 32 bit shared libraries.  You can do so by running:
```sh
sudo yum install glibc.i686 glibc-devel.i686 libstdc++.i686 zlib-devel.i686 ncurses-devel.i686 libX11-devel.i686 libXrender.i686 libXrandr.i686
```


[BACK TO TOP](#table-of-contents)


## ADT
## Eclipse


## VirtualBox

* [**Ubuntu**](#virtualbox-on-ubuntu)
* [**Fedora**](#virtualbox-on-fedora)

### VirtualBox on Ubuntu
```sh
sudo apt-get install virtualbox
```

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





# Windows

### RSpec on Windows
Rails is the prerequisite for RSpec.  To verify Rails is installed in your machine, run the following lines on your git bash:
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


## PHP on Windows
Download the latest PHP for Windows from here:

http://windows.php.net/download/

Choose the appropriate Thread Safe zip to download, either x86 or x64 based on your operation system.

You can also use the following command to download the 32-bit version:
```sh
curl --remote-name http://windows.php.net/downloads/releases/php-5.5.11-Win32-VC11-x86.zip
```

Or use the following command to download the 64-bit version:
```sh
curl --remote-name http://windows.php.net/downloads/releases/php-5.5.11-Win32-VC11-x64.zip
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



## Wamp
Download the latest PHP for Windows from here:

http://www.wampserver.com/en/

Choose the appropriate Thread Safe zip to download, either x86 or x64 based on your operation system.

install the downloaded file to /c/usr/bin/wamp, or whatever directory you chose. Keep installation configurations default.


# Mac

## iTerm2
iTerm2 is essential a terminal armed with more features, which you can download and learn more about it on its [homepage](www.http://iterm2.com/).
Once the installation package is downloaded, double click to install it.

[BACK TO TOP](#table-of-contents)


## Homebrew
To install homebrew, simply open your terminal and running:
```sh
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

[BACK TO TOP](#table-of-contents)


## PHP on Mac

[BACK TO TOP](#table-of-contents)


## MAMP

## Nodejs
Node.js is an platform for Javascript.  You can install Node.js by download the package from its home page:
```sh
http://nodejs.org/download/
```

Once download is completed, double click the file and follow the instruction to complete the installation.

Once installation is done, open a terminal window and verify it by running:
```sh
node -v
npm -v
```
You should see the version number of both lines


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


### Nodemon on Mac
Nodemon is a monitoring plugin that restart node.js application automatically if there is any changes happened to the code.  You can get it by running
```sh
sudo npm install -g nodemon
```

Once installation is done, open a terminal window and verify it by running:
```sh
nodemon -v
```

[BACK TO TOP](#table-of-contents)



## PostgreSQL on Mac
```sh
brew update
brew install postgresql
```
[BACK TO TOP](#table-of-contents)


# Ubuntu

## Tilda
Tilda is an alternative of the system's default terminal, which I found some of its additional features are very handy.

You can install Tilda by running:
```sh
sudo apt-get install tilda
```

If it returns an error saying it cannot fetch some archives, simply update the repository and then redo the installation by running:
```sh
sudo apt-get update
sudo apt-get install tilda
```

Once Tilda is successfully installed, you can configure it by running:
```sh
tilda -C
```

[BACK TO TOP](#table-of-contents)


## SmartGit on Ubuntu
SmartGit is an open source GUI for Git.  You can learn more about it on its home page:
```sh
http://www.syntevo.com/smartgithg/
```

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


## OpenSSL on Ubuntu
Ubuntu comes with OpenSSL, but it may need to be upgraded because of the Heartbleed Bug (learn more on: ``http://heartbleed.com/``).  Moreover, newer version of OpenSSL is also required to install the latest Rails.

You can upgrade OpenSSL by running:
```sh
sudo apt-get upgrade openssl
```

[BACK TO TOP](#table-of-contents)


## PHP on Ubuntu
PHP is a scripting language for web applications, you can install PHP by running:
```sh
sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt
```

Once installation is done, you can verify it by running:
```sh
php -v
```

[BACK TO TOP](#table-of-contents)


## LAMP
LAMP referes to a software bundle including Linux Apache MySQL PHP. You can learn more about it on Ubuntu's page
```sh
https://help.ubuntu.com/14.04/serverguide/lamp-overview.html
```

You can install LAMP in Ubuntu by running:
```sh
sudo tasksel install lamp-server
```

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
https://chrome.google.com/webstore/category/extensions?hl=en-US
```

### EditThisCookie
EditThisCookie is a cookie manager that allow developer to modify cookies of a page in real for development and testing purpose.  To install this extension, you can either search `EditThisCookie` on the chrome web store, or visiting its page on:
```sh
https://chrome.google.com/webstore/detail/editthiscookie/fngmhnnpilhplaeedifhccceomclgfbg?hl=en-US
```

To intall the extension, just click on the blue `+ Free` button the top right corner.

### REST Console
REST Console is an tool for testing HTTP requests on APIs.  You can learn more about it on its page on:
```sh
https://chrome.google.com/webstore/detail/rest-console/cokgbflfommojglbmbpenpphppikmonn?hl=en-US
```

To intall the extension, just click on the blue `+ Free` button the top right corner.

### JSON View
JSON View is a tool that parses JSON into a more human readable format.  You can learn more about it on its page on:
```sh
https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc?hl=en-US
```

To intall the extension, just click on the blue `+ Free` button the top right corner.


# Setup dev environment with Chef

# Setup Android dev environment
## Eclipse
Eclipse is an integrated development environment (IDE) and you can learn more about it on its [homepage](http://www.eclipse.org/).  To use it to develop Android application, I use one of its variant called [Eclipse IDE for Java Developers](http://www.eclipse.org/downloads/packages/eclipse-ide-java-developers/lunar) because it is relatvely smaller than other variants.  You can feel to use the [standard one](http://www.eclipse.org/downloads/packages/eclipse-standard-44/lunar) or other of its variant as well.


## ADT
Once Eclipse is installed, open it and navigate to its Help -> Install New Software.

On the wizard of Install New Software, click on the add button and paste `https://dl-ssl.google.com/android/eclipse/` to `location` and put `Android Development Toolkit plugin` on `name`, then press OK.

Back to the wizard, click on the drop down list of `Work with`  and select the url item that you just added.

It may take a while for eclipse to get the plugin information, but once the available plugin is displayed, click `Select All` under the displaying section, and then `Next` on the bottom right.  Then follow the instruction to install and plugin and restart Eclipse once the installation is done.



# Fedora

## Guake
To install Guake on Fedora, you can do so by running:
```sh
sudo yum install guake
```

[BACK TO TOP](#table-of-contents)
