devenv
======

### About
I use both Mac and Windows regularly and sometimes Ubuntu as well.  Although I mostly use Mac as my coding machine, I am very interested in coding on my Windows machine as well.  After some reseaches as well as trials and errors, I am able to setup the dev environment on my Windows machine and I am pretty happy with it so far.  I think it may be a good idea to share the setup process with the community, and hopefully it can save other people some time :).

### Disclaimer
This document and bash scripts will be updated piece by piece and I will try my best to describe the process step by step.  Please feel free to let me know if you see anything confusing/unclear/wrong or you have any recommendations.  Thank you :).

# Table of Contents

|Tools                     | [Windows 7](#windows)        | [Mac 10.9.+](#mac)       | [Ubuntu 14.04](#ubuntu)     | [Fedora 20](#fedora)        |
|:------------------------ | :--------------------------: | :----------------------: | :-------------------------: | :-------------------------: |
|[Preps](#configuration)   | [-->](#configure-windows)    | N/A                      | N/A                         | N/A                         |
|[Terminal](#terminal)     | N/A                          | [-->](#terminal)         | [-->](#tilda)               | [   ](#guake)               |
|[Zsh](#zsh)               | [   ](#zsh-on-windows)       | [   ](#zsh-on-mac)       | [   ](#zsh-on-ubuntu)       | [   ](#zsh-on-fedora)       |
|[Oh-My-Zsh](#oh-my-zsh)   | [   ](#oh-my-zsh-on-windows) | [   ](#oh-my-zsh-on-mac) | [   ](#oh-my-zsh-on-ubuntu) | [   ](#oh-my-zsh-on-fedora) |
|[Homebrew](#homebrew)     | N/A                          | [-->](#homebrew)         | N/A                         | N/A                         |
|[Sublime](#sublime)       | [   ](#sublime-on-windows)   | [-->](#sublime-on-mac)   | [-->](#sublime-on-ubuntu)   | [   ](#sublime-on-fedora)   |
|[Git](#git)               | [-->](#git-on-windows)       | [-->](#git-on-mac)       | [-->](#git-on-ubuntu)       | [-->](#git-on-fedora)       |
|[Gitk](#gitk)             | [   ](#gitk-on-windows)      | [   ](#gitk-on-mac)      | [-->](#gitk-on-ubuntu)      | [   ](#gitk-on-fedora)      |
|[Curl](#curl)             | [-->](#curl-on-windows)      | [-->](#curl-on-mac)      | [-->](#curl-on-ubuntu)      | [   ](#curl-on-fedora)      |
|[Ruby](#ruby)             | [-->](#ruby-on-windows)      | [-->](#ruby-on-mac)      | [-->](#ruby-on-ubuntu)      | [   ](#ruby-on-fedora)      |
|[devkit](#devkit)         | [-->](#devkit)               | N/A                      | N/A                         | N/A                         |
|[Rails](#rails)           | [-->](#rails-on-windows)     | [-->](#rails-on-mac)     | [-->](#rails-on-ubuntu)     | [   ](#rails-on-fedora)     |
|[RVM](#rvm)               | N/A                          | [-->](#rvm-on-mac)       | [   ](               )      | [   ](               )      |
|[Java](#java)             | [-->](#java-on-windows)      | [-->](#java-on-mac)      | [-->](#java-on-ubuntu)      | [   ](#java-on-fedora)      |
|[Python](#python)         | [-->](#python-on-windows)    | [-->](#python-on-mac)    | [-->](#python-on-ubuntu)    | [   ](               )      |
|[PHP](#php)               | [-->](#php-on-windows)       | [-->](#php-on-mac)       | [-->](#php-on-ubuntu)       | [   ](               )      |
|[Node.js](#nodejs)        | [   ](       )               | [-->](#nodejs-on-mac)    | [-->](#nodejs-on-ubuntu)    | [   ](               )      |
|[npm](#npm)               | [   ](       )               | N/A                      | [-->](#npm-on-ubuntu)       | [   ](               )      |
|[Express](#express)       | [   ](       )               | [-->](#express-on-mac)   | [   ](                 )    | [   ](               )      |
|[Nodemon](#nodemon)       | [   ](       )               | [-->](#nodemon-on-mac)   | [   ](                 )    | [   ](               )      |
|[OpenSSL](#openssl)       | [   ](       )               | [   ](            )      | [-->](#openssl-on-ubuntu)   | [   ](               )      |
|[Gradle](#gradle)         | [-->](#gradle-on-windows)    | [-->](#gradle-on-mac)    | [   ](               )      | [   ](               )      |
|[WAMP](#wamp)             | [-->](#wamp  )               | N/A                      | N/A                         | N/A                         |
|[MAMP](#mamp)             | N/A                          | [-->](#mamp       )      | N/A                         | N/A                         |
|[LAMP](#lamp)             | N/A                          | N/A                      | [   ](               )      | [   ](               )      |
|[SQLite](#sqlite)         | [-->](#sqlite-on-windows)    | [   ](            )      | [   ](               )      | [   ](               )      |
|[MySQL](#mysql)           | [   ](       )               | [   ](            )      | [   ](               )      | [   ](               )      |
|[PostgreSQL](#postgreSQL) | [   ](       )               | [   ](            )      | [   ](               )      | [   ](               )      |


* [Setup dev environment on Windows](#windows)
	* [RSpec](#rspec)
	* [Android SDK](#android-sdk-on-windows)
		

* [Setup dev environment on Ubuntu 14.04 LTS](#ubuntu)
	* [SmartGit](#smartgit)

* [General Setup](#general-setup)
	* [Setup .bash_profile](#setup-bash_profile)
	* [Chrome](#chrome)
		* [EditThisCookie](#editthiscookie)
		* [REST Console](#rest-console)
		* [JSON View](#json-view)
		
* [Setup Android dev environment](#setup-android-dev-enviroment)
	* [Eclipse](#eclipse)
	* [ADT](#adt)
	* [Android SDK](#android-sdk)
	* [Gradle](#gradle)

* [Setup dev environment with Chef](#setup-dev-environment-with-chef)


#Configuration

## Configure Windows
It is a good idea to centralize all your packages in one folder.  Not only does it help  to better organize your packages, having a dedicated folder for your packages also makes navigating with command line easier.  In this instruction for Windows, all packages will be put or installed under /c/usr/bin (a.k.a "C:\usr\bin").  Please create the folder if it is not existed, and of course, feel free to name your own directory. 

If you are familiar with Window's PowerShell, you can create the folder by opening PowerShell and run:
```sh
mkdir -p /usr/bin
```


# Windows

## Git on Windows
Git is a distributed version control and code management system.  You can learn more detail about it on its [homepage](http://git-scm.com/).

Since Git contains many convenient built-in functions as well as a useful bash shell, it is recommended to be installed firstin order to setup the dev environment on Windows.

You can download the latest git install file for Windows from [here](http://git-scm.com/download/win)

Once the installation file is downloaded, install it under /c/usr/bin/git or whatever directory you chose.  Don't worry about the configuration choices available during the installation process, it would be fine to just keep them in default.

[BACK TO TOP](#table-of-contents)


### Setup .bash_profile
After git is installed, let us configure the git bash and have it memorize some convenient shortcuts.

Open git bash as administrator by right click on the icon of git bash and select "Run as Administrator".

Navigate to the home directory of your windows by running `cd ~`, and then run the bash script on the following path of this repository: 
```sh
./devenv/windows/setup_bash_profile.sh
```
this should create a .bash_profile file if it is not existed and inject the shortcuts to the file.

Or if you prefer to create the .bash_profile file manually, you can do so by running:
`touch .bash_profile` on you home directory, and then add the scripts to it.

After the .bash_profile is created, restart the git bash to let the changes take effect.

[BACK TO TOP](#table-of-contents)


## Curl on Windows
Curl should come with Git by default.  If not, you can download and configure it from its home page.
```sh
http://curl.haxx.se/
```

Choose the `curl-[version].zip` from source achieve to download.

Once it is downloaded, unzip it to `/c/usr/bin/curl`, or whatever directory your chose.

Run git bash as administrator, then go to the bin of git bash by running: 
```sh
cd /usr/bin
```

Create a symbolic link by running:
```sh
ln -s /c/usr/bin/curl/curl.exe curl.exe
```

[BACK TO TOP](#table-of-contents)


## Ruby on Windows
Ruby is the prerequisite for Rails.  You can download the latest Ruby for Windows from here:

http://rubyinstaller.org/downloads/

Choose the appropriate RubyInstaller to download, either the [x86 installer](http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.0.0-p481.exe) or [x64 installer](http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.0.0-p481-x64.exe) based on your operation system.

To donwload the installer through command line, you can do so by running:
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
ruby -v # should see 
```

If there is error saying ruby is not found on sh.exe, restart the git bash and redo the verification.

Once you restarted the git bash and verified ruby is installed on your machine, you can check its version by running:
```sh

```

[BACK TO TOP](#table-of-contents)


### devkit
devkit is the prerequisite for Rails.  You can download its latest version for Windows from here:

http://rubyinstaller.org/downloads/

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


## Rails on Windows
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

[BACK TO TOP](#table-of-contents)


### RSpec
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


## SQLite on Windows
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


## Java on Windows
Download the latest Java for Windows from here:

http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html

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


## Python on Windows
There are Python 2.x and Python 3.x available.  This instruction will focus on 2.x, but similar steps can be easily applied to 3.x as well.

Download the Python 2.7.6 for Windows from here:
https://www.python.org/download/releases/2.7.6

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

## Android SDK on Windows
Download the latest Android SDK for Windows from here:

http://developer.android.com/sdk/index.html

Choose the appropriate Thread Safe zip to download, either x86 or x64 based on your operation system.

unzip the downloaded file to /c/usr/bin/android, or whatever directory you chose.

Navigate to /c/usr/bin/android/ by running:
```sh
cd /c/usr/bin/android/
```

Open the SDK Manager by running:
```sh
open SDK\ Manager.exe
```

Select the latest Android SDK version or any other SDK version as needed, then update.

[BACK TO TOP](#table-of-contents)


## Gradle on Windows
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


# Mac

## Terminal

Terminal will be used to setup the dev environment on Mac.  To open a terminal prompt, press "command" and "space" key at the same time to open Spotlight, then type in "terminal" (without quotes) and hit return.  A terminal prompt should show up.

[BACK TO TOP](#table-of-contents)


## Homebrew

Homebrew is a package manager for Mac, which I like very much.  You can learn more about it on their website:
```sh
http://brew.sh/
```

To install homebrew, simply open your terminal and running:
```sh
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

[BACK TO TOP](#table-of-contents)


## Git on Mac

Mac should have Git by default.  You can verify your git version by openning your terminal and running:
```sh
git --version
```

If git does not come with your Mac somehow, you can follow the installation instruction in their website:
```sh
http://git-scm.com/book/en/Getting-Started-Installing-Git
```

Or you can install it through Homebrew by running:
```sh
brew install git
```

Once installation is done, you can get the latest version of Git by running:
```sh
git clone https://github.com/git/git
```

[BACK TO TOP](#table-of-contents)



## Curl on Mac

Mac should have Curl by default.  You can verify your curl version by openning your terminal and running:
```sh
curl --version
```

If curl does not come with your Mac somehow, you can download and follow the installation instruction in their website:
```sh
http://curl.haxx.se/download.html
```

Or you can install it through Homebrew by running:
```sh
brew install curl
```

[BACK TO TOP](#table-of-contents)


## Ruby on Mac

Mac should have Ruby installed by default and it is the prerequisite for installing Rails.  To verify it, you can open your terminal and run:
```sh
ruby --version
```
It should show you the version of your currently installed Ruby. 

If ruby does not come with your Mac somehow or you wnat to have a newer version of Ruby, you can download and follow the installation instruction on Ruby's website:
```sh
https://www.ruby-lang.org/en/downloads/
```

Or you can install the latest version of Ruby through Homebrew by running:
```sh
brew install ruby
```

Or you can use RVM to install Ruby as well, see the next section for instruction.

[BACK TO TOP](#table-of-contents)


## RVM on Mac
You may also use RVM to install and manage your Ruby and Rails.  RVM stands for Ruby Version Manager; it is a convenient way to manage multiple versions of Ruby and Rails (e.g. the system default version and the latest version) because sometimes you may want to keep the older version of Ruby to keep the capabililty or whatever.

You may learn more details about RVM on its home page:
```sh
https://rvm.io/rvm/install
```

Or you can install the latest stable version of RVM + Ruby by running:
```sh
\curl -sSL https://get.rvm.io | bash -s stable --ruby
```

Similarly, you can install the latest stable version of RVM + Ruby + Rails by running:
```sh
\curl -sSL https://get.rvm.io | bash -s stable --rails
```

To setup the Ruby environment, you can simply check if the Ruby environment is setup by a RVM command:
```sh
rvm requirements
```

While installing gems, the process will automatically generate documants, which can be time consuming.  If you perfer online documents over local generated ones, you can skip the auto documents generating process, which would save you some time.

To disable the process, you can create a gem configuation file by running:
```sh
subl ~/.gemrc
```

and then paste and save the following two lines into `.gemrc`
```sh
install: --no-rdoc --no-ri
update:  --no-rdoc --no-ri
```

[BACK TO TOP](#table-of-contents)


## Rails on Mac

Once Ruby is installed in your Mac, you can install Rails through terminal by simply running:
```sh
gem install rails
```

Once installation is done, verify it through running:
```sh
which rails
```

[BACK TO TOP](#table-of-contents)


## Java on Mac

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


## Python on Mac

Mac should have Python installed by default.  To verify it, you can open your terminal and run:
```sh
python --version
```
It should show you the version of your currently installed Python. 

If Python does not come with your Mac somehow or you wnat to have a newer version of Python, (e.g. Pyhotn 3.x rather than Python 2.7.x), you can download and follow the installation instruction on Python's website:
```sh
https://www.python.org/downloads/
```

Or you can install the latest version of Python through Homebrew by running:
```sh
brew install python
```

[BACK TO TOP](#table-of-contents)


## PHP on Mac

[BACK TO TOP](#table-of-contents)


## MAMP

## Nodejs on Mac
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
Nodemon is a monitoring plugin that restart node.js application automatically if there is any changes happended to the code.  You can get it by running
```sh
sudo npm install -g nodemon
```

Once installation is done, open a terminal window and verify it by running:
```sh
nodemon -v
```

[BACK TO TOP](#table-of-contents)


## Gradle on Mac
Gradle is a build tool for project, you can learn more about it on its [homepage](http://www.gradle.org/) 

To install gradle, the simplest way would be to install it through [Homebrew](#homebrew)

Once you have Homebrew, you can install Gradle by running:
```sh
brew install gradle
```

Once installation is donw, you can verify it by running:
```sh
gradle -v
```

[BACK TO TOP](#table-of-contents)


# Ubuntu

## Tilda
Tilda is an alternative of the system's default terminal, which I found very useful.  It is optional to you, but some of its additional features are just handy.

You can install Tilda by running:
```sh
sudo apt-get install tilda
```

If it returns an error saying it cannot fetch some archives, simply update the repository and then redo the installation by running:
```sh
sudo apt-get update;
sudo apt-get install tilda
```

Once Tilda is successfully installed, you can configure it by running:
```sh
tilda -C
```

[BACK TO TOP](#table-of-contents)


### Oh-My-Zsh
Oh-My-Zsh is an framework for managing your ZSH configuration.  You can learn more about it on its home page:
```sh
https://github.com/robbyrussell/oh-my-zsh
```


## Sublime on Ubuntu
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


## SmartGit
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


## Git on Ubuntu
Git is a version control system, and it should've come with Ubuntu.  In case it is missing on your system, you can install it easily through running:
```sh
sudo apt-get update
sudo apt-get install git
```

To upgrade to the latest version of Git, you can either:
```sh
sudo apt-get upgrade git
```
Or
```sh
git clone https://github.com/git/git
```


## Gitk on Ubuntu
Gitk is a graphical user interface for Git.  You can install it by running:
```sh
sudo apt-get install gitk
```


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


### npm
npm is a tool to manage the packages used by Node.js
```sh
sudo apt-get install npm
```


## Curl on Ubuntu
You can install Curl by running:
```sh
sudo apt-get install curl
```

## OpenSSL on Ubuntu
Ubuntu comes with OpenSSL, but it may need to be upgraded because of the Heartbleed Bug (learn more on: ``http://heartbleed.com/``).  Moreover, newer version of OpenSSL is also required to install the latest Rails.

You can upgrade OpenSSL by running:
```sh
sudo apt-get upgrade openssl
```


## Ruby on Ubuntu
Since Ruby Version Manager (RVM) is also available for Linux and other Unix-like operation system, you can install Ruby easily through using RVM.  You can learn more about RVM on their home page: `https://rvm.io/`

To install the latest RVM along with the latest stable Ruby, you can simply run: 
```sh
\curl -sSL https://get.rvm.io | bash -s stable 
```

If you already have RVM setup, you can update it to the latest vevrsion by running:
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

While installing gems, the process will automatically generate documants, which can be time consuming.  If you perfer online documents over local generated ones, you can skip the auto documents generating process, which would save you some time.

To disable the process, you can create a gem configuation file by running:
```sh
subl ~/.gemrc
```

and then paste and save the following two lines into `.gemrc`
```sh
install: --no-rdoc --no-ri
update:  --no-rdoc --no-ri
```


## Rails on Ubuntu
You can use RVm to install Rails as well.

To install latest stable Rails, you can simply run: 
```sh
\curl -sSL https://get.rvm.io | bash -s stable --rails
```

Or if you already have RVM and Ruby installed, you can install Rails alone by running:
```sh
gem install rails
```

Once installation is done, you can verify it by running:
```sh
rails -v
```


## Java/OpenJDK
Java is essential for many applications.  You can install Java JDK by running: 
```sh
sudo apt-get install openjdk-7-jdk
```

Once installation process is done, you can verify the version of Java by running:
```sh
java -version
```


## Python on Ubuntu
Install Python can be very easy with the help from the DeadSnakes PPA:
```sh
sudo add-apt-repository ppa:fkrull/deadsnakes
sudo apt-get update
sudo apt-get install python2.7
```


## PHP on Ubuntu
PHP is a scripting language for web applications, you can install PHP by running:
```sh
sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt
```

Once installation is done, you can verify it by running:
```sh
php -v
```


## LAMP
LAMP referes to a software bundle including Linux Apache MySQL PHP. You can learn more about it on Ubuntu's page 
```sh
https://help.ubuntu.com/14.04/serverguide/lamp-overview.html
``` 

You can install LAMP in Ubuntu by running:
```sh
sudo tasksel install lamp-server
```


# Fedora

## Git on Fedora
```sh
sudo yum install git-core
```


# General Setup

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

# Setup Android dev engviroment

## Eclipse
Eclipse is an integrated devevelopment environment (IDE) and you can learn more about it on its [homepage](http://www.eclipse.org/).  To use it to develop Android application, I use one of its variant called [Eclipse IDE for Java Developers](http://www.eclipse.org/downloads/packages/eclipse-ide-java-developers/lunar) because it is relatvely smaller than other variants.  You can feel to use the [standard one](http://www.eclipse.org/downloads/packages/eclipse-standard-44/lunar) or other of its variant as well.


## ADT
Once Eclipse is installed, open it and navigate to its Help -> Install New Software.

On the wizard of Install New Software, click on the add button and paste `https://dl-ssl.google.com/android/eclipse/` to `location` and put `Android Development Toolkit plugin` on `name`, then press OK.

Back to the wizard, click on the dropdown list of `Work with`  and select the url item that you just added.

It may take a while for eclipse to get the plugin information, but once the available plugin is displayed, click `Select All` under the displaying section, and then `Next` on the bottom right.  Then follow the instruction to install and plugin and restart Eclipse once the installation is done.


## Android SDK
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


## Gradle
Gradle is a build tool for project, you can learn more about it on its [homepage](http://www.gradle.org/) 

Depends on you OS, you can find instruction for installing Gradle on [Windows](#gradle-on-windows), [Mac](#gradle-on-mac), and [Ubuntu](#gradle-on-ubuntu),