Bluetooth
=========

* [**Ubuntu**](#bluetooth-on-ubuntu)
  * [**disable bluetooth on start**](#disable-bluetooth-on-start)

## Ubuntu
### disable bluetooth on start
```sh
sudo vi /etc/rc.local # open /etc/rc.local with modify permission
```

append `rfkill block bluetooth` to the end of the file, right above the line of `exit 0`.

When done, save and exit the file the file.  The change will take effect when you restart your operating system.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)
