#!/bin/bash

# Actualizar el sistema
sudo apt update
sudo apt upgrade -y
sudo apt-get install -y mono-complete mysql-server
echo ´#changes for opensim use
ssl=0
skip_ssl
default-authentication-plugin=mysql_native_password´ >> /etc/mysql/mysql.conf.d/mysqld.cnf
sudo mysql_secure_installation 
