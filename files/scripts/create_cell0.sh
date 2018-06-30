#!/bin/bash
MYSQL_USER=$1
MYSQL_PASS=$2
NOVA_PASS=$3

mysql -u $MYSQL_USER -p$MYSQL_PASS -e "CREATE DATABASE nova_cell0;"
mysql -u $MYSQL_USER -p$MYSQL_PASS -e "GRANT ALL PRIVILEGES ON nova_cell0.* TO 'nova'@'localhost' \
          IDENTIFIED BY \"$NOVA_PASS\";"
mysql -u $MYSQL_USER -p$MYSQL_PASS -e "GRANT ALL PRIVILEGES ON nova_cell0.* TO 'nova'@'%' \
          IDENTIFIED BY \"$NOVA_PASS\";"