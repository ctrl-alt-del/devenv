Laravel
=======
[**Laravel**](https://laravel.com) is a PHP framework for web application.

* [**Windows**](#laravel-on-windows)
* [**Mac**](#laravel-on-mac)
* [**Ubuntu**](#laravel-on-ubuntu)
* [**Fedora**](#laravel-on-fedora)

## Laravel on Windows
```sh
composer create-project laravel/laravel {directory} 5.0 --prefer-dist
```
[BACK TO TOP](#table-of-contents)



## Laravel on Mac
If you have installed `composer`, you can use it to install `laravel`
```sh
composer global require "laravel/installer"
```

Once `laravel` is installed, you need to add the `~/.composer/vendor/bin` path to your `$PATH`.

Then you can create a new laravel project by doing:
```sh
laravel new <project_name> # <project_name> is a variable
```

### Known Issues
* Not able to build project on remote server
remote server has limited resources and may not be capable of crawling through remote hosted repositories to search for the latest dependencies, therefore, you need to commit and push your `composer.lock` file as well.  This file contains the exact locations of the dependencies that your project needs.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)



## Laravel on Ubuntu
Follow the same instructions as [Mac](#laravel-on-mac).

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)



## Laravel on Fedora
Follow the same instructions as [Mac](#laravel-on-mac).

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)
