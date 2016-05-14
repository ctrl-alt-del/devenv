apt
===
[**apt**](https://en.wikipedia.org/wiki/Advanced_Packaging_Tool) stands for Advanced Package Tool.
It is a command-line interface (cli) for installing libraries on Linux environment.

* [**Ubuntu**](#apt-on-ubuntu)
* [**Fedora**](#apt-on-fedora)

## apt on Ubuntu
`apt-get` is the default package manager for Ubuntu.


## apt on Fedora
The default package manager for Fedora is `yum`.

It is recommended to use `yum` instead of `apt-get` in this situation.  However, if you insist on using `apt-get`, you can do so by installing `apt` first, then using `apt` to install `apt-get`.
```sh
yum install apt
```

The details of configuration of `apt-get` can be found in [here](https://wiki.debian.org/AptCLI)
