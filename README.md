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
|[devkit](#devkit)           | [-->](#devkit)                 | N/A                       | N/A                         | N/A                         |
|[RSpec](#rspec)             | [-->](#rspec-on-windows)       | [   ](#rspec-on-mac)      | [   ](#rspec-on-ubuntu)     | [   ](#rspec-on-fedora)     |
|[Express](#express)         | [   ](       )                 | [-->](#express-on-mac)    | [   ](                 )    | [   ](               )      |
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
|[jQuery](#jquery)           | [-->](#jquery-on-windows)      | [-->](#jquery-on-mac)     | [-->](#jquery-on-ubuntu)    | [-->](#jquery-on-fedora)    |
|[Tree](#tree)               | [-->](#tree-on-windows)        | [-->](#tree-on-mac)       | [-->](#tree-on-ubuntu)      | [-->](#tree-on-fedora)      |
|[Android Studio](#android-studio) | [-->](#android-studio-on-windows) | [-->](#android-studio-on-mac) | [-->](#android-studio-on-ubuntu) | [-->](#android-studio-on-fedora) |



* [General Setup](#general-setup)
* [Setup .bash_profile](#setup-bash_profile)
* [Chrome](#chrome)
* [EditThisCookie](#editthiscookie)
* [REST Console](#rest-console)
* [JSON View](#json-view)
* [Setup Android dev environment](#setup-android-dev-enviroment)
* [Flash Issue on older PC](#flash-issue-on-older-pc)

* [Go](https://github.com/ctrl-alt-del/devenv/tree/master/language/go)
* [Java](https://github.com/ctrl-alt-del/devenv/tree/master/language/java)
* [JavaScript](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript)
	* [NodeJS](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript/nodejs)
		* [CoffeeScript](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript/nodejs/coffeescript)
		* [nodemon](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript/nodejs/coffeescript/nodemon)
		* [npm](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript/nodejs/npm)
		* [Sail.js](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript/nodejs/sailjs)
* [PHP](https://github.com/ctrl-alt-del/devenv/tree/master/language/php)
* [Python](https://github.com/ctrl-alt-del/devenv/tree/master/language/python)
* [Ruby](https://github.com/ctrl-alt-del/devenv/tree/master/language/ruby)
	* [Rails](https://github.com/ctrl-alt-del/devenv/tree/master/language/ruby/rails)
* [Rust](https://github.com/ctrl-alt-del/devenv/tree/master/language/rust)
* [Scala](https://github.com/ctrl-alt-del/devenv/tree/master/language/scala)


## Configuration

### Configure Windows
It is a good idea to centralize all your packages in one folder.  Not only does it help to better organize your packages, having a dedicated folder for your packages also makes navigating with command line easier.  In this instruction for Windows, all packages will be put or installed under `~/Applications`, a.k.a `%USERPROFILE%\APplications`.  Please create the folder if it is not existed, and of course, feel free to name your own directory.

If you are familiar with Window's PowerShell, you can create the folder by opening PowerShell and run:
```sh
mkdir -p ~/Applications
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



## Terminal
[**Terminal**](http://en.wikipedia.org/wiki/Command-line_interface), sometime also known as the command line interface (cli) is used to interact with computer programs.

* [**Windows**](#terminal-on-windows)
* [**Mac**](#terminal-on-mac)
* [**Ubuntu**](#terminal-on-ubuntu)
* [**Fedora**](#terminal-on-fedora)

### Terminal on Windows
We are just going to use the Git Bash that comes with [Git](#git-on-windows).

Alternatively, you can try [Cygwin](#cygwin) or [Chocolatey](#Chocolatey).

#### Cygwin
[**Cygwin**](https://www.cygwin.com) is GNU and Open Source tools package manager for Windows.

[BACK TO TOP](#table-of-contents)


#### Chocolatey
[**Chocolatey**](https://chocolatey.org)

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
[**Z shell (Zsh)**](http://en.wikipedia.org/wiki/Zsh) is a Unix base interactive login shell.

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



## Oh-My-Zsh
[**Oh-My-Zsh**](http://ohmyz.sh) is an framework for managing your ZSH configuration.  You can learn more about it on its [git repository](https://github.com/robbyrussell/oh-my-zsh)

* [**Mac**](#oh-my-zsh-on-mac)
* [**Ubuntu**](#oh-my-zsh-on-ubuntu)
* [**Fedora**](#oh-my-zsh-on-fedora)

### Oh-My-Zsh on Mac
According to its [README file](https://github.com/robbyrussell/oh-my-zsh#via-curl), installing oh-my-zsh on Mac can be done by executing this line into your terminal.
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
[**Homebrew**](http://brew.sh) is a package manager for **Mac**.

Since Mac comes with Ruby by default, you can install Homebrew by running:
```sh
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```
[BACK TO TOP](#table-of-contents)



## Sublime
[**Sublime**](http://www.sublimetext.com) is a very useful and convenient text editor.

* [**Windows**](#sublime-on-windows)
* [**Ubuntu**](#sublime-on-ubuntu)
* [**Fedora**](#sublime-on-fedora)
* [**Configuration**](#sublime-configuration)

### Sublime on Windows
Download `.exe` installation file from its [homepage](http://www.sublimetext.com).

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
`subl <FILE_PATH>`, or open all files on current directory by running `subl .`

#### Package Control
[**Package Control**](https://sublime.wbond.net/installation#st2) is the simplest way of install packages to sublime.

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


#### Setup User Preference on Mac
```sh
content="
{
	"draw_white_space": "all",
	"font_size": 14.5,
	"hot_exit": false,
	"ignored_packages":
	[
	"Vintage"
	],
	"remember_open_files": false
}

";

echo "$content" >> ~/Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings;
```


#### Setup User Preference on Ubuntu
```sh
content="
{
	"draw_white_space": "all",
	"font_size": 14.5,
	"hot_exit": false,
	"ignored_packages":
	[
	"Vintage"
	],
	"remember_open_files": false
}

";

echo "$content" >> ~/.config/sublime-text-2/Packages/User/Preferences.sublime-settings;
```


#### Setup Keybindings on Mac
```sh
content="
[
{
	"keys": ["command+i"],
	"command": "reindent",
	"args": {"single_line": false}
},
{
	"keys": ["command+d"],
	"command": "run_macro_file",
	"args": {"file": "Packages/Default/Delete Line.sublime-macro"}
}
]

";

echo "$content" >> "~/Library/Application Support/Sublime Text 2/Packages/User/Default (Mac).sublime-keymap";
```


#### Setup Keybindings on Ubuntu
```sh
content="
[
{
	"keys": ["ctrl+i"],
	"command": "reindent",
	"args": {"single_line": false}
},
{
	"keys": ["ctrl+d"],
	"command": "run_macro_file",
	"args": {"file": "Packages/Default/Delete Line.sublime-macro"}
}
]

";

echo "$content" >> "~/.config/sublime-text-2/Packages/User/Default (Linux).sublime-keymap";
```



## Git
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


## Gradle
[**Gradle**](http://www.gradle.org) is a build tool for project.  If you only use gradle for Android development, consider using the gradle wrapper coming with Android Stadio.

* [**Windows**](#gradle-on-windows)
* [**Mac**](#gradle-on-mac)
* [**Ubuntu**](#gradle-on-ubuntu)
* [**Fedora**](#gradle-on-fedora)

### Gradle on Windows
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

You may also add `%GRADLE_HOME%` to your environment variable with value equals to `C:\usr\bin\gradle`.

[BACK TO TOP](#table-of-contents)


### Gradle on Mac
To install gradle on Mac, the simplest way would be to install it through [Homebrew](#homebrew)

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
If you prefer installing Gradle manually, you can follow the instruction [here](#gradle-on-fedora).

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
To install Gradle on Fedora or other Linux/Unix base distro, you need to do so manually.

First of all, visit the [here](http://www.gradle.org/downloads) and download the version you are interesting.

Once download is done, unzip the file and the move the folder under `/opt`.

Afterwards, configure the PATH to make Gradle available in terminal, and there are multiple way to achieve this:

#### Add Symbolic Link
The easiest way is to create a symbolic link for Gradle on `/usr/bin`; since `/usr/bin` is the system default path, it will be loaded automatically whenever `.bashrc` is loaded.
```sh
sudo ln -s /opt/gradle-1.12/bin/gradle /usr/bin/gradle
```
[BACK TO TOP](#table-of-contents)


#### Add to `~/.bash_profile`
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

[BACK TO TOP](#table-of-contents)


#### Add to `~/.bashrc`
Alternatively, if you use Gradle on a daily basis, you may consider just adding the `GRADLE_HOME` to your `~/.bashrc` because it will then be automatically loaded whenever you open your terminal.

To do so, it is very similar to the instruction of adding it to `~/.bash_profile`, but since `~/.bashrc` always exist, you can just open it with `vi` and add the lines to the end of it.
```sh
export GRADLE_HOME="/opt/<gradle_folder_name>/bin"
export PATH=$GRADLE_HOME:$PATH
```
Again, `<gradle_folder_name>` is something similar to `gradle-1.12` and etc.

Once you are done adding those lines, save and exist the editor and you are good to go. Gradle would be ready to use whenever you open a terminal.

Or you can run the script here:
```sh
wget https://services.gradle.org/distributions/gradle-1.12-bin.zip
unzip gradle-1.12-bin.zip
sudo mv gradle-1.12 /opt
sudo rm gradle-1.12-bin.zip
sudo ln -s /opt/gradle-1.12/bin/gradle /usr/bin/gradle
```
[BACK TO TOP](#table-of-contents)


#### Gradle Configuration on Android
##### Rquired Plugin
Declare as Android project and use appropriate plugin:
```gradle
apply plugin: 'com.android.application'
```


##### Add remote repository
Added maven central as the source of missing repositories
```gradle
buildscript {
	repositories {
		mavenCentral()
	}
}
```


##### Include `/libs/*.jar` files
To include downloaded jar files in your build:
```gradle
dependencies {
	compile fileTree(dir: 'libs', include: '*.jar')
}
```


##### Match Folder Structure with Gradle Default Paths
```gradle
sourceSets {
	main {
		manifest.srcFile 'AndroidManifest.xml'
		java.srcDirs = ['src']
		resources.srcDirs = ['src']
		aidl.srcDirs = ['src']
		renderscript.srcDirs = ['src']
		res.srcDirs = ['res']
		assets.srcDirs = ['assets']
		jniLibs.srcDirs = ['jniLibs']
	}
}
```


##### Enable Multi-dex
Multi-dex is needed if there is more than 65535 lines of compile methods
```gradle
android {
	defaultConfig {
		multiDexEnabled true
	}
}
```


##### Limit Max dex Memory
Set incremental dex to true and limit the max dex memory to reduce build time in Android Studio.
```gradle
android {
	dexOptions {
		incremental true
		javaMaxHeapSize "4g"
	}
}
```


##### Define Build Type
You may apply different configurations for debug and release version of your app:
```gradle
buildTypes {
	release {
	}

	debug {
	}
}
```


##### Define Build Configuration Field
Build configuration fields can be defined and used for different build types:

```gradle
buildTypes {
	release {
		buildConfigField "String", "STRING_FIELD_NAME", "string_field_value"
		buildConfigField "int", "INTEGER_FIELD_NAME", "-1"
	}

	debug {
		buildConfigField "boolean", "BOOLEAN_FIELD_NAME", "true"
	}
}
```



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


## SQLite
[**SQLite**](http://www.sqlite.org) is an embedded database system.

* [**Windows**](#sqlite-on-windows)
* [**Mac**](#sqlite-on-mac)
* [**Ubuntu**](#sqlite-on-ubuntu)

### SQLite on Windows
Download the latest SQLite for Windows from [here](http://www.sqlite.org/download.html)

Scroll down the page to the "Precompiled Binaries for Windows" section, and download the sqlite-shell and sqlite-dll files.

Or run the following lines on your git bash:
```sh
cd ~
curl --remote-name "http://www.sqlite.org/2015/sqlite-shell-win32-x86-3081000.zip"
curl --remote-name "http://www.sqlite.org/2015/sqlite-dll-win32-x86-3081000.zip"
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
[**MySQL**]() is a full stack relational database system.

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
[**PostgreSQL**](http://www.enterprisedb.com) is similar to MySQL and it is the default database used on [Heroku](http://www.heroku.com).

* [**Windows**](#postgresql-on-windows)
* [**Mac**](#postgresql-on-mac)
* [**Ubuntu**](#postgresql-on-ubuntu)
* [**Fedora**](#postgresql-on-fedora)

### PostgreSQL on Windows
Visit [PostgreSQL's download page](http://www.enterprisedb.com/products-services-training/pgdownload#windows) and download the `.msi` file for Windows.

Once downloaded, double click to install.

[BACK TO TOP](#table-of-contents)


### PostgreSQL on Mac
```sh
brew update
brew install postgresql
```

Alternatively, you can download the `.app` file from [PostgreSQL](http://www.postgresql.org/download/macosx).  Once the file is downloaded, double click it to install.

[BACK TO TOP](#table-of-contents)


### PostgreSQL on Ubuntu
```sh
sudo apt-get install postgresql postgresql-contrib
```
[BACK TO TOP](#table-of-contents)


### PostgreSQL on Fedora
```sh
sudo yum install postgresql postgresql-contrib
```
[BACK TO TOP](#table-of-contents)


## Guake
[**Guake**](http://guake.org) is a terminal for Gnome.

* [**Ubuntu**](#guake-on-ubuntu)
* [**Fedora**](#guake-on-fedora)
* [**Configuration**](#guake-configuration)

### Guake on Ubuntu
```sh
sudo apt-get install guake
```
[BACK TO TOP](#table-of-contents)


### Guake on Fedora
```sh
sudo yum install guake
```
[BACK TO TOP](#table-of-contents)


## Guake Configuration
Guake is open source and written in python.  Therefore, you can customize it as you wish with default editor, `gedit` of Linux distros by modifying its source file, usually located at `/usr/lib/guake/guake.py`.
```sh
sudo gedit /usr/lib/guake/guake.py
```
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



## Eclipse
[**Eclipse**](http://www.eclipse.org) is an integrated development environment (IDE).

Although Google recommendeds [Android Studio](#android-studio) for Android development, you can still use eclipse as your IDE if you prefer to.  I use one of its variant called [Eclipse IDE for Java Developers](http://www.eclipse.org/downloads/packages/eclipse-ide-java-developers/lunasr2) because it is relatively smaller than other variants.  You can to use its [standard package](http://www.eclipse.org/downloads/packages/eclipse-standard-44/lunar) or other variants as well.

* [**Mac**](#eclipse-on-mac)
* [**Ubuntu**](#eclipse-on-ubuntu)
* [**Fedora**](#eclipse-on-fedora)

### Eclipse on Mac
Visit the [Eclipse's download page](http://www.eclipse.org/downloads) and download the **Eclipse IDE for Java Developers** that fits your system (either 32 or 64 bit)

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
cd <unzip_folder_path>/sdk/tools
./android sdk
```
Once the command lines in above is executed, it should popup an user interface to let you select SDKs and tools to download.

You need the following package from the SDK:
```sh
./Tools/Android SDK Tools
./Tools/Android SDK Build-tools
./Tools/Android SDK Platform-tools
./Extras/Android Support Repository
./Extras/Android Support Library
./Extras/Google Play services
./<API_version>/SDK Platform
./<API_version>/ARM EABI v7a System Image
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
[**ADT**](http://developer.android.com/tools/help/adt.html) stands for Android Development Toolkit.

Once Eclipse is installed, open it and navigate to its Help -> Install New Software.

On the wizard of Install New Software, click on the add button and paste `https://dl-ssl.google.com/android/eclipse/` to `location` and put `Android Development Toolkit plugin` on `name`, then press OK.

Back to the wizard, click on the drop down list of `Work with`  and select the url item that you just added.

It may take a while for eclipse to get the plugin information, but once the available plugin is displayed, click `Select All` under the displaying section, and then `Next` on the bottom right.  Then follow the instruction to install and plugin and restart Eclipse once the installation is done.

### Empty src folder on creating new project
This [issue](http://stackoverflow.com/questions/22215499/src-folder-empty-on-creating-new-android-project) can be resolved by replacing the `http` with `https` on the ADT installation url.

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



## PyCharm
[**PyCharm**](http://www.jetbrains.com/pycharm) is an IDE based on IntelliJ IDEA for Python development.

* [**Windows**](pycharm-on-windows)
* [**Mac**](pycharm-on-mac)
* [**Ubuntu**](pycharm-on-ubuntu)
* [**Fedora**](pycharm-on-fedora)

### PyCharm on Windows
Download [PyCharm](http://www.jetbrains.com/pycharm/download)

Once download is completed, double click the `.exe` file and follow the instruction to install.

[BACK TO TOP](#table-of-contents)


### PyCharm on Mac
Download [PyCharm](http://www.jetbrains.com/pycharm/download)

Once download is completed, double click the `.dmg` file and follow the instruction to install.

[BACK TO TOP](#table-of-contents)


### PyCharm on Ubuntu
Download [PyCharm](http://www.jetbrains.com/pycharm/download)

Once download is down, unzip it and move it to the `/opt/pycharm`, which may require you to have root permission to do so.

make a symbolic link
```sh
sudo ln -s /opt/pycharm/bin/pycharm.sh /usr/bin/pycharm
```

You may skip the process of setting shortcut icon manually since later version of Pychram for Linux does the setup automatically.  However, in case the icon is not generated, you may follow the steps in below to set it up.

Setup Desktop Icon:
```sh
sudo touch /usr/share/applications/pycharm.desktop

content="
[Desktop Entry]
Name=PyCharm
GenericName=Python IDE
Type=Application
Exec="/opt/pycharm/bin/pycharm.sh" %f
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
[**Android Studio**](https://developer.android.com/sdk/index.html) is a Integrated Development Environment based on IntelliJ IDEA for Android development.

Note that the latest version of Android Studio requires Gradle 2.2 and above; therefore, please make sure you have it installed.  You can also follow the instruction of installing Gradle in [here](#gradle).

Also, Android development requires [Java](#java),  please follow its instruction to install the it.  Note that Android Studio would recommend using Oracle JDK instead of using OpenJDK.

* [**Windows**](#android-studio-on-windows)
* [**Mac**](#android-studio-on-mac)
* [**Ubuntu**](#android-studio-on-ubuntu)
* [**Fedora**](#android-studio-on-fedora)

### Android Studio on Windows
Download Android Studio from its [home page](https://developer.android.com/sdk/installing/studio.html)

Once download is done, follow the instruction to install Android Studio and SDK.

Note that Android Studio requires access to public internet in order to download dependencies and build.  In case that you have denied its access, you can visit `Control Panel` -> `System and Security` -> `Windows Firewall` -> `Allow a program or feature through Windows Firewall` to grant it public internet access permission.

Note that Android Virtual Machine (AVD) requires [Intel Hardware Accelerated Execution Manager (Intel HAXM)](https://software.intel.com/en-us/android/articles/intel-hardware-accelerated-execution-manager), which you can get it from Android SDK Manager under `/Extras/Intel x86 Emulator Accelerator (HAXM installer).  The installer should install the Intel HAXM automatically, but it requires manual installation in some occasion.  To install Intel HAXM manually on windows, simply navigate to `<SDK_Directory>\extras\intel\Hardware_Accelerated_Execution_Manager` and execute the `intelhaxm-android.exe` file.

[BACK TO TOP](#table-of-contents)


### Android Studio on Mac
Download Android Studio from its home page [here](https://developer.android.com/sdk/installing/studio.html)

Once download is done, unzip it and then move the `.app` file to Application folder.

The newer version of Android Studio for Mac no long comes with Android SDK, therefore, you need to download the SDK seperately from [here](#sdk-on-mac).

[BACK TO TOP](#table-of-contents)


### Android Studio on Ubuntu
Download and install:
```sh
wget https://dl.google.com/dl/android/studio/ide-zips/1.3.0.10/android-studio-ide-141.2117773-linux.zip
unzip android-studio-ide-141.2117773-linux.zip
sudo mv android-studio /opt/android-studio
sudo mv -f android-studio-ide-141.2117773-linux.zip ~/Downloads/
sudo ln -s /opt/android-studio/bin/studio.sh /usr/bin/aso
```

(Optional for version 1.0.+) Setup Desktop Icon:
```sh
sudo touch android-studio.desktop

content="
[Desktop Entry]
Name=Android Studio
GenericName=Android IDE
Version=1.3
Type=Application
Exec="/opt/android-studio/bin/androidstudio.icostudio.sh" %f
Terminal=false
Icon=/opt/android-studio/bin/androidstudio.ico
Comment=Android Studio
NoDisplay=false
Categories=Development;IDE
Keywords=IDE;Android;Studio;Development;IntelliJ
Name[en]=Android Studio
";

echo "$content" >> android-studio.desktop;
sudo mv android-studio.desktop /usr/share/applications
```

Alternatively, you can open Android Studio and click on `Configure` -> `Create Desktop Entry`

The newer version of Android Studio for Linux no long comes with Android SDK, therefore, you need to download the SDK separately.  If you haven't already done so, you can follow the instruction [here](#sdk-on-ubuntu) to setup the Android SDK.

To setup Android Virtual Machine (AVD) on Ubuntu or to use any type of virtual machine, you need to first enable CPU virtualization technology on your BIOS, this selection is usually named `VT-x` under `Config` tab.

Afterwards, you need to install Kernel Virtual Machine (KVM)
```sh
sudo apt-get install qemu-kvm ubuntu-vm-builder
```

Once installation is done, restart your computer, and you will now be able to use AVD.

There are some known issues for ADB in Ubuntu:
1. ADB not responding for 64 bit Ubuntu.
You can solve this issue by installing some 32 bit support libraries:
```sh
sudo apt-get install lib32z1 lib32z1-dev lib32stdc++6
```
[BACK TO TOP](#table-of-contents)


### Android Studio on Fedora
Follow the same instruction of [Ubuntu](#android-studio-on-ubuntu).

[BACK TO TOP](#table-of-contents)



## RSpec
[**RSpec**](http://rspec.info) is a Behavior Driven Development tool.  Rails is its prerequisite.

To verify Rails is installed in your machine, you can run:
```sh
rails -v # should show the version number
```

* [**Windows**](#rspec-on-ubuntu)

### RSpec on Windows
```sh
gem install rspec
```

Once installation is done, verify it by running:
```sh
which rspec
```
[BACK TO TOP](#table-of-contents)



## iTerm2
[**iTerm2**](http://iterm2.com) is essential a terminal armed with more features.  You can download it [here](https://iterm2.com/downloads/stable/iTerm2_v2_0.zip).

Once download is completed, unzip the package and double click `.app` file to install it.

[BACK TO TOP](#table-of-contents)



## Homebrew
[**Homebrew**](http://brew.sh) is a package manager for Mac.

To install homebrew, simply open your terminal and running:
```sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
[BACK TO TOP](#table-of-contents)



## Tilda
[**Tilda**](https://github.com/lanoxx/tilda) is an alternative of the system's default terminal.

* [**Ubuntu**](#tilda-on-ubuntu)
* [**Fedora**](#tilda-on-fedora)
* [**Others**](#tilda-on-others)

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


### Tilda on Others
Please follow the [instruction](https://github.com/lanoxx/tilda/blob/master/HACKING.md) to compile and install Tilda.

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
You need to download and install redis manually on Ubuntu.
```sh
wget http://download.redis.io/releases/redis-stable.tar.gz
tar xzf redis-stable.tar.gz
cd redis-stable
make
```

Once installation is done, you can remove the folder and the zip file by running:
```sh
cd ..
rm -rf redis-stable
rm redis-stable.tar.gz
```
[BACK TO TOP](#table-of-contents)


### Redis on Fedora
Follow the same instruction as [Ubuntu](#redis-on-ubuntu)

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

* [**Windows**](#jquery-on-windows)
* [**Mac**](#jquery-on-mac)
* [**Ubuntu**](#jquery-on-ubuntu)

### jQuery on Windows
You can download the compressed or uncompressed copies of jQuery files [here](http://jquery.com/download) and include them in your file.

[BACK TO TOP](#table-of-contents)

### jQuery on Mac
You need [`bower`](#bower) as a prerequisite
```sh
bower install jquery
```
[BACK TO TOP](#table-of-contents)


### jQuery on Ubuntu
Follow the same instruction as [Mac](#jquery-on-mac).

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
