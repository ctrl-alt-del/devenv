Ubuntu Customization
====================
Contents and behaviors were tested on both 12.04 and 14.04.

* [TouchPad Issue](#touchpad-issue)
* [Graphic Card Issue](#graphic-card-issue)
* Gnome Shell
* Places Drawer on Files

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
Ubuntu may have compatibility issue with some graphic cards, especially the older Nvidia ones.

Depending on specific chip of your graphic card, you will need either the `nvidia-304`, `nvidia-319`, `nvidia-325` or `nvidia-current` driver updates.

A common behavior for graphic card issue is that the screen freezes or black out after login to a user.  It would also be the screen shows losing frames while performing normal tasks.

When one of above behavior happens, the system itself is usually still responding, only the desktop being not responding.
