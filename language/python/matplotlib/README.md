matplotlib
==========
[matplotlib](http://matplotlib.org) is a python 2D plotting library similar to Matlab or Mathematica.

* [**Windows**](#matplotlib-on-windows)
* [**Mac**](#matplotlib-on-mac)
* [**Ubuntu**](#matplotlib-on-ubuntu)
* [**Fedora**](#matplotlib-on-fedora)

### matplotlib on Windows
There is currently no matplotlib installer for Windows; users need to to install each package individually by themselves.  The The easiest alternative that I found is to take advantage of the auto import feature of PyCharm, and let it automatically search, download and install all dependencies.  However, this approach requires users to install [`numpy`](http://www.numpy.org) package manually as the prerequisite.

To install `numpy` manually on Windows, you need to have python pre-installed; if you haven't install `python`, you can do so by following the instruction in [here](https://github.com/ctrl-alt-del/devenv/tree/master/language/python).

To download `numpy`, you can either click  [here](http://sourceforge.net/projects/numpy/files/NumPy/1.10.2/numpy-1.10.2.zip/download), or navigate to its [download page](http://www.scipy.org/scipylib/download.html) and select the proper package for your operating system.

Once the zip file is downloaded, unzip it.  Open either `cmd.exe`, `PowerShell.exe` or `git-bash.exe`, navigate to the unzipped folder and run the following script:
```sh
python setup.py install
```

Once `numpy` is installed, you can use PyCharm's auto complete import feature to install the rest of the dependencies required by `matplotlib`.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)



### matplotlib on Mac
### matplotlib on Ubuntu
### matplotlib on Fedora
