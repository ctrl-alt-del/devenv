Cheatsheet for PHP
==================

# API stub using plain PHP files
I thought about creatig a quick and easy way to `fake` a rest API style stub using plain php files so that I can easily perform some testing on a vanilla LAMP stack virtual machine's `/var/www/html` folder.

There are some tasks needed to be done to get this idea working:
* Recognize the HTTP request type
* retrieve and parse the path info if there is any
