Vagrant
=======
[**Vagrant**](https://www.vagrantup.com) is a tool for building development environment.

* [**Windows**](#vagrant-on-windows)
* [**Mac**](#vagrant-on-mac)
* [**Ubuntu**](#vagrant-on-ubuntu)
* [**Fedora**](#vagrant-on-fedora)

### Vagrant on Windows
Visit [Vagrant's download page](https://www.vagrantup.com/downloads.html) and download the `.msi` file for Windows.

Once downloaded, double click to install.

[BACK TO TOP](#table-of-contents)


### Vagrant on Mac
Visit [Vagrant's download page](https://www.vagrantup.com/downloads.html) and download the `.dmg` file for Mac OS.

Once downloaded, double click to install.

[BACK TO TOP](#table-of-contents)


### Vagrant on Ubuntu
Visit [Vagrant's download page](https://www.vagrantup.com/downloads.html) and download the `.deb` file for Ubuntu.

Once downloaded, navigate to the download destination, and execute:
```sh
sudo dpkg -i vagrant*
```

There are some know issues for Vagrant on Ubuntu:
1. `mount.nfs`: requested NFS version or transport protocol is not supported
```sh
sudo apt-get install nfs-kernel-server
```
[BACK TO TOP](#table-of-contents)


### Vagrant on Fedora
Visit [Vagrant's download page](https://www.vagrantup.com/downloads.html) and download the `.rpm` file for Fedora.
```sh
rpm -U vagrant*
```
[BACK TO TOP](#table-of-contents)
