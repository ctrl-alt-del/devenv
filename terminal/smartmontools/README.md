smartmontools
=============
[**smartmontools**](https://help.ubuntu.com/community/Smartmontools) is a set of terminal tools that test hard drives and read their SMART info.

## `smartmontools` on Ubuntu
```sh
sudo apt-get install smartmontools
```

To check the statistics of a hard drive with `smartmontools`:
```sh
sudo smartctl --all /dev/sda
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)
