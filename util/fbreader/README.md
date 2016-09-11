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


## Color Theme
The user interface configuration file is stored under `~/.FBReader/ui.xml`.

Users can modify the `xml` file to configure the interface.

### Sepia Wheat
To set the page with Sepia text and Wheat background:
```xml
<?xml version="1.0" encoding="UTF-8">
<config>
  <group name="Color">
    <!------- Wheat ----->
    <option name="Background" value="16113331" />
    <!------- Sepia ----->
    <option name="Text" value="7356948" />
  </group>
</config>
```
