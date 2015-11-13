Python
======

* [**Windows**](#python-on-windows)
* [**Mac**](#python-on-mac)
* [**Ubuntu**](#python-on-ubuntu)
* [**Fedora**](#python-on-fedora)
* [**`pip`**](#pip)

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

if there is error saying python is not found on sh.exe, restart the git bash and run above line again.

In order to make `python` available across `cmd.exe` and `PowerShell.exe`, we need to add the root directory of Python and its `\Scripts` folder as environment variables.

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




## `pip`
[**`pip`**](https://pip.pypa.io/en/stable) is a package control tool for [Python](#python).

Python 2.7.9 and later contain `pip` by default, but you are free to install or upgrade it if it doesn't not come with your python, or you want to have the latest version.

* We can upgrade `pip` on Windows through: `python -m pip install -U pip`
* We can upgrade `pip` on Linux/Unix base OS through: `sudo pip install -U pip`

* [**Mac**](#pip-on-mac)
* [**Ubuntu**](#pip-on-ubuntu)
* [**Fedora**](#pip-on-fedora)

### `pip` on Mac
To install `pip`, you can download its installer file from [here]
(https://pip.pypa.io/en/latest/installing.html#install-pip)

Once download is completed, you can install `pip` by running:
```sh
cd ~/Downloads
sudo python get-pip.py
```

You can verify its version by running:
```sh
pip -V
```
[BACK TO TOP](#table-of-contents)


### `pip` on Ubuntu
```sh
sudo apt-get install python-pip
```
[BACK TO TOP](#table-of-contents)


### `pip` on Fedora
```sh
sudo yum clean all
sudo yum -y update
sudo yum install python-pip
```

Alternatively, we can install `pip` from source code.  This approach works on all Linux/Unix base OS.
```sh
curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
sudo python get-pip.py
```
[BACK TO TOP](#table-of-contents)