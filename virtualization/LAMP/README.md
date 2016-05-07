LAMP
====
[**LAMP**](https://en.wikipedia.org/wiki/LAMP_(software_bundle)) stands for Linux-Apache-MySQL-PHP.
It refers to a software bundle including Linux Apache, MySQL and PHP.
You also can learn more about it on its [server guide](https://help.ubuntu.com/14.04/serverguide/lamp-overview.html) or [wiki](https://help.ubuntu.com/community/ApacheMySQLPHP).

* [**Ubuntu**](#lamp-on-ubuntu)
* [**Fedora**](#lamp-on-fedora)

### LAMP on Ubuntu
You can install LAMP in Ubuntu by running:
```sh
sudo tasksel install lamp-server
```

Or alternatively:
```sh
sudo apt-get update
sudo apt-get install lamp-server^
```

Or if you decide to install it package by package:
```sh
sudo apt-get update
sudo apt-get install apache2
sudo apt-get install mysql-server libapache2-mod-auth-mysql php5-mysql
sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt
```
[BACK TO TOP](#table-of-contents)



### LAMP on Fedora
Install LAMP stack in Fedora is pretty straightforward.
```sh
yum update
sudo yum install httpd
sudo yum install mysql mysql-server
sudo yum install php php-mysql
```
[BACK TO TOP](#table-of-contents)
