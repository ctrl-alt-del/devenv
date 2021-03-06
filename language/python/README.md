Python
======

* [**Anaconda**](#anaconda)
* [**Windows**](#python-on-windows)
* [**Mac**](#python-on-mac)
* [**Ubuntu**](#python-on-ubuntu)
* [**Fedora**](#python-on-fedora)

## Anaconda
You can also install `python` and manage its libraries via Anaconda


### Python on Windows
There are Python 2.x and Python 3.x available.  This instruction will focus on 2.x, but similar steps can be easily applied to 3.x as well.

Download [Python 2.7.11 for Windows](https://www.python.org/downloads/release/python-279).

Under the Download tab, choose the appropriate `msi` file to download, either [x86](https://www.python.org/ftp/python/2.7.11/python-2.7.11.msi) or [x64](https://www.python.org/ftp/python/2.7.11/python-2.7.11.amd64.msi) based on your operation system.

Once the `.msi` file is downloaded, double click it to install under a path similar to `~/Applications/Python`.

the executable python.exe should then be under: `~/Applications/Python/python.exe`

Run git bash as administrator, then create a symbolic link by running:
```sh
ln -s ~/Applications/Python/python.exe /usr/bin/python.exe
```

Verify the symbolic link is working properly by running:
```sh
which python # should see /usr/bin/python
python -V # using uppercase V to see the version of installed python
```
if there is error saying python is not found on sh.exe, restart the git bash and run above line again.

In order to make `python` available across `cmd.exe` and `PowerShell.exe`, we need to add the root directory of Python and its `\Scripts` folder as environment variables.

#### Known Issue
1. Type `python` on git-bash to enter python shell will halt the terminal
It is a known issue for newer version of git-bash, which uses `MinGW64`.

To bypass this issue, simply declare the interactive flag, `-i` while entering python shell.
```sh
python -i
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)



### Python on Mac
Mac should have Python installed by default.  To verify it, you can open your terminal and run:
```sh
python --version
```
It should show you the version of your currently installed Python.

If for any reason, you want to use Python other than the one came with Mac; you can do so by downloading a copy of your interest from [Python's website](https://www.python.org/downloads).

Or you can install the latest version of Python through Homebrew by running:
```sh
brew install python
```

If you install python via `brew`, you also need to override the `PATH` system variable to tell Mac to use the `python` that you just installed via `brew`.  To do so, you can run the following line:
```
export PATH="/usr/local/Cellar:/usr/local/bin:$PATH" >> ~/.bashrc
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)



### Python on Ubuntu
Python should've been installed to Ubuntu by default.  In case you prefer another version of python, you can install it with the help of the DeadSnakes PPA:
```sh
sudo add-apt-repository ppa:fkrull/deadsnakes
sudo apt-get update
sudo apt-get install python2.7
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)



### Python on Fedora
```sh
sudo yum update
sudo yum install python27
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)
