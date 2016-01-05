numpy
=====
[NumPy](http://www.numpy.org) is the fundamental package for scientific computing with Python.

### numpy on Windows
There two ways of installing `numpy`:

1. [Using miniconda](#using-miniconda)
2. [Installing from source code](#installing-from-source-code)

#### Using miniconda
[Conda]((http://conda.pydata.org/doc) is an open source package management system and environment management system and U [`miniconda`](http://conda.pydata.org/miniconda.html) is its minimalistic version.

```sh
conda install numpy
```

#### Installing from source code
To install `numpy` manually on Windows, you need to have python and Microsoft Visual C++ 9.0 pre-installed; if you haven't install `python`, you can do so by following the instruction in [here](https://github.com/ctrl-alt-del/devenv/tree/master/language/python).

To install Microsoft Visual C++ 9.0, download the package [here](http://aka.ms/vcpython27) and double click the downloaded file to install it.

To download `numpy`, you can either click  [here](http://sourceforge.net/projects/numpy/files/NumPy/1.10.2/numpy-1.10.2.zip/download), or navigate to its [download page](http://www.scipy.org/scipylib/download.html) and select the proper package for your operating system.

Once the zip file is downloaded, unzip it.  Open either `cmd.exe`, `PowerShell.exe` or `git-bash.exe`, navigate to the unzipped folder and run the following script:
```sh
python setup.py install
```
