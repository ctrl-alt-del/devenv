Ubuntu Customization
====================
Contents and behaviors were tested on both 12.04 and 14.04.

* [TouchPad Issue](#touchpad-issue)
* Graphic Card Issue
* Gnome Shell
* Places Drawer on Files

## TouchPad Issue
Ubuntu may experience issues for some (older) Synaptic TouchPads, such as tapping is way too sensitive, drag to drop is not responsive, scrolling is lagging and etc.

The easiest fix for those issues is to use `synclient`, which is available since Ubuntu 12.04, to configure the touchpad.

* [Enable vertical two finger scroll](#enable-vertical-two-finger-scroll)

### Enable vertical two finger scroll
Two finger scrolling is disabled by default.  Depending on the version of your touch pad, you can enable two finger scroll either though:
1. `settings` -> `mouse` -> `touchpad` -> `enable two finger scroll`
2. open terminal and type in `synclient VertTwoFingerScroll=1`

If your touch pad still has no response to two-finger touch after executing either action in above, your touch pad may be one of those older version touch pad.  To enable two finger scrolling on those device, you need to open terminal and execute the second action listed in above and then also type in `synclient EmulateTwoFingerMinZ=4`.
