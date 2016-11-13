Go
==
[**Go**](https://golang.org) is an open source programming language developed by Google.

* [**Windows**](#go-on-windows)
* [**Mac**](#go-on-mac)
* [**Ubuntu**](#go-on-ubuntu)
* [**Fedora**](#go-on-fedora)


### Go on Windows
Visit [Go's download page](https://golang.org/dl) and download the latest `.msi` file.

Once download is completed, double click the `.msi` file and follow its wizard to install.  Note that you need to remove any old version of **Go** before installing the new version of Go.

If you are using git bash, follow the instruction for [Ubuntu](#go-on-ubuntu) to set the `PATH` variables.

You may also edit the environment variables of Windows to enable the `go` commands on `cmd` or `PowerShell`.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv/tree/master/language)



### Go on Mac
Visit [Go's download page](https://golang.org/dl) and download the latest `.pkg` file.

Once download is completed, double click the `.pkg` file and follow the instruction to install Go on your computer.

Once installation is done, follow the same instruction for [Ubuntu](go-on-ubuntu) to update the `$PATH` on Mac.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv/tree/master/language)



### Go on Ubuntu
Visit [Go's download page](https://golang.org/dl) and download the latest `.tar.gz` file.

Note that you need to remove any old version of **Go** before installing the latest version.

Once download is completed, unzip the file and rename the unzipped folder as `go`.

Move `go` folder to one of your `$PATH`, the documentation recommends `/usr/local`.  Note that you need root permission to perform this task.
```sh
sudo mv go/ /usr/local
```

Once the folder is moved, you need to append the definition of `$GOROOT` and `$GOPATH` to your `$PATH`.  `$GOROOT` is the path of `go/bin` folder; in this case, it is `usr/local/go/bin`.  

`$GOPATH` is the place that you will be storing all your source code, modules, packages and third-party libraries; and according to the latest documentation of Go, it recommends to put it either under `/home` (for all users) or `~` (for particular user); in this case, put it as `~/GoPath`.  

To create the `GoPath` folder if it is not yet existed, you can do so by executing `mkdir -p ~/GoPath`.
```sh
export GOROOT=/usr/local/go
export GOROOT_BIN="$GOROOT/bin"
export GOPATH="$HOME/GoPath" # GOPATH is the folder of your go repositories going to sit
export GOBIN="$GOPATH/bin"
export PATH=$PATH:$GOROOT:$GOROOT_BIN:$GOPATH:$GOBIN
```

To append `$GOROOT`, `$GOROOT_BIN`, `$GOPATH` and `$GOBIN` to your `$PATH`, you can choose either of the following approaches:
1. The easiest and most conservative approach is to create the `~/.bash_profile` and append the code to it; you can do `source ~/.bash_profile` whenever you need the configurations.  
2. You can append the code to your `~/.bashrc` so that `go` will be loaded whenever you open up terminal.
3. If you use `zsh` shell, you can append the code to your `~/.zshrc` so that `go` will be loaded whenever you open up your zsh shell terminal.
4. You can append the code to `~/.profile` so that Go will be loaded whenever you sign in to you computer.

Alternatively, you can install Go from its source.  To do so, visit [Go's source install page](https://golang.org/doc/install/source) and follow instruction there to install.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv/tree/master/language)



### Go on Fedora
Follow the same instruction as [Ubuntu](#go-on-ubuntu).

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv/tree/master/language)



### Useful packages
```sh
go get github.com/mattn/go-sqlite3
go get github.com/alexcesaro/mail/gomail
go get github.com/twinj/uuid
```
