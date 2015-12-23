Redis
=====
[Redis](http://redis.io/) is an open source, in memory data structure store, or also known as key-value cache.

* [**Mac**](#redis-on-mac)
* [**Ubuntu**](#redis-on-ubuntu)
* [**Fedora**](#redis-on-fedora)

### Redis on Mac
```sh
brew install redis
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


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
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


### Redis on Fedora
Follow the same instruction as [Ubuntu](#redis-on-ubuntu)

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)
