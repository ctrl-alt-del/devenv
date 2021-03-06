gcc
===
GNU Complier Collection, or [GCC](https://gcc.gnu.org) is a collection of libraries and compliers.

* [**Windows**](#gcc-on-windows)
* [**Ubuntu**](#gcc-on-ubuntu)
* [**Fedora**](#gcc-on-fedora)

## GCC on Windows
`gcc` is a tricky part for Windows users.  Often times, only the binaries are provided along with other projects, such as [Cygwin](http://sourceware.org/cygwin), [MinGW](http://www.mingw.org) or [mingw-w64](http://mingw-w64.org).

Since I want to use git-bash, I need to find the GCC compiler toolset, and I found [**TDM-GCC**](http://tdm-gcc.tdragon.net), which can fulfill my needs.

Some other Alternatives are [Visual Studio C++ Express](), [Turbo C++]() and [Borland C++]().

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)



## GCC on Mac
Xcode command line tool include the necessary packages.
```
xcode-select --install
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)



## GCC on Ubuntu
`gcc` can be installed individually on Ubuntu, but it is recommended that you utilize the `build-essential` package; since you need `gcc`, it is natural that you may also need some other related libraries as well.
```
sudo apt-get update
sudo apt-get install build-essential
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)



## GCC on Fedora
```
sudo yum instal gcc
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)
