Redis
=====
[Redis](https://redis.io) is an open source, in-memory key-value pair data structure store.

* [**Mac**](#redis-on-mac)
* [**Ubuntu**](#redis-on-ubuntu)
* [**Fedora**](#redis-on-fedora)
* [**Redis Cheatsheet**](https://github.com/ctrl-alt-del/devenv/blob/master/cheatsheet/redis)


## redis on Mac
```sh
brew install redis
```
You can update the configuration on: `/usr/local/etc/redis.conf`

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv/tree/master/cache)



## redis on Ubuntu
```sh
sudo apt-get install redis
```

You can edit your configuration on: `/etc/redis/redis.conf`.

You can find the directory that Redis will use to dump persistent data on: `/var/lib/redis`.

If `/var/lib/redis` is not the default persistent data dumping directory, you can set it to be the default by modifying `/etc/redis/redis.conf` with this line:
```sh
dir /var/lib/redis
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv/tree/master/cache)



## redis on Fedora
```sh
sudo yum install redis
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv/tree/master/cache)
