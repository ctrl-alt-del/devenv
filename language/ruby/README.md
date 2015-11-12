Ruby
====

* [**Windows**](#ruby-on-windows)
* [**Mac**](#ruby-on-mac)
* [**Ubuntu**](#ruby-on-ubuntu)
* [**Fedora**](#ruby-on-fedora)

### Ruby on Windows
You can install Ruby on Windows by using [RubyInstaller](http://rubyinstaller.org/downloads) with either the [x86 installer](http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.2.2.exe) or [x64 installer](http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.2.2-x64.exe) based on your operation system.

Install Ruby under /c/usr/bin/ruby or whatever directory you chose

Once the installation is done, the executable `ruby.exe` should then be under:
`/c/usr/bin/ruby/bin`

Run git bash as administrator, then create a symbolic link by running:
```sh
ln -s /c/usr/bin/ruby/bin/ruby.exe /usr/bin/ruby.exe
```

Verify the symbolic link is working properly by running:
```sh
which ruby # should see /usr/bin/ruby
```

If there is error saying ruby is not found on sh.exe, restart the git bash and redo the verification.

Once you restarted the git bash and verified ruby is installed on your machine, you can check its version by running:
```sh
ruby --version
```

If you want to call Ruby from the PowerShell of Windows's default terminal, you need to add Ruby to the system environment variables.


#### devkit
[**devkit**](http://rubyinstaller.org/downloads) is the prerequisite for Rails on Windows.

Scroll down to "Other Useful Downloads" and it is under "development kit" section.

Choose the appropriate devkit to download, either [x86](http://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe) or [x64](http://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe) based on your operation system.

Once the download is done, double click on the executable file and install/unzip it to /c/usr/bin/devkit, or whatever directory you chose.

Run git bash as administrator and go to the directory of devkit by running:
```sh
cd /c/usr/bin/devkit
```

Initialize the devkit and then install it by running:
```sh
ruby dk.rb init
ruby dk.rb install
```

If there is no error shows up, the setup is successful.

[BACK TO TOP](#table-of-contents)


### Ruby on Mac
Mac should have Ruby installed by default and it is the prerequisite for installing Rails.  To verify it, you can open your terminal and run:
```sh
ruby --version
```
It should show you the version of your currently installed Ruby.

If Ruby does not come with your Mac somehow or you want to have a newer version of Ruby, you can get it with these approaches:
1. Download the latest Ruby from its [homepage](https://www.ruby-lang.org/en/downloads) and install it manually according to its instruction.
2. Install the latest version of Ruby through [Homebrew](#homebrew) by running `brew install ruby`.
3. Use RVM to install Ruby, see the instruction for [**Ubuntu**](#ruby-on-ubuntu).

[BACK TO TOP](#table-of-contents)


### Ruby on Ubuntu
Since Ruby Version Manager (RVM) is also available for Linux and other Unix-like operation system, you can install Ruby easily through using RVM.  You can learn more about RVM on their home page: `https://rvm.io/`
RVM is a convenient way to manage multiple versions of Ruby and Rails (e.g. the system default version and the latest version) because sometimes you may want to keep the older version of Ruby to keep the compatibility or whatever.

To install RVM and Ruby, you need to have [Curl](#curl-on-ubuntu), follow the instruction to get it if you haven't have it.

To install the latest RVM along with the latest stable RVM + Ruby, you can simply run:
```sh
\curl -sSL https://get.rvm.io | bash -s stable --ruby
```

Similarly, you can install the latest stable version of RVM + Ruby + Rails by running:
```sh
\curl -sSL https://get.rvm.io | bash -s stable --rails
```

If you already have RVM setup, you can update it to the latest version by running:
```sh
rvm get stable
```

Once installation is done, you can verify it by running:
```sh
ruby -v
```

To select the latest ruby version as the default:
```sh
rvm --default <ruby_version>
```

To setup the Ruby environment, you can simply check if the Ruby environment is setup by a RVM command:
```sh
rvm requirements
```

While installing gems, the process will automatically generate documents, which can be time consuming.  If you perfer online documents over local generated ones, you can skip the auto documents generating process, which would save you some time.

To disable the process, you can create a gem configuration file by running:
```sh
subl ~/.gemrc
```

and then paste and save the following two lines into `.gemrc`
```sh
install: --no-rdoc --no-ri
update:  --no-rdoc --no-ri
```
[BACK TO TOP](#table-of-contents)


### Ruby on Fedora
Same as Ubuntu, see the instruction for [**Ubuntu**](#ruby-on-ubuntu).

[BACK TO TOP](#table-of-contents)
