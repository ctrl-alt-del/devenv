Python
======

* [**Windows**](#python-on-windows)
* [**Mac**](#python-on-mac)
* [**Ubuntu**](#python-on-ubuntu)
* [**Fedora**](#python-on-fedora)

### Python on Windows
There are Python 2.x and Python 3.x available.  This instruction will focus on 2.x, but similar steps can be easily applied to 3.x as well.

Download [Python 2.7.9 for Windows](https://www.python.org/downloads/release/python-279).

Under the Download tab, choose the appropriate `msi` file to download, either [x86](https://www.python.org/ftp/python/2.7.9/python-2.7.9.msi) or [x64](https://www.python.org/ftp/python/2.7.9/python-2.7.9.amd64.msi) based on your operation system.

Once the `.msi` file is downloaded, double click it to install under a path similar to `/c/usr/bin/python`.

the executable python.exe should then be under: `/c/usr/bin/python/python.exe`

Run git bash as administrator, then go to the bin of git bash by running:
```sh
cd /usr/bin
```

Create a symbolic link by running:
```sh
ln -s /c/usr/bin/python/python.exe python.exe
```

Verify the symbolic link is working properly by running:
```sh
which python # should see /usr/bin/python
python -V # using uppercase V to see the version of installed python
```

if there is error saying php is not found on sh.exe, restart the git bash and run above line again.

[BACK TO TOP](#table-of-contents)


### Python on Mac

Mac should have Python installed by default.  To verify it, you can open your terminal and run:
```sh
python --version
```
It should show you the version of your currently installed Python.

If Python does not come with your Mac somehow or you want to have a newer version of Python, (e.g. Python 3.x rather than Python 2.7.x), you can download and follow the installation instruction on [Python's website](https://www.python.org/downloads).

Or you can install the latest version of Python through Homebrew by running:
```sh
brew install python
```
[BACK TO TOP](#table-of-contents)


### Python on Ubuntu
Install Python can be very easy with the help from the DeadSnakes PPA:
```sh
sudo add-apt-repository ppa:fkrull/deadsnakes
sudo apt-get update
sudo apt-get install python2.7
```
[BACK TO TOP](#table-of-contents)


### Python on Fedora
```sh
sudo yum update
sudo yum install python27
```
[BACK TO TOP](#table-of-contents)
