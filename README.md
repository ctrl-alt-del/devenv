devenv
======

# About/Disclaimer
I use both Mac and Windows regularly and sometimes Ubuntu.  Although I mostly use Mac as my coding machine, I am very interested in coding on my Windows machine as well.  After some reseaches as well as trials and errors, I am able to setup the dev environment on my Windows machine and I am pretty happy with it so far.  

I think it may be a good idea to share the setup process with the community, maybe it can save them some time (hopefully :-) ).  This document will be updated piece by piece and I will try my best to describe the process step by step.  Please let me know if you see anything confusing/unclear/wrong or you have any recommendations.  Thank you.

# Setup dev environment on Windows

## Installation Folder
Having a folder to centralize all your packages is always good.  In this instruction, all packages will be put or installed inside /c/usr/bin (or "C:\usr\bin") for better management. Please create the folder if it is not existed, or feel free to choose your own directory.


## Git
Download the latest git for Windows from git:

http://git-scm.com/download/win

and install it under /c/usr/bin/git or whatever directory you chose, simply keep all the configuration choices in their default if you don't know what they mean.

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

After the .bash_profile is created, restart the git bash to let the changes take effect.


## Curl (Optional, Curl should come with Git by default.  If it is not, you can download and configure it by following the instruction in below)

Download the latest curl for Windows from here:
http://curl.haxx.se/download.html

Choose the curl-[version].zip from source achieve to download.

When it is done, unzip it to the directory your chose, in this example, it would be /c/usr/bin.

Once it is unzipped, rename the unzipped folder to "curl" (without quotes)

Run git bash as administrator, then go to the bin of git bash by running: 
```sh
cd /usr/bin
```

Create a symbolic link by running:
```sh
ln -s /c/usr/bin/curl/curl.exe curl.exe
```


## Ruby
Download the latest Ruby for Windows from here:

http://rubyinstaller.org/downloads/

Choose the appropriate RubyInstaller to download, either x86 or x64 based on your operation system.

Or run the following line if you are in 64-bit system:
```sh
curl --remote-name "http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.0.0-p451-x64.exe?direct"
```

Or run the following line if you are in 32-bit system:
```sh
curl --remote-name "http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.0.0-p451.exe?direct"
```

Install Ruby on /c/usr/bin/ruby or whatever directory you chose

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
ln -s /c/usr/bin/ruby/bin/ruby.exe ruby.exe # ln -s /c/usr/bin/ruby/bin/ruby.exe ruby.exe
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

## devkit (prerequisite for installing Rails)
Download the latest devkit for Windows from here:

http://rubyinstaller.org/downloads/

Scroll down to "Other Userful Downloads" and it is under "development kit" section.

Choose the appropriate devkit to download, either x86 or x64 based on your operation system.

Once the download is done, double click on the executable file and install/unzip it to /c/usr/bin/devkit, or whatever directory you chose.

Run git bash as administrator and then runthe following lines one by one: 
```sh
cd /c/usr/bin/devkit
ruby dk.rb init
ruby dk.rb install
```

If there is no error shows up, the setup is successful.


## Rails





## Java
ownload the latest Java for Windows from here:

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


## PHP
Download the latest PHP for Windows from here:

http://windows.php.net/download/

Choose the appropriate Thread Safe zip to download, either x86 or x64 based on your operation system.
Or use the following:
```sh
curl --remote-name http://windows.php.net/downloads/releases/php-5.5.11-Win32-VC11-x64.zip
```

Unzip the downloaded file to whatever directory you like, for this example, I will pick my directory := /c/usr/bin/php

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

# Setup dev environment on Mac

## Homebrew
## Git
## Curl
## Ruby
## Rails
## Java
## Python
## PHP
## MAMP

# Setup dev environment on Ubuntu

## PPA
## Git
## Curl
## Ruby
## Rails
## Java/OpenJDK
## Python
## PHP
## LAMP