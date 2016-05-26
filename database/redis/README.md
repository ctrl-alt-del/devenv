Redis
=====
[Redis](http://redis.io) is an open source, in memory data structure store, or also known as key-value cache.

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
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make
```

Once installation is done, you can remove the folder and the zip file by running:
```sh
cd ..
rm -rf redis-stable
rm redis-stable.tar.gz
```

#### Install Redis on Production Environment
Please refer to the official document [here](http://redis.io/topics/quickstart#installing-redis-more-properly) to install redis for production environment.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


### Redis on Fedora
Follow the same instruction as [Ubuntu](#redis-on-ubuntu)

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)
