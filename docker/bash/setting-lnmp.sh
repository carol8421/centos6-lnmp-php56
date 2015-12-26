#!/bin/bash

# Create WORKDIR
mkdir /home/website

# Setting php
cp -p /etc/php.ini /etc/php.ini.backup
sed -i -e 's/;date.timezone =/date.timezone = "Asia\/Taipei"/' /etc/php.ini | grep date.timezone

# Setting php-fpm
cp -p /etc/php-fpm.d/www.conf /etc/php-fpm.d/www.conf.backup
sed -i -e 's/user = apache/user = nginx/' /etc/php-fpm.d/www.conf
sed -i -e 's/group = apache/group = nginx/' /etc/php-fpm.d/www.conf

# Setting nginx
mkdir /etc/nginx/sites-available
mkdir /etc/nginx/sites-enabled
mkdir /etc/nginx/plugins
mkdir /usr/share/nginx/virtualhost
cp -p /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup
sed -i -e 's/include \/etc\/nginx\/conf.d\/\*.conf;/include \/etc\/nginx\/conf.d\/\*.conf;\n    include \/etc\/nginx\/sites-enabled\/\*.conf;/' /etc/nginx/nginx.conf