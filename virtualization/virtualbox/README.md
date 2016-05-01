VirtualBox
==========
[**VirtualBox**](https://www.virtualbox.org) is a tool for setting up virtualization machine maintained by Oracle.

* [**Windows**](#virtualbox-on-windows)
* [**Mac**](#virtualbox-on-mac)
* [**Ubuntu**](#virtualbox-on-ubuntu)
* [**Fedora**](#virtualbox-on-fedora)

### VirtualBox on Windows
Visit [VirtualBox's download page](https://www.virtualbox.org/wiki/Downloads) and download its `.exe` file for Windows.

Once downloaded, double click to install.

[BACK TO TOP](#table-of-contents)


### VirtualBox on Mac
Visit [VirtualBox's download page](https://www.virtualbox.org/wiki/Downloads) and download its `.dmg` file for Mac.

Once downloaded, double click to install.

[BACK TO TOP](#table-of-contents)


### VirtualBox on Ubuntu
The easy way is to use `apt-get`, but it may not be providing you the latest version.
```sh
sudo apt-get install virtualbox
```

You can download and install the latest version manually.

For Ubuntu 13.04 and above, you can download:
*[**x86 `deb` file**](http://download.virtualbox.org/virtualbox/4.3.30/virtualbox-4.3_4.3.30-101610~Ubuntu~raring_i386.deb)
*[**x64 `deb` file**](http://download.virtualbox.org/virtualbox/4.3.30/virtualbox-4.3_4.3.30-101610~Ubuntu~raring_amd64.deb)

Once download is completed, navigate to the download destination, and then install it with command: `sudo dpkg -i virtualbox*`.

For other ubuntu version or linux distro, just visit its [download page for Linux](https://www.virtualbox.org/wiki/Linux_Downloads), and download the `deb` or `rpm` file accordingly.

[BACK TO TOP](#table-of-contents)


### VirtualBox on Fedora
It requires a little bit more work to install VirtualBox on Fedora.

Before all, please run `sudo yum update` to get the latest updates and then restart the computer if there are new updates were installed.

Navigate to the repository directory and add the virtualbox repo
```sh
cd /etc/yum.repos.d/
sudo  wget http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
```

Then, perform another `sudo yum update` and install the required libraries:
```sh
sudo yum install kernel-devel dkms binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers
```

Once the libraries are installed, you can install VirtualBox:
```sh
sudo yum install VirtualBox-4.3.x86_64
```
[BACK TO TOP](#table-of-contents)
