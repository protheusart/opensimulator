#!/bin/bash

# Actualizar el sistema
sudo apt update
sudo apt upgrade -y
sudo apt install -y gnupg ca-certificates
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-jammy main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update
sudo apt-get install -y mono-complete
sudo apt-get install -y mysql-server
echo ´#changes for opensim use
ssl=0
skip_ssl
default-authentication-plugin=mysql_native_password´ >> /etc/mysql/mysql.conf.d/mysqld.cnf
sudo mysql_secure_installation 
