PHP
===
[**PHP**](https://www.php.net) is a scripting language for web applications.

* [**Windows**](#php-on-windows)
* [**Mac**](#php-on-mac)
* [**Ubuntu**](#php-on-ubuntu)
* [**Fedora**](#php-on-fedora)
* [**Composer**](#composer)

### PHP on Windows
Download the latest PHP for Windows from [here](http://windows.php.net/download).

Choose the appropriate Thread Safe zip to download, either [VC11 x86 Thread Safe](http://windows.php.net/downloads/releases/php-5.6.13-Win32-VC11-x86.zip) or [VC11 x64 Thread Safe](http://windows.php.net/downloads/releases/php-5.6.13-Win32-VC11-x64.zip) based on your operation system.

You can also use the following command to download the 32-bit version:
```sh
curl --remote-name http://windows.php.net/downloads/releases/php-5.6.13-Win32-VC11-x86.zip
```

Or use the following command to download the 64-bit version:
```sh
curl --remote-name http://windows.php.net/downloads/releases/php-5.6.13-Win32-VC11-x64.zip
```

Unzip the downloaded file to /c/usr/bin/php, or whatever directory you chose.

the executable php.exe should then be under:
```sh
/c/usr/bin/php/php.exe
```

Run git bash as administrator, then go to the bin of git bash by running:
```sh
cd /usr/bin
```

Create a symbolic link by running:
```sh
ln -s /c/usr/bin/php/php.exe php.exe
```

Verify the symbolic link is working properly by running:
```sh
which php # should see /usr/bin/php
```

if there is error saying php is not found on sh.exe, restart the git bash and run above line again.

[BACK TO TOP](#table-of-contents)


### PHP on Mac
PHP is bundled with Mac.

[BACK TO TOP](#table-of-contents)


### PHP on Ubuntu
Installing PHP on Ubuntu is as simple as running:
```sh
sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt
```

Once installation is done, you can verify it by running:
```sh
php -v
```
[BACK TO TOP](#table-of-contents)


### PHP on Fedora
Installing PHP on Fedora should be pretty straightforward if you configuration is correct.
```sh
sudo yum install php
```

**Known Issue for Fedora**

1. None of the mirrors contains the required packages

**Solution**: enable fedora-source
```sh
yum repolist disabled
sudo yum-config-manager --enable fedora-source
sudo yum install php
```
[BACK TO TOP](#table-of-contents)



## Composer
[**Composer**](https://getcomposer.org) is a dependency management tool in PHP.

* [**Windows**](#composer-on-windows)
* [**Mac**](#composer-on-mac)

### Composer on Windows
The easiest way to install composer on windows in using the [installer](https://getcomposer.org/Composer-Setup.exe).

However, you can also install it mannually on git bash following the same instruction as [Mac](composer-on-mac).
[BACK TO TOP](#table-of-contents)


### Composer on Mac
```sh
curl -sS https://getcomposer.org/installer | php
```
move the `composer.phar` to somewhere in your `PATH`, such as `/usr/bin` so that it can be easily accessed.
```sh
sudo mv composer.phar /usr/bin
```
[BACK TO TOP](#table-of-contents)