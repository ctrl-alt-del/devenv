smartmontools
=============
[**smartmontools**](https://help.ubuntu.com/community/Smartmontools) is a set of terminal tools that test hard drives and read their SMART info.

* [**Windows**](#smartmontools-on-windows)
* [**Ubuntu**](#smartmontools-on-ubuntu)

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
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv/tree/master/util)
