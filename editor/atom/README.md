Atom
====
[Atom](https://atom.io) is a text editor created by Github.  Note that the latest version of atom for all platforms are available on 64-bit only.

* [**Windows**](#atom-on-windows)
* [**Mac**](#atom-on-mac)
* [**Ubuntu**](#atom-on-ubuntu)
* [**Fedora**](#atom-on-fedora)

## Atom on Windows
To install, just download the install package from homepage and double click to install it.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)



## Atom on Mac
Download the `.zip` file from [homepage](https://atom.io/download/mac), then unzip it and drag the `.dmg` file to your `Applications` folder.



## Atom on Ubuntu
~~If your system is 64 bit, you can install atom by simply download, unzip and move the unzipped file to `/opt`.~~

~~### 32 bit~~
~~Atom no longer offer 32 bit binary out of box, but~~ you can install the 32 bit **and 64 bit** version by using the `ppa` package of `webupd8team`.
```sh
sudo add-apt-repository ppa:webupd8team/atom
sudo apt-get update
sudo apt-get install atom
```

You may need to have [NodeJS](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript/nodejs) installed in order to install `atom` using the `ppa` package.
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)



## Atom on Fedora
