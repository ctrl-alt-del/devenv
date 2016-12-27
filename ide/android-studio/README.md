Android Studio
==============
[**Android Studio**](https://developer.android.com/studio/index.html) is a Integrated Development Environment based on IntelliJ IDEA for Android development.

Note that the latest version of Android Studio requires Gradle 2.2 and above; therefore, please make sure you have it installed.  You can also follow the instruction of installing Gradle in [here](#gradle).

Also, Android development requires [Java](#java),  please follow its instruction to install the it.  Note that Android Studio would recommend using Oracle JDK instead of using OpenJDK.

* [**Windows**](#android-studio-on-windows)
* [**Mac**](#android-studio-on-mac)
* [**Ubuntu**](#android-studio-on-ubuntu)
  * [**Known Issues**](#known-issues)
* [**Fedora**](#android-studio-on-fedora)

## Android Studio on Windows
Download Android Studio from its [home page](https://developer.android.com/studio/index.html)

Once download is done, follow the instruction to install Android Studio and SDK.

Note that Android Studio requires access to public internet in order to download dependencies and build.  In case that you have denied its access, you can visit `Control Panel` -> `System and Security` -> `Windows Firewall` -> `Allow a program or feature through Windows Firewall` to grant it public internet access permission.

Note that Android Virtual Machine (AVD) requires [Intel Hardware Accelerated Execution Manager (Intel HAXM)](https://software.intel.com/en-us/android/articles/intel-hardware-accelerated-execution-manager), which you can get it from Android SDK Manager under `/Extras/Intel x86 Emulator Accelerator (HAXM installer).  The installer should install the Intel HAXM automatically, but it requires manual installation in some occasion.  To install Intel HAXM manually on windows, simply navigate to `<SDK_Directory>\extras\intel\Hardware_Accelerated_Execution_Manager` and execute the `intelhaxm-android.exe` file.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv#integrated-development-environment-ide)


## Android Studio on Mac
Download Android Studio from its home page [here](https://developer.android.com/studio/index.html)

Once download is done, unzip it and then move the `.app` file to Application folder.

The newer version of Android Studio for Mac no long comes with Android SDK, therefore, you need to download the SDK separately from [here](#sdk-on-mac).

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv#integrated-development-environment-ide)


## Android Studio on Ubuntu
Download and install:
```sh
wget https://dl.google.com/dl/android/studio/ide-zips/2.2.3.0/android-studio-ide-145.3537739-linux.zip
unzip android-studio-ide-145.3537739-linux.zip
sudo mv android-studio /opt/android-studio
sudo mv -f android-studio-ide-145.3537739-linux.zip ~/Downloads/
sudo ln -s /opt/android-studio/bin/studio.sh /usr/bin/aso
```

(Optional for version 1.0.+) Setup Desktop Icon:
```sh
sudo touch android-studio.desktop

content="
[Desktop Entry]
Name=Android Studio
GenericName=Android IDE
Version=1.3
Type=Application
Exec="/opt/android-studio/bin/androidstudio.icostudio.sh" %f
Terminal=false
Icon=/opt/android-studio/bin/androidstudio.ico
Comment=Android Studio
NoDisplay=false
Categories=Development;IDE
Keywords=IDE;Android;Studio;Development;IntelliJ
Name[en]=Android Studio
";

echo "$content" >> android-studio.desktop;
sudo mv android-studio.desktop /usr/share/applications
```

Alternatively, you can open Android Studio and click on `Configure` -> `Create Desktop Entry`

The newer version of Android Studio for Linux no long comes with Android SDK, therefore, you need to download the SDK separately.  If you haven't already done so, you can follow the instruction [here](https://github.com/ctrl-alt-del/devenv#sdk-on-ubuntu) to setup the Android SDK.

If you let Android Studio to auto-resolve the SDK dependency by itself, the SDK would be installed under `$HOME\Android\Sdk` folder.  You can then follow the SDK setup instruction listed in above to add the environment variables needed for Android Studio.

To setup Android Virtual Machine (AVD) on Ubuntu or to use any type of virtual machine, you need to first enable CPU virtualization technology on your BIOS, this selection is usually named `VT-x` under `Config` tab.

Afterwards, you need to install Kernel Virtual Machine (KVM)
```sh
sudo apt-get install qemu-kvm ubuntu-vm-builder
```

Once installation is done, restart your computer, and you will now be able to use AVD.



### Known Issues
There are some known issues for ADB in Ubuntu:

1. **~~ADB not responding to 64 bit Ubuntu.~~ (Deprecated since ver. 23.1.0)**

You can solve this issue by installing some 32 bit support libraries:
```sh
sudo apt-get install lib32stdc++6 lib32z1 lib32z1-dev lib32ncurses5 lib32bz2-1.0
sudo apt-get install lib32z1-dev #optional, depending on system
```



2. **ADB not responding to 32 bit Ubuntu.**

Since ver. 23.1.0, the ADB and all other platform tools will only work on 64 bit system.

The only option for users with 32 bit system would be to use the ver. 23.0.1, which is the latest 32 bit compatible platform tools package.

This issue has been asked and confirmed on [here](https://code.google.com/p/android/issues/detail?id=196866).

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv#integrated-development-environment-ide)


## Android Studio on Fedora
Follow the same instruction of [Ubuntu](#android-studio-on-ubuntu).

Similarly as Ubuntu, you may run into 32 bit library compatibility issue, and you can solve this issue by installing some 32 bit support libraries:
```sh
sudo yum install zlib.i686 ncurses-libs.i686 bzip2-libs.i686
```

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv#integrated-development-environment-ide)
