FBReader
========
[FBReader](https://fbreader.org) is a cross platform e-book reader that supports almost all open source format.

* [**Windows**](#fbreader-on-windows)
* [**Mac**](#fbreader-on-mac)
* [**Ubuntu**](#fbreader-on-ubuntu)

* [Color Theme](#color-theme)
  * [Sepia-Wheat](#sepia-wheat)

## FBReader on Windows


## FBReader on Mac


## FBReader on Ubuntu
Download the either the `deb:i386` or `deb:amd64` from [here](https://fbreader.org/desktop/debian/pool/main/f/fbreader).

Then install it
```sh
sudo dpkg -i <package_name>
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv/tree/master/util/fbreader)



## Color Theme
The user interface configuration file is stored under `~/.FBReader/ui.xml`.

Users can modify the `xml` file to configure the interface.

If the file is not existed, create it by:
```sh
sudo touch -p ~/.FBReader/ui.xml
```

The color used in the `ui.xml` are the decimal representation of a color.

Remember also add the `xml` header to the `ui.xml` file
```
<?xml version="1.0" encoding="UTF-8">
```

### Sepia Wheat
To set the page with Sepia text and Wheat background:
```xml
<config>
  <group name="Color">
    <!------- Wheat ----->
    <option name="Background" value="16113331" />
    <!------- Sepia ----->
    <option name="Text" value="7356948" />
  </group>
</config>
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv/tree/master/util/fbreader)
