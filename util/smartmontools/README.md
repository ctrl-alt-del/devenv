smartmontools
=============
[**smartmontools**](https://help.ubuntu.com/community/Smartmontools) is a set of terminal tools that test hard drives and read their SMART info.  There is also an GUI version of the tool, and it is introduced in [here](http://gsmartcontrol.sourceforge.net/home).

* [**Windows**](#smartmontools-on-windows)
* [**Ubuntu**](#smartmontools-on-ubuntu)
* [**Fedora**](#smartmontools-on-fedora)

## `smartmontools` on Windows
Download the latest `.exe` installer from [here](https://sourceforge.net/projects/smartmontools/files/smartmontools).

Once file is downloaded, double click the `.exe` file and follow its instruction to install.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv/tree/master/util)



## `smartmontools` on Ubuntu
```sh
sudo apt-get install smartmontools
```

To check the statistics of a hard drive with `smartmontools`:
```sh
sudo smartctl --all /dev/sda
```

Check overall health:
```sh
sudo smartctl -H /dev/sda1
```

Get disk information:
```sh
sudo smartctl -i /dev/sda1
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv/tree/master/util)



## `smartmontools` on Fedora
```sh
sudo yum install smartmontools
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv/tree/master/util)
