#!/bin/bash

sudo yum install httpd php php-fpm php-zip php-gd php-mbstring php-xml php-json -y 
sudo rm -f /etc/httpd/conf/httpd.conf
sudo wget -P /etc/httpd/conf/ https://objectstorage.us-phoenix-1.oraclecloud.com/n/bmc-flaviop/b/web-page/o/httpd.conf
sudo wget -P /var/www/html/ https://calc-replica-production.web.app/
sudo wget -P /var/www/html/ https://calc-replica-production.web.app/css/style.css
sudo wget -P /var/www/html/ https://calc-replica-production.web.app/js/calc.js
sudo systemctl start php-fpm
sudo systemctl enable php-fpm
sudo setsebool -P httpd_can_network_connect 1
sudo setsebool -P httpd_unified 1
sudo apachectl start
sudo systemctl enable httpd
sudo firewall-offline-cmd --add-port=80/tcp
sudo systemctl restart firewalld