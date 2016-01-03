matplotlib
==========
[matplotlib](http://matplotlib.org) is a python 2D plotting library similar to Matlab or Mathematica.

* [**Windows**](#matplotlib-on-windows)
* [**Mac**](#matplotlib-on-mac)
* [**Ubuntu**](#matplotlib-on-ubuntu)
* [**Fedora**](#matplotlib-on-fedora)

### matplotlib on Windows
There is currently no `matplotlib` installer for Windows; users need to to install each package individually by themselves.  The The easiest alternative that I found is to take advantage of the auto import feature of PyCharm, and let it automatically search, download and install all dependencies.  However, this approach requires users to install [`numpy`](http://www.numpy.org) package manually as the prerequisite.

You can follow the instruction [here](https://github.com/ctrl-alt-del/devenv/tree/master/language/python/numpy) to install `numpy` manually on Windows.

Once `numpy` is installed, you can use PyCharm's auto complete import feature to install the rest of the dependencies required by `matplotlib`.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)



### matplotlib on Mac
To install `matplotlib` on Mac, you need `pip` as the prerequisite; to install `pip`, you can do so by following the instruction in [here](https://github.com/ctrl-alt-del/devenv/tree/master/language/python/pip).
```sh
pip install matplotlib
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)



### matplotlib on Ubuntu
```sh
sudo apt-get install python-matplotlib
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)



### matplotlib on Fedora
```sh
sudo yum install python-matplotlib
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)
