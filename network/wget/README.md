wget
====
[**wget**](http://www.gnu.org/software/wget) is a free, open-source, command-line tool that downloads content from internet

* [**Mac**](#wget-on-mac)
* [**Ubuntu**](#wget-on-ubuntu)
* [**Fedora**](#wget-on-fedora)

## wget on Mac
```sh
brew install wget
```
[BACK TO TOP](#wget)



## wget on Ubuntu
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

In newer version of Ubuntu, you may be able to install `wget` by simply running:
```sh
sudo apt-get update
sudo apt-get install wget
```
[BACK TO TOP](#wget)

## wget on Fedora
Follow the same instruction as [Ubuntu](#wget-on-ubuntu).

Or, for newer version of Fedora, you can try:
```sh
sudo yum install wget
```
[BACK TO TOP](#wget)
