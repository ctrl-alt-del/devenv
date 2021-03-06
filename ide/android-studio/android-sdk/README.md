Android SDK
===========
**Latest Update**

Google recommends developer to use [Android Studio](https://github.com/ctrl-alt-del/devenv/tree/master/ide/android-studio) to develop Android applications, which comes with the sdk and jdk.

You can get the standalone Android SDK manager by getting the command line tools `.zip` file from its [developer page](https://developer.android.com/studio/index.html) under **Get just the command line tools**.

Once the `.zip` file is downloaded, unzip it and follow the instruction in [here](https://developer.android.com/studio/command-line/sdkmanager.html).

Follow the installation process for your system:

* [**Windows**](#sdk-on-windows)
* [**Mac**](#sdk-on-mac)
* [**Ubuntu**](#sdk-on-ubuntu)
* [**Fedora**](#sdk-on-fedora)

Navigate to the SDK folder and open its user interface, which would to let you select SDKs and tools to download.

You need the following packages from the SDK:
```sh
./Tools/Android SDK Tools
./Tools/Android SDK Build-tools
./Tools/Android SDK Platform-tools
./Extra/Android Support Repository
./Extra/Android Support Library
./<whatever_API_version>/SDK Platform
./<whatever_API_version>/ARM EABI v7a System Image
```

Select those package and click on the "install packages" button on the bottom right, and then follow the instruction to complete the installation.

### SDK on Windows
Choose the appropriate Thread Safe zip to download, either x86 or x64 based on your operation system.

unzip the downloaded file to `/c/usr/bin/android`, or whatever directory you chose.

Navigate to the directory and open the SDK Manager:
```sh
cd /c/usr/bin/android/
open SDK\ Manager.exe
```

Select the packages listed in [here](#android-sdk) to install.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


### SDK on Mac
You can get Android SDK from its [developer page](http://developer.android.com/sdk/index.html) under "Get SDK for an existing IDE".

Once downloaded, unzip and place it in the same folder of eclipse, or whatever folder you like.

Open terminal, then running:
```sh
cd <unzip_folder_path>/sdk/tools
./android sdk
```
Once the command lines in above is executed, it should popup an user interface to let you select SDKs and tools to download.

You need the following package from the SDK:
```sh
./Tools/Android SDK Tools
./Tools/Android SDK Build-tools
./Tools/Android SDK Platform-tools
./Extras/Android Support Repository
./Extras/Android Support Library
./Extras/Google Play services
./<API_version>/SDK Platform
./<API_version>/ARM EABI v7a System Image
```

Select those package and click on the "install packages" button on the bottom right, and then follow the instruction to complete the installation.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


### SDK on Ubuntu
Visit the [developer page](http://developer.android.com/sdk/index.html) and download the [SDK Tool only for Linux 32 and 64 bit](http://dl.google.com/android/android-sdk_r23.0.2-linux.tgz)

Once download is done, unzip it and move it to the `/opt/android-sdk-linux` folder, then add `export ANDROID_HOME=/opt/android-sdk-linux`, `export ANDROID_TOOLS="$ANDROID_HOME/platform-tools":"$ANDROID_HOME/tools"` to the `~/.bash_profile`.

#### Compatibility issue on Ubuntu
If you are in Linux 64 bit OS, you may also need to install the 32 bit shared libraries.
```sh
sudo apt-get install libc6:i386 libstdc++6:i386 zlib1g:i386
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


### SDK on Fedora
Follow the same instruction as [Ubuntu](#sdk-on-ubuntu).

#### Compatibility issue on Fedora
If you are in Linux 64 bit OS, you may also need to install the 32 bit shared libraries.
```sh
sudo yum install glibc.i686 glibc-devel.i686 libstdc++.i686 zlib-devel.i686 ncurses-devel.i686 libX11-devel.i686 libXrender.i686 libXrandr.i686
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


## Source not shown issue
You downloaded the source and refresh the `.class` file, but it doesn't turn itself to `.java` file and you still cannot see it source code.

This is a known issue for Android Studio, the way to resolve it is to go to Android SDK and edit the sdk location to re-trigger the sdk initiation process, then it will load the downloaded source code zip files.  Once the process is completed, you will now be able to see the source code.
