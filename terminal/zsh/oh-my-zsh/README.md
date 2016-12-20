oh-my-zsh
=========
[**Oh-My-Zsh**](http://ohmyz.sh) is an framework for managing your ZSH configuration.  You can learn more about it on its [git repository](https://github.com/robbyrussell/oh-my-zsh)

* [**Windows**](#oh-my-zsh-on-windows)
* [**Mac**](#oh-my-zsh-on-mac)
* [**Ubuntu**](#oh-my-zsh-on-ubuntu)
* [**Fedora**](#oh-my-zsh-on-fedora)

### Oh-My-Zsh on Windows(?)
Windows is a tricky case for using zsh and oh-my-zsh.  The easiest way is to install emulator of Unix-like command line terminal, such as Cygwin or Chocolatey.

Other than that, the only "alternative" I have found so far is to use [git-bash](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/git/git-bash) and mimic it with a oh-my-zsh theme.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv/tree/master/terminal)


### Oh-My-Zsh on Mac
According to its own [instruction](https://github.com/robbyrussell/oh-my-zsh#via-curl), installing oh-my-zsh on Mac can be done by executing this line into your terminal.
```sh
curl -L http://install.ohmyz.sh | sh
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv/tree/master/terminal)


### Oh-My-Zsh on Ubuntu
You need [Git](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/git), [Zsh](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/zsh) and [wget](https://github.com/ctrl-alt-del/devenv/tree/master/network/wget) as the prerequisites.
```sh
sudo apt-get install git zsh wget
```

Once you have installed the prerequisites, you can grab `oh-my-zsh` using `wget`:
```sh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
```

Or, you can do so using `curl` instead:
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Once `oh-my-zsh` is downloaded into your home directory, you can set it as your default bash using:
```sh
chsh -s `which zsh`
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv/tree/master/terminal)


### Oh-My-Zsh on Fedora
You need [Git](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/git), [Zsh](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/zsh) and [wget](https://github.com/ctrl-alt-del/devenv/tree/master/network/wget) as the prerequisites.
```sh
sudo yum install git zsh wget
```

Then follow the same instruction as [Ubuntu](#oh-my-zsh-on-ubuntu).

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv/tree/master/terminal)
