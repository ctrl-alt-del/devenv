Ubuntu
======

# Customization
Note: Contents and behaviors were tested on both 12.04 and 14.04.

* [TouchPad Issue](#touchpad-issue)
* [Graphic Card Issue](#graphic-card-issue)
* Gnome Shell
* Places Drawer on Files
* [Magick Rotation](#magick-rotation)

## TouchPad Issue
Ubuntu may experience issues for some (older) Synaptic TouchPads, such as tapping is way too sensitive, drag to drop is not responsive, scrolling is lagging and etc.

The easiest fix for those issues is to use `synclient`, which is available since Ubuntu 12.04, to configure the touchpad.

* [Enable vertical two finger scroll](#enable-vertical-two-finger-scroll)
* [Enable two finger tapping as right click](#enable-two-finger-tapping-as-right-click)

### Enable vertical two finger scroll
Two finger scrolling is disabled by default.  Depending on the version of your touch pad, you can enable two finger scroll either though:
1. `settings` -> `mouse` -> `touchpad` -> `enable two finger scroll`
2. open terminal and type in `synclient VertTwoFingerScroll=1`

If your touch pad still has no response to two-finger touch after executing either action in above, your touch pad may be one of those older version touch pad.  To enable two finger scrolling on those device, you need to open terminal and execute the second action listed in above and then also type in `synclient EmulateTwoFingerMinZ=4`.

If `synclient` is not available, you will need to replace `synclient VertTwoFingerScroll=1` and `synclient EmulateTwoFingerMinZ=4` with following lines and execute them in your terminal.
```sh
xinput --set-prop --type=int --format=32 "SynPS/2 Synaptics TouchPad" "Synaptics Two-Finger Pressure" 4 #synclient VertTwoFingerScroll=1
xinput --set-prop --type=int --format=8 "SynPS/2 Synaptics TouchPad" "Synaptics Two-Finger Scrolling" 1 0 #synclient EmulateTwoFingerMinZ=4
```


### Enable two finger tapping as right click
```sh
synclient TapButton2=3
```


## Graphic Card Issue
Ubuntu may have compatibility issue with some older graphic cards, especially the **Nvidia** ones.

Depending on specific chip of your graphic card, you will need either the `nvidia-304`, `nvidia-319`, `nvidia-325` or `nvidia-current` driver updates.

Some common behaviors for graphic card related issues are:
0. screen freezes or black out after login to a user
0. screen shows losing frames while performing normal tasks
0. screen shows distorted images

When one of above behavior happens, the system itself is usually still responding, only the desktop being not responding.

To resolve the issue, you need to remove the current/default graphic card driver (likely a Xorg) and re-install one of the appropriate Nvidia graphic card driver.

To do so, first entering terminal through pressing `ctrl` + `alt` +`F1`, and login with your **administrator credential**.

The are steps to determine exactly what driver to use base on the chip version you have.  However, it is outside of the scope in here; since there aren't that many drivers, the approach here would be to try the driver one by one.

Once login, try to install the `nvidia-current` as your first attempt by performing:
```sh
sudo apt-get purge nvidia*
sudo apt-get install nvidia-current
```

Once the drivers are installed, reboot your system:
```sh
sudo shutdown -r 0
```

If `nvidia-current` has no luck, then try `nvidia-325`, `nvidia-319`, `nvidia-304` accordingly.
```sh
sudo apt-get purge nvidia*
sudo apt-get install nvidia-325-update # replace 325 with 319 and 304 in other cases
sudo shutdown -r 0
```

If both the `nvidia-325` and `nvidia-319` don't work, the `nvidia-304` will likely work.



## Magick Rotation
[**Magick Rotation**](https://launchpad.net/magick-rotation) is a very handy tool that enables auto-rotate on tablets with Linux installed.

However, the installation process on Ubuntu requires some tricks.

First of all, you need to download either the 32-bit or 64-bit installation `.tar.bz2` from [here](https://launchpad.net/magick-rotation)

Then, you need to install some packages:
```sh
sudo apt-get install cellwriter
sudo apt-get install gcc
sudo apt-get install libx11-dev
sudo apt-get install libxrandr-dev
sudo apt-get install yum
```

The trick here is to install `yum` since the `MAGICK-INSTALL` file inside the `.tar.bz2` package were designed to use `yum` only.

Unfortunately, `yum repolist` will return `0` under Ubuntu base system.  Therefore, we need to manually install `gcc`, `libx11-dev` and `libxrandr-dev` using `apt-get` as listed in above.

Once the packages are done, execute `MAGICK-INSTALL` file.  Follow the instruction and you will see a error occurring after the installation process.  It is normal, because `yum repolist` returns a internal error for `MAGICK-INSTALL`; you can ignore the error and restart your machine now, and `magick-rotation` should be properly installed.

Once verified the installation is successfully completed.  Remove the unnecessary packages:
```sh
sudo apt-get remove yum
sudo apt-get autoremove
```
