#!/bin/bash

#mkdir -p /home/reese/.composer
#cp /secrets/.composer_auth.json /home/reese/.composer/auth.json
mkdir -p /home/reese/.ssh/config
chmod 700 /home/reese/.ssh
cp /secrets/ssh.config /home/reese/.ssh/config
cp /secrets/github.pem /home/reese/.ssh/
cp /secrets/authorized_keys /home/reese/.ssh/
chmod 600 /home/reese/.ssh/config
chmod 600 /home/reese/.ssh/github.pem

##get source code
#git clone git@github.com:shinymayhem/nodify-app /tmp/cloned
#cp -R /tmp/cloned/. /var/www/html
#cd /var/www/html
#php composer.phar self-update
#php composer.phar install

#fix permissions
chown -R www-data /var/www/html/data
chown -R www-data /var/www/html/logs
chown -R www-data /var/www/html/public/assets

echo "nodify dal html data container"

bash /opt/deploy/ssh.sh
#sh -c '/usr/sbin/sshd -D'
