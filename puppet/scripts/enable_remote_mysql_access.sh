#!/bin/bash

mysql -uroot -proot < "/vagrant/puppet/scripts/enable_remote_mysql_access.sql"
sed -i "s/^bind-address/#bind-address/" /etc/mysql/my.cnf
sudo service mysql restart

# Enable mod_rewrite
sudo a2enmod rewrite

#restart apache process
sudo service apache2 restart