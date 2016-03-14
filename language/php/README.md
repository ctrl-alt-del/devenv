PHP
===
[**PHP**](https://www.php.net) is a scripting language for web applications.

* [**Windows**](#php-on-windows)
* [**Mac**](#php-on-mac)
* [**Ubuntu**](#php-on-ubuntu)
* [**Fedora**](#php-on-fedora)

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

Unzip the downloaded file to `~/Applications/PHP`, or whatever directory you chose, and the executable `php.exe` should then be under: `~/Applications/PHP/php.exe`

Run git bash as administrator, then create a symbolic link by running:
```sh
ln -s ~/Applications/PHP/php.exe /usr/bin/php.exe
```

Verify the symbolic link is working properly by running:
```sh
which php # should see /usr/bin/php
```

if there is error saying php is not found on sh.exe, restart the git bash and run above line again.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


### PHP on Mac
PHP is bundled with Mac by default.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


### PHP on Ubuntu
Installing PHP on Ubuntu is as simple as running:
```sh
sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt
```

Once installation is done, you can verify it by running:
```sh
php -v
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


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
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)
