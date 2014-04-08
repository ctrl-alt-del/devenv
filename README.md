devenv
======

# Setup dev environment on Windows

## Git
Download the lastest git for Windows from git:

http://git-scm.com/download/win

and install it, keep all the install configuration default.

### Setup .bash_profile
After git is installed, let us configure the git bash and have it memorize some convenient shortcuts.

let us navigate to the home directory of git bash by running:
```sh
cd ~
```
then run the bash script on: 
```sh
./devenv/windows/setup_bash_profile.sh
```
this should create a .bash_profile file if it is not existed yet and inject the shortcuts to the file.

After the .bash_profile is created, restart the git bash to let the changes take effect.


## Ruby
Download the lastest Ruby for Windows from here:

http://rubyinstaller.org/downloads/

Choose the appropriate RubyInstaller to download, either x86 or x64 based on your operation system.

Install Ruby on whatever directory you like, for this example, I will pick my directory := /c/usr/bin/ruby

the executable ruby.exe should then be under:

```sh
<directory>/bin/ruby.exe # /c/usr/bin/ruby/bin/ruby.exe
```

Run git bash as administrator, then go to the bin of git bash by running: 
```sh
cd /usr/bin
```

Create a symbolic link by running:
```sh
ln -s <directory>/bin/ruby.exe ruby.exe # ln -s /c/usr/bin/ruby/bin/ruby.exe ruby.exe
```

Verify the symbolic link is working properly by running:
```sh
ruby -v
```

if there is error saying ruby is not found on sh.exe, restart the git bash and run above line again.


## Rails
## Java
## Python
## PHP
## Curl
## Wamp

# Setup dev environment on Mac

## Homebrew
## Git
## Ruby
## Rails
## Java
## Python
## PHP
## Curl
## MAMP

# Setup dev environment on Ubuntu

## PPA
## Git
## Ruby
## Rails
## Java/OpenJDK
## Python
## PHP
## Curl
## LAMP