curl
====
[**curl**](http://curl.haxx.se/docs/manpage.html) is a tool to transfer data from or to a server.

Curl comes with Mac and some distros of Linux by default.  For Windows, it should comes with [Git](https://github.com/ctrl-alt-del/devenv/blob/master/terminal/git).  In case Curl is not installed on your system, you can follow the instructions below to install it yourself.

* [**Windows**](#curl-on-windows)
* [**Mac**](#curl-on-mac)
* [**Ubuntu**](#curl-on-ubuntu)
* [**Fedora**](#curl-on-fedora)

### curl on Windows
Visit [Curl's archive page](http://curl.haxx.se/download.html) to download the latest version of [`curl-[version].zip`](http://curl.haxx.se/download/curl-7.50.3.zip).

Once it is downloaded, unzip it to `/c/usr/bin/curl`, or whatever directory your chose.

Run git bash as administrator, then create a symbolic link by running:
```sh
ln -s /c/usr/bin/curl/curl.exe /usr/bin/curl.exe
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv/tree/master/network)


### curl on Mac
Mac should have `curl` by default.  You can verify your curl version by opening your terminal and running:
```sh
curl --version
```

If curl does not come with your Mac somehow, you can follow the same instruction of [Windows](https://github.com/ctrl-alt-del/devenv/blob/master/os/windows) to manually install it on your Mac.

Or you can install it through [Homebrew](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/package-manager/homebrew) by running:
```sh
brew install curl
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv/tree/master/network)


### curl on Ubuntu
```sh
sudo apt-get install curl
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv/tree/master/network)


### curl on Fedora
```sh
sudo yum install curl
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv/tree/master/network)
