Sublime
=======
[**Sublime**](http://www.sublimetext.com) is a very useful and convenient text editor.

* [**Windows**](#sublime-on-windows)
* [**Ubuntu**](#sublime-on-ubuntu)
* [**Fedora**](#sublime-on-fedora)
* [**Configuration**](#sublime-configuration)

### Sublime on Windows
Download `.exe` installation file from its [homepage](http://www.sublimetext.com).

Once the exe file is downloaded, double click to install it.

[BACK TO TOP](#table-of-contents)


### Sublime on Ubuntu
You can install it on Ubuntu through PPA.
To add the sublime PPA, run:
```sh
sudo add-apt-repository ppa:webupd8team/sublime-text-2
sudo apt-get update
```

Once the PPA is added and updated, you can install Sublime by running:
```sh
sudo apt-get install sublime-text
```

If you prefer to install Sublime manually, you can follow the instruction for [Fedora](#sublime-on-fedora) instead.

[BACK TO TOP](#table-of-contents)


### Sublime on Fedora
Please make sure you have root permission and then you can install Sublime manually by copy and paste the following script into terminal:

For 64-bit System:
```sh
wget http://c758482.r82.cf2.rackcdn.com/Sublime\ Text\ 2.0.2\ x64.tar.bz2
tar vxjf Sublime\ Text\ 2.0.2\ x64.tar.bz2
sudo mv Sublime\ Text\ 2 /opt/sublime
sudo rm -rf Sublime\ Text\ 2.0.2\ x64.tar.bz2
sudo ln -s /opt/sublime/sublime_text /usr/bin/subl
```

For 32-bit System:
```sh
wget http://c758482.r82.cf2.rackcdn.com/Sublime\ Text\ 2.0.2.tar.bz2
tar vxjf Sublime\ Text\ 2.0.2.tar.bz2
sudo mv Sublime\ Text\ 2 /opt/sublime
sudo rm -rf Sublime\ Text\ 2.0.2.tar.bz2
sudo ln -s /opt/sublime/sublime_text /usr/bin/subl
```
[BACK TO TOP](#table-of-contents)


### Sublime Configuration
Once Sublime is successfully installed, you can use it to open a single file by running:
`subl <FILE_PATH>`, or open all files on current directory by running `subl .`

#### Package Control
[**Package Control**](https://sublime.wbond.net/installation#st2) is the simplest way of install packages to sublime.

[BACK TO TOP](#table-of-contents)


#### Setup Desktop Icon:
```sh
sudo touch /usr/share/applications/sublime.desktop

content="
[Desktop Entry]
Version=1.0
Type=Application
Name[en]=Sublime 2.0.2
Icon=/opt/sublime/Icon/256x256/sublime_text.png
Exec="/opt/sublime/sublime_text.sh" %f
Comment=The text editor you will fall in love with
Categories=GNOME;GTK;Utility;TextEditor;Development;IDE;
Terminal=false
GenericName=Text Editor

";

echo "$content" >> /usr/share/applications/sublime.desktop;
```
[BACK TO TOP](#table-of-contents)


#### Setup User Preference on Mac
```sh
content="
{
	"draw_white_space": "all",
	"font_size": 14.5,
	"hot_exit": false,
	"ignored_packages":
	[
	"Vintage"
	],
	"remember_open_files": false
}

";

echo "$content" >> ~/Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings;
```


#### Setup User Preference on Ubuntu
```sh
content="
{
	"draw_white_space": "all",
	"font_size": 14.5,
	"hot_exit": false,
	"ignored_packages":
	[
	"Vintage"
	],
	"remember_open_files": false
}

";

echo "$content" >> ~/.config/sublime-text-2/Packages/User/Preferences.sublime-settings;
```


#### Setup Keybindings on Mac
```sh
content="
[
{
	"keys": ["command+i"],
	"command": "reindent",
	"args": {"single_line": false}
},
{
	"keys": ["command+d"],
	"command": "run_macro_file",
	"args": {"file": "Packages/Default/Delete Line.sublime-macro"}
}
]

";

echo "$content" >> "~/Library/Application Support/Sublime Text 2/Packages/User/Default (Mac).sublime-keymap";
```


#### Setup Keybindings on Ubuntu
```sh
content="
[
{
	"keys": ["ctrl+i"],
	"command": "reindent",
	"args": {"single_line": false}
},
{
	"keys": ["ctrl+d"],
	"command": "run_macro_file",
	"args": {"file": "Packages/Default/Delete Line.sublime-macro"}
}
]

";

echo "$content" >> "~/.config/sublime-text-2/Packages/User/Default (Linux).sublime-keymap";
```
