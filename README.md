devenv
======

### About
I use both Mac and Windows regularly and sometimes Ubuntu.  Although I mostly use Mac as my coding machine, I am very interested in coding on my Windows machine as well.  After some reseaches as well as trials and errors, I am able to setup the dev environment on my Windows machine and I am pretty happy with it so far.  I think it may be a good idea to share the setup process with the community, and hopefully it can save other people some time :).

### Disclaimer
This document and bash scripts will be updated piece by piece and I will try my best to describe the process step by step.  Please feel free to let me know if you see anything confusing/unclear/wrong or you have any recommendations.  Thank you :).

# Table of Contents

* [Setup dev environment on Windows] (#setup-dev-environment-on-windows)
	* [Installation Folder] (#installation-folder)
	* [Git] (#git)
		* [Setup .bash_profile] (#setup-bash_profile)
	* [Curl] (#curl)
	* [Ruby] (#ruby)
		* [devkit] (#devkit)
	* [Rails] (#rails)
		* [RSpec] (#rspec)
	* [SQLite] (#sqlite)
	* [Java] (#java)
	* [Python] (#python)
	* [PHP] (#php)
	* [WAMP] (#wamp)
	* [Android SDK] (#android_sdk)
	
* [Setup dev environment on Mac] (#setup-dev-environment-on-mac)

* [Setup dev environment on Ubuntu 14.04 LTS] (#setup-dev-environment-on-ubuntu-1204-lts)
	* [Tilda] (#Tilda)
	* [Sublime Text 2] (#sublime)
	* [SmartGit] (#smartgit)
	* [Git] (#git)

* [Setup dev environment with Chef](#setup-dev-environment-with-chef)

# Setup dev environment on Windows

## Installation Folder
It is a good idea to centralize all your packages in one folder.  Not only does it help  to better organize your packages, having a dedicated folder for your packages also makes navigating with command line easier.  In this instruction, all packages will be put or installed under /c/usr/bin (a.k.a "C:\usr\bin").  Please create the folder if it is not existed, or feel free to name your own directory. 

If you are familiar with Window's PowerShell, you can create the folder by opening PowerShell and run:
```sh
mkdir -p /usr/bin
```


## Git
Git is a distributed version control and code management system.  You can learn more detail about it on its home page.
```sh
http://git-scm.com/
```

Since Git contains many convenient built-in functions as well as a useful bash shell, it is the first software on my list to be installed to setup a dev environment on Windows machines.

You can download the latest git for Windows from its home page, or by copying and pasting the following link to the address bar of your browser.  The download process should then be automatically started.
```sh
http://git-scm.com/download/win
```

Once the installation file is downloaded, install it under /c/usr/bin/git or whatever directory you chose.  Don't worry about the configuration choices available during the installation process, it would be fine to just keep them in default.


### Setup .bash_profile
After git is installed, let us configure the git bash and have it memorize some convenient shortcuts.

Open git bash as administrator by right click on the icon of git bash and select "Run as Administrator".

Navigate to the home directory of your windows by running:
```sh
cd ~ # /c/Users/<YOUR_PC_USER_NAME>
```
then run the bash script on the following path of this repository: 
```sh
./devenv/windows/setup_bash_profile.sh
```
this should create a .bash_profile file if it is not existed and inject the shortcuts to the file.

Or if you prefer to create the .bash_profile file manually, you can do so by running:
```sh
touch .bash_profile
```
and add the scripts to it.

After the .bash_profile is created, restart the git bash to let the changes take effect.


## Curl
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


## Ruby
Ruby is the prerequisite for Rails.  You can download the latest Ruby for Windows from here:

http://rubyinstaller.org/downloads/

Choose the appropriate RubyInstaller to download, either x86 or x64 based on your operation system.

Or run the following line if you are in 64-bit system:
```sh
curl --remote-name "http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.0.0-p481-x64.exe"
```

Or run the following line if you are in 32-bit system:
```sh
curl --remote-name "http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.0.0-p481.exe"
```

Install Ruby under /c/usr/bin/ruby or whatever directory you chose

the executable ruby.exe should then be under:
```sh
/c/usr/bin/ruby/bin/ruby.exe
```

Run git bash as administrator, then go to the bin of git bash by running: 
```sh
cd /usr/bin
```

Create a symbolic link by running:
```sh
ln -s /c/usr/bin/ruby/bin/ruby.exe ruby.exe
```

Verify the symbolic link is working properly by running:
```sh
which ruby # should see /usr/bin/ruby
```

if there is error saying ruby is not found on sh.exe, restart the git bash and run above line again.

Once you restarted the git bash and verified ruby is installed on your machine, you can check its version by running:
```sh
ruby -v
```

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


## Rails
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


## SQLite
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


## Java
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


## Python
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


## PHP
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


## Wamp
Download the latest PHP for Windows from here:

http://www.wampserver.com/en/

Choose the appropriate Thread Safe zip to download, either x86 or x64 based on your operation system.

install the downloaded file to /c/usr/bin/wamp, or whatever directory you chose. Keep installation configurations default.

## Android SDK
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


# Setup dev environment on Mac

## Terminal

Terminal will be used to setup the dev environment on Mac.  To open a terminal prompt, press "command" and "space" key at the same time to open Spotlight, then type in "terminal" (without quotes) and hit return.  A terminal prompt should show up.

## Homebrew

Homebrew is a package manager for Mac, which I like very much.  You can learn more about it on their website:
```sh
http://brew.sh/
```

To install homebrew, simply open your terminal and running:
```sh
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

## Git

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


## Curl

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


## Ruby (prerequisite for installing Rails)

Mac should have Ruby installed by default.  To verify it, you can open your terminal and run:
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


## Rails

Once Ruby is installed in your Mac, you can install Rails through terminal by simply running:
```sh
gem install rails
```

Once installation is done, verify it through running:
```sh
which rails
```

## RVM (Optional)
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


## Java

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


## Python

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


## PHP
## MAMP


# Setup dev environment on Ubuntu 14.04 LTS

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

### Oh-My-Zsh
Oh-My-Zsh is an framework for managing your ZSH configuration.  You can learn more about it on its home page:
```sh
https://github.com/robbyrussell/oh-my-zsh
```


## Sublime
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
```sh
subl <path_to_your_file>
```
Or open all files with the current directory by running:
```sh
subl .
```


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


## Git
Git is a version control system, and it should've come with Ubuntu.  In case it is missing on your system, you can install it easily through running:
```sh
sudo apt-get update
sudo apt-get install git
```

## Gitk
Gitk is a graphical user interface for Git.  You can install it by running:
```sh
sudo apt-get install gitk
```


## Node.js
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



## Curl
You can install Curl by running:
```sh
sudo apt-get install curl
```

## OpenSSL
Ubuntu comes with OpenSSL, but it may need to be upgraded because of the Heartbleed Bug (learn more on: ``http://heartbleed.com/``).  Moreover, newer version of OpenSSL is also required to install the latest Rails.

You can upgrade OpenSSL by running:
```sh
sudo apt-get upgrade openssl
```


## Ruby
Since Ruby Version Manager (RVM) is also available for Linux and other Unix-like operation system, you can install Ruby easily through using RVM.  You can learn more about RVM on their home page:
```sh
https://rvm.io/
```

To install the latest RVM along with the latest stable Ruby, you can simply run: 
```sh
\curl -sSL https://get.rvm.io | bash -s stable 
```

Once installation is done, you can verify it by running:
```sh
ruby -v
```


## Rails
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


## Python
## PHP


## LAMP
LAMP referes to a software bundle including Linux Apache MySQL PHP. You can learn more about it on Ubuntu's page 
```sh
https://help.ubuntu.com/14.04/serverguide/lamp-overview.html
``` 

You can install LAMP in Ubuntu by running:
```sh
sudo tasksel install lamp-server
```


## Setup dev environment with Chef