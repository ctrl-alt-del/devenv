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

### Enable vertical two finger scroll
Two finger scrolling is disable by default, you can enable it either though the `settings->mouse->touchpad` or through the command line `synclient VertTwoFingerScroll=1`.
