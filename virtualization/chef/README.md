Chef
====
[**Chef**](https://www.chef.io) is a tool for provisioning servers.

* [**Windows**](#chef-on-windows)
* [**Mac**](#chef-on-mac)
* [**Chef Tools**](#chef-tools)
* [**Knife-solo**](#knife-solo)
* [**Librarian-Chef**](#librarian-chef)

### Chef on Windows
Visit [Chef's download page](http://www.chef.io/chef/install) and download the `msi` installer for your specific Windows version.

Once downloaded, double click to install.  Installation details can be found on [here](https://docs.chef.io/install_windows.html#use-msi-installer).

[BACK TO TOP](#table-of-contents)


### Chef on Mac
You can install `chef` through `gem`:
```sh
gem install chef
```

However, a self-contained package is recommended, so you can also install `chef` through this script provided by the creators of `chef`:
```sh
curl -L https://www.opscode.com/chef/install.sh | bash
```
[BACK TO TOP](#table-of-contents)


### Chef Tools

#### Knife-solo
[**Knife-solo**](http://matschaffer.github.io/knife-solo) contains a set of command line tools that would make using `chef-solo` as easier.

```sh
gem install knife-solo
```
[BACK TO TOP](#table-of-contents)


#### Librarian-Chef
[**Librarian-Chef**](https://github.com/applicationsonline/librarian-chef) is a tool that helps you to manage cookbooks.

```sh
gem install librarian-chef
```
[BACK TO TOP](#table-of-contents)
