OpenSSL
=======

* [**Mac**](#openssl-on-mac)
* [**Ubuntu**](#openssl-on-ubuntu)

### OpenSSL on Mac
`openssl` is installed to Mac by default, you can verify this by opening terminal and typing:
```sh
openssl version
```

If `openssl` is not installed by default, you can install it through `brew`:
```sh
brew install openssl
```
[BACK TO TOP](#openssl)


### OpenSSL on Ubuntu
Ubuntu comes with OpenSSL, but it may need to be upgraded because of the [Heartbleed Bug](http://heartbleed.com).  Moreover, newer version of OpenSSL is also required to install the latest Rails.

You can upgrade OpenSSL by running:
```sh
sudo apt-get upgrade openssl
```
[BACK TO TOP](#openssl)
