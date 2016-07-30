#!/usr/bin/env bash
set -e

# php7
apt install -y python-software-properties software-properties-common build-essential git
add-apt-repository ppa:ondrej/php
apt update
apt install -y php php-mysql php-xml php-mbstring php-zip

# composer
apt install -y curl
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
sudo chown vagrant /usr/local/bin/composer

# mysql
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
apt update
sudo apt -y install mysql-server
echo "CREATE DATABASE IF NOT EXISTS sententiaregum;" | mysql -u root -proot

# redis
apt install -y redis-server

# nodejs
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt install -y nodejs
npm install -g webpack less node-gyp

# ensure existance of project dir
mkdir -p /var/www/sententiaregum
chown -R vagrant /var/www/sententiaregum
