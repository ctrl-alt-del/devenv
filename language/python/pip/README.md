`pip`
=====
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
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


### `pip` on Ubuntu
```sh
sudo apt-get install python-pip
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


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
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)
