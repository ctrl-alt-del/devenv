git
===
[**Git**](http://git-scm.com) is a distributed version control and code management system.

* [**Windows**](#git-on-windows)
* [**Mac**](#git-on-mac)
* [**Ubuntu**](#git-on-ubuntu)
* [**Fedora**](#git-on-fedora)
* [**Configuration**](#git-configuration)

### Git on Windows
Since Git contains many convenient built-in functions as well as a useful bash shell, it is recommended to be installed first in setting up the dev environment on Windows.

You can download the latest git install file for Windows from [here](http://git-scm.com/download/win)

Once the installation file is downloaded, install it under `/c/usr/bin/git` or whatever directory you chose.  Don't worry about the configuration choices available during the installation process, it would be fine to just keep them in default.

There is a known problem for git bash not remembering command history correctly.

To resolve it, you can execute the follow lines in your bash:
```sh
touch ~/.bash_profile
echo "PROMPT_COMMAND='history -a'" >> "~/.bash_profile"
```
[BACK TO TOP](#table-of-contents)


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
