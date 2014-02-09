silex-boilerplate
=================

Ubuntu Vangant box with a boilerplate Silex application. 

Inluding in the box: 
* PHP 5.4.*
* Apache 2.4
* MySQL 5.5
* Composer
* xDebug
* lots of other stuff that are useful

Vagrant
-------
Download and install Vagrant from http://www.vagrantup.com. When thats done, move to the directory and run: 

    vagrant up

When the box is compiled, you can either run composer from inside the box by ssh'ing in and runnings composer install, or you can do that from the folder on your local machine if you have Composer installed. 

Silex
-----
This application is mostly just Fabian's Silex Skeleton with some debugging activated and an htaccess rewrite to make the index_dev.php the default file that apache looks for. 

To see the app working add the following to your Hosts file: 

    192.168.100.100 silex.localhost.com

Now you can go to http://silex.localhost.com and the index_dev.php will be automatically used to present the page. 

Don't forget you have to download the vendor packages with composer before it will work. 