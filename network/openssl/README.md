OpenSSL
=======
[**OpenSSL**](https://www.openssl.org/) is an open source project that provides terminal tools for the Transport Layer Security (TLS) and Secure Sockets Layer (SSL) protocols.

* [**Mac**](#openssl-on-mac)
* [**Ubuntu**](#openssl-on-ubuntu)
* [**Fedora**](#openssl-on-fedora)

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



### OpenSSL on Fedora
```sh
sudo yum install openssl
```
[BACK TO TOP](#openssl)
