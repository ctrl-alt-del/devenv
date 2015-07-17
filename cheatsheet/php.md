Cheatsheet for PHP
==================

# API stub using plain PHP files
I thought about creatig a quick and easy way to `fake` a rest API style stub using plain php files so that I can easily perform some testing on a vanilla LAMP stack virtual machine's `/var/www/html` folder.

There are some tasks needed to be done to get this idea working:
* Recognize the HTTP request type
* retrieve and parse the path info if there is any

### Recognize the HTTP request type
Let say if I call a `http://localhost/products`, the `product.php` should be able to recognize what HTTP type it is and response accordingly.
```php
$method = $_SERVER['REQUEST_METHOD'];
```

### Parse path info
To get the parameters of a url, I cut the url with `/` and put all items into an array excpet the first one.
```php
$params = explode( "/", substr( @$_SERVER['PATH_INFO'], 1 ) );
```

### Navigate base on HTTP type
Once we know the HTTP type, we can setup the response.  I use `switch` statement here just to make it a bit cleaner, but `if` statements would work the same way.
```php
// $method should get the HTTP type
switch ( $method ) {
    case 'HEAD':
        break;
    case 'GET':
        break;
    case 'POST':
        break;
    case 'PUT':
        break;
    case 'DELETE':
        break;
    default:
        break;
}
```
