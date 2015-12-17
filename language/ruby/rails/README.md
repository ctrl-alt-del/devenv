Rails
=====
[Rails](http://rubyonrails.org) is an open-source web framework for [Ruby](https://github.com/ctrl-alt-del/devenv/tree/master/language/ruby).

* [**Windows**](#rails-on-windows)
* [**Mac**](#rails-on-mac)
* [**Ubuntu**](#rails-on-ubuntu)
* [**Fedora**](#rails-on-fedora)

### Rails on Windows
Ruby and `devkit` are the prerequisite for Rails.  To verify both Ruby and `devkit` are installed in your machine, run the following lines on your git bash:
```sh
which ruby # should see a path similar to ~/Applications/ruby/bin/ruby
which gem # should see a path similar to ~/Applications/devkit/gem
```

Then run following line to install Rails:
```sh
gem install rails
```

Once installation is done, verify it by running:
```sh
which rails # should see a path similar to ~/Applications/rails/rails
rails -v # should see the version of rails
```
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


## Rails on Mac
As it is shown [here](#ruby-on-mac) earlier, Mac should have come with Ruby by default.  Therefore, you can install Rails through terminal by simply running:
```sh
gem install rails
```

To install latest stable Rails through RVM, you can simply run:
```sh
\curl -sSL https://get.rvm.io | bash -s stable --rails
```

Once installation is done, verify it through running:
```sh
which rails
rails -v
```

If you encounter issue while running `gem install pg`, you need to install PostgreSQL and you can do so by follow the instruction [here](#postgresql-on-mac).

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


## Rails on Ubuntu
Please follow the same instruction of [Mac](#rails-on-mac).

If you come across an error that compliant about no having a Javascript runtime environment, you can resolve it by installing [Node.js](#nodejs-on-ubuntu).
[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)


## Rails on Fedora
Please follow the same instruction of [Mac](#rails-on-mac).

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)
