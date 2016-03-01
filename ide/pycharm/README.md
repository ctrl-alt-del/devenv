PyCharm
=======
[**PyCharm**](http://www.jetbrains.com/pycharm) is an IDE based on IntelliJ IDEA for Python development.

* [**Windows**](#pycharm-on-windows)
* [**Mac**](#pycharm-on-mac)
* [**Ubuntu**](#pycharm-on-ubuntu)
* [**Fedora**](#pycharm-on-fedora)

### PyCharm on Windows
Download [PyCharm](http://www.jetbrains.com/pycharm/download)

Once download is completed, double click the `.exe` file and follow the instruction to install.

It is recommended to install `Pycharm` under the `~/Applications` directory.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


### PyCharm on Mac
Download [PyCharm](http://www.jetbrains.com/pycharm/download)

Once download is completed, double click the `.dmg` file and follow the instruction to install.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


### PyCharm on Ubuntu
Download [PyCharm](http://www.jetbrains.com/pycharm/download)

Once download is down, unzip the `.tar.gz` file and rename it to `pycharm`, then move it to the `/opt`, which may require you to have root permission to do so.

make a symbolic link
```sh
sudo ln -s /opt/pycharm/bin/pycharm.sh /usr/bin/pycharm
```

You may skip the process of setting shortcut icon manually since later version of Pychram for Linux does the setup automatically.  However, in case the icon is not generated, you may follow the steps in below to set it up.

Setup Desktop Icon:
```sh
sudo touch /usr/share/applications/pycharm.desktop

content="
[Desktop Entry]
Name=PyCharm
GenericName=Python IDE
Type=Application
Exec="/opt/pycharm/bin/pycharm.sh" %f
Terminal=false
Icon=/opt/pycharm/bin/pycharm.png
Comment=PyCharm
NoDisplay=false
Categories=Development;IDE
Keywords=IDE;PyCharm;Development;IntelliJ
Name[en]=PyCharm
";

echo "$content" >> /usr/share/applications/pycharm.desktop;
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


### PyCharm on Fedora
Follow the same instruction as [Ubuntu](#pycharm-on-ubuntu).

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)
