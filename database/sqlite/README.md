SQLite
======
[**SQLite**](http://www.sqlite.org) is an embedded database system.

* [**Windows**](#sqlite-on-windows)
* [**Mac**](#sqlite-on-mac)
* [**Ubuntu**](#sqlite-on-ubuntu)
* [**Fedora**](#sqlite-on-fedora)

### SQLite on Windows
Download the latest SQLite for Windows from [here](http://www.sqlite.org/download.html)

Scroll down the page to the "Precompiled Binaries for Windows" section, and download the sqlite-shell and sqlite-dll files.

Or run the following lines on your git bash:
```sh
cd ~
curl --remote-name "http://www.sqlite.org/2015/sqlite-shell-win32-x86-3081000.zip"
curl --remote-name "http://www.sqlite.org/2015/sqlite-dll-win32-x86-3081000.zip"
```

Once both files are downloaded, unzip both of them to `~/Applications/sqlite`, or whatever directory you chose.

Run git bash as administrator, then go to the bin of git bash by running:
```sh
cd /usr/bin
```

Create a symbolic link by running:
```sh
ln -s ~/Applications/sqlite/sqlite.exe sqlite.exe
```

Verified sqlite is installed and properly linked on your machine by running:
```sh
sqlite -v
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


### SQLite on Mac
```sh
brew install sqlite3
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


### SQLite on Ubuntu
```sh
sudo apt-get install sqlite3 libsqlite3-dev
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


### SQLite on Fedora
```sh
yum install -y sqlite sqlite-devel
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)
