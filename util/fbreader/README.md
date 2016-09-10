FBReader
========
[FBReader]() is a e-book reader that supports almost all open source format.

* [Color Theme](#color-theme)
  * [Sepia-Wheat](#sepia-wheat)

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
