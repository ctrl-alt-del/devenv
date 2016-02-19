Gradle
======
[**Gradle**](http://www.gradle.org) is a build tool for project.  If you only use gradle for Android development, consider using the gradle wrapper coming with Android Studio.

* [**Windows**](#gradle-on-windows)
* [**Mac**](#gradle-on-mac)
* [**Ubuntu**](#gradle-on-ubuntu)
* [**Fedora**](#gradle-on-fedora)

### Gradle on Windows
To install Gradle on Windows, you can download its zip file from [here](http://www.gradle.org/downloads) and unzip it to `/c/usr/bin/gradle` or whatever folder you like.

Once the file is unzipped into the proper location, you can run git bash as administrator, then create a symbolic link by running:

```sh
cd /usr/bin
ln -s /c/usr/bin/gradle/gradle.exe gradle.exe
```

Verify the symbolic link is working properly by running:
```sh
which gradle # should see /usr/bin/gradle
gradle -v # should see version number
```

You may also add `%GRADLE_HOME%` to your environment variable with value equals to `C:\usr\bin\gradle`.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


### Gradle on Mac
To install gradle on Mac, the simplest way would be to install it through [Homebrew](https://github.com/ctrl-alt-del/devenv/tree/master/terminal/package%20manager/homebrew)

Once you have Homebrew, you can install Gradle by running:
```sh
brew install gradle
```

Once installation is done, you can verify it by running:
```sh
gradle -v
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


### Gradle on Ubuntu
If you prefer installing Gradle manually, you can follow the instruction [here](#gradle-on-fedora).

Otherwise, thanks to a PPA made by [Cheng-Wei Chien](https://launchpad.net/~cwchien), the installation process of Gradle on Ubuntu is pretty straightforward.

First of all, add the PPA repository:
```sh
sudo add-apt-repository ppa:cwchien/gradle
sudo apt-get update
```

Secondly, check about which versions are available:
```sh
sudo apt-cache search gradle
```

Lastly, install the version you want:
```sh
sudo apt-get install gradle-<__version_number__> # e.g. sudo apt-get install gradle-1.12
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


### Gradle on Fedora
To install Gradle on Fedora or other Linux/Unix base distros, you need to do so manually.

First of all, visit the [here](http://www.gradle.org/downloads) and download the version you are interesting.

Once download is done, unzip the file and the move the folder under `/opt`.

Afterwards, configure the PATH to make Gradle available in terminal, and there are multiple way to achieve this:

#### Add Symbolic Link
The easiest way is to create a symbolic link for Gradle on `/usr/bin`; since `/usr/bin` is the system default path, it will be loaded automatically whenever `.bashrc` is loaded.
```sh
sudo ln -s /opt/gradle-1.12/bin/gradle /usr/bin/gradle
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


#### Add to `~/.bash_profile`
You can also add the `GRADLE_HOME` to `~/.bash_profile` and export it so that you can just `source ~/.bash_profile` when you need it.

To do so, you first need to determine if `~/.bash_profile` is existed in you system.  If not, you need to create it.
```sh
ls ~/.bash_profile # should return the full path if ~/.bash_profile is existed
touch ~/.bash_profile # if not create the file
```

Once `~/.bash_profile` is there, open it using `vi` or whatever editor you prefer, and add these two line to the end of the file:
```sh
export GRADLE_HOME="/opt/<gradle_folder_name>/bin"
export PATH=$GRADLE_HOME:$PATH
```
`<gradle_folder_name>` is something similar to `gradle-1.12` and etc.

Once you are done adding those lines, save and exist the editor and you are good to go.  Just do `source ~/.bash_profile` before you need to use Gradle.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


#### Add to `~/.bashrc`
Alternatively, if you use Gradle on a daily basis, you may consider just adding the `GRADLE_HOME` to your `~/.bashrc` because it will then be automatically loaded whenever you open your terminal.

To do so, it is very similar to the instruction of adding it to `~/.bash_profile`, but since `~/.bashrc` always exist, you can just open it with `vi` and add the lines to the end of it.
```sh
export GRADLE_HOME="/opt/<gradle_folder_name>/bin"
export PATH=$GRADLE_HOME:$PATH
```
Again, `<gradle_folder_name>` is something similar to `gradle-1.12` and etc.

Once you are done adding those lines, save and exist the editor and you are good to go. Gradle would be ready to use whenever you open a terminal.

Or you can run the script here:
```sh
wget https://services.gradle.org/distributions/gradle-1.12-bin.zip
unzip gradle-1.12-bin.zip
sudo mv gradle-1.12 /opt
sudo rm gradle-1.12-bin.zip
sudo ln -s /opt/gradle-1.12/bin/gradle /usr/bin/gradle
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


#### Gradle Configuration on Android
##### Required Plugin
Declare as Android project and use appropriate plugin:
```gradle
apply plugin: 'com.android.application'
```


##### Add remote repository
Added maven central as the source of missing repositories
```gradle
buildscript {
	repositories {
		mavenCentral()
	}
}
```


##### Include `/libs/*.jar` files
To include downloaded jar files in your build:
```gradle
dependencies {
	compile fileTree(dir: 'libs', include: '*.jar')
}
```


##### Match Folder Structure with Gradle Default Paths
```gradle
sourceSets {
	main {
		manifest.srcFile 'AndroidManifest.xml'
		java.srcDirs = ['src']
		resources.srcDirs = ['src']
		aidl.srcDirs = ['src']
		renderscript.srcDirs = ['src']
		res.srcDirs = ['res']
		assets.srcDirs = ['assets']
		jniLibs.srcDirs = ['jniLibs']
	}
}
```


##### Enable Multi-dex
Multi-dex is needed if there is more than 65535 lines of compile methods
```gradle
android {
	defaultConfig {
		multiDexEnabled true
	}
}
```


##### Limit Max dex Memory
Set incremental dex to true and limit the max dex memory to reduce build time in Android Studio.
```gradle
android {
	dexOptions {
		incremental true
		javaMaxHeapSize "4g"
	}
}
```


##### Define Build Type
You may apply different configurations for debug and release version of your app:
```gradle
buildTypes {
	release {
	}

	debug {
	}
}
```


##### Define Build Configuration Field
Build configuration fields can be defined and used for different build types:

```gradle
buildTypes {
	release {
		buildConfigField "String", "STRING_FIELD_NAME", "string_field_value"
		buildConfigField "int", "INTEGER_FIELD_NAME", "-1"
	}

	debug {
		buildConfigField "boolean", "BOOLEAN_FIELD_NAME", "true"
	}
}
```
