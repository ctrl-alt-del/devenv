Go
==
[**Go**](https://golang.org) is an open source programming language developed by Google.

* [**Windows**](#go-on-windows)
* [**Mac**](#go-on-mac)
* [**Ubuntu**](#go-on-ubuntu)
* [**Godep**](#godep)



### Go on Windows
Visit [Go's download page](https://golang.org/dl) and download the latest `.msi` file, which is in bold.

Once download is completed, double click the file and follow its instruction to install.  Note that you need to remove any old version of **Go**.

If you are using git bash, follow the instruction for [Ubuntu](#go-on-ubuntu) to set the `PATH` variables.

You may also edit the environment variables of windows to enable the `go` commands on `cmd` or PowerShell.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)



### Go on Mac
Visit [Go's download page](https://golang.org/dl) and download the latest `.pkg` file.

Once download is completed, double click the `.pkg` file to install Go on your computer, and then follow the same instruction for [Ubuntu](go-on-ubuntu) to update the `$PATH` on Mac.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)



### Go on Ubuntu
Visit [Go's download page](https://golang.org/dl) and download the latest `.tar.gz` file.

Note that you need to remove any old version of **Go** before installing the latest version.

Once download is completed, unzip the file and rename the unzipped folder as `go`.

Move `go` folder to one of your `$PATH`, the documentation recommends `/usr/local`.  Note that you need root permission to perform this task.
```sh
sudo mv go/ /usr/local
```

Once the folder is moved, you need to append the definition of `$GOROOT` and `$GOPATH` to your `$PATH`.  `$GOROOT` is the path of `go/bin` folder; in this case, it is `usr/local/go/bin`.  `$GOPATH` is the place that you will be storing all your source code, modules, packages and third-party libraries; and according to the latest documentation of Go, it recommends to put it either under `/home` (for all users) or `~` (for particular user); in this case, put it as `~/GoPath`.  To create the `GoPath` folder if it is not yet existed, you can do so by executing `mkdir -p ~/GoPath`.
```sh
export GOROOT=/usr/local/go
export GOROOT_BIN="$GOROOT/bin"
export GOPATH="$HOME/GoPath"
export GOBIN="$GOPATH/bin"
export PATH=$PATH:$GOROOT:$GOROOT_BIN:$GOPATH:$GOBIN
```

To append `$GOROOT` and `$GOPATH` to your `$PATH`, you can choose either of the following approaches:
1. The easiest being adding the above code to your `~/.bash_profile` and do `source ~/.bash_profile` when you need it.  
2. You can add the code to your `~/.bashrc` so that Go will be loaded whenever you open up terminal.
3. You can add the code to `~/.profile` so that Go will be loaded whenever you sign in to you computer.

Alternatively, you can install Go from its source.  To do so, visit [Go's source install page](https://golang.org/doc/install/source) and follow instruction there to install.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)



### Go on Fedora
Follow the same instruction as [Ubuntu](#go-on-ubuntu).

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)



### Useful packages
```sh
go get github.com/mattn/go-sqlite3
go get github.com/alexcesaro/mail/gomail
go get github.com/twinj/uuid
```
