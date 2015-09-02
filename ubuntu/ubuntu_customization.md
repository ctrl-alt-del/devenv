Ubuntu Customization
====================
Contents and behaviors were tested on both 12.04 and 14.04.

* [TouchPad Issue](#touchpad-issue)
* Graphic Card Issue
* Gnome Shell
* Places Drawer on Files

## TouchPad Issue
Ubunt may experience issues for some (older) Synaptic touchpads, such as tapping is too senstive, drag to drop is not responsive, scrolling is lagging and etc.

The easiest way to adjust those issue are using `synclient`, which available since Ubuntu 12.04, to config the touchpad.

### Enable vertical two finger scroll
Two finger scrolling is disable by default, you can enable it either though the `settings->mouse->touchpad` or through the command line `synclient VertTwoFingerScroll=1`.

