iPython
=======
[**iPython**](http://ipython.org) An enhanced Interactive Python.  To install `ipython`, you will need to have [`pip`](https://github.com/ctrl-alt-del/devenv/tree/master/language/python/pip)

* [**Windows**](#ipython-on-windows)
* [**Mac**](#ipython-on-mac)
* [**Ubuntu**](#ipython-on-ubuntu)
* [**Fedora**](#ipython-on-fedora)

### iPython on Windows
Open you git-bash, assuming you have `pip` installed
```sh
pip install ipython pyreadline
```
`pyreadline` is needed for `ipython` to properly display on Windows.

[BACK TO TOP](#table-of-contents)



### iPython on Mac
```sh
sudo pip install ipython gnureadline
```
`gnureadline` is strongly recommended because `readline` will not behave well without it.

[BACK TO TOP](#table-of-contents)



### iPython on Ubuntu
```sh
sudo pip install ipython
```
[BACK TO TOP](#table-of-contents)



### iPython on Fedora
Follow the same instruction as [Ubuntu](#ipython-on-ubuntu)

[BACK TO TOP](#table-of-contents)
