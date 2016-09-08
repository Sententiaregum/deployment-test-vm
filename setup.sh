#!/usr/bin/env bash
set -e

apt-get update

# php7
apt-get install -y software-properties-common git
add-apt-repository ppa:ondrej/php
apt-get update
apt-get install -y php php-mysql php-xml php-mbstring php-zip

# composer
apt-get install -y curl
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
sudo chown vagrant /usr/local/bin/composer

# mysql
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
apt-get update
sudo apt-get -y install mysql-server
echo "CREATE DATABASE IF NOT EXISTS sententiaregum;" | mysql -u root -proot

# redis
apt-get install -y redis-server

# nodejs
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs
npm install -g webpack less node-gyp

# ensure existance of project dir
mkdir -p /var/www/sententiaregum
chown -R vagrant /var/www/sententiaregum
