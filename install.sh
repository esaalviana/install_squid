#!/bin/bash

# Update dan upgrade paket
apt -y update && apt -y upgrade

# Instalasi paket nano, squid, dan apache2-utils
apt -y install nano squid apache2-utils

# Pindah ke direktori /etc/squid/
cd /etc/squid/

# Hapus file squid.conf
rm squid.conf

# Buat file squid.conf dari URL yang diberikan
wget -O squid.conf https://dl.dropboxusercontent.com/s/aucblyjrzgogyap/squid.conf

# Reload layanan squid
systemctl reload squid.service

# Buat file /etc/squid/passwd dan atur pemiliknya
touch /etc/squid/passwd
chown proxy: /etc/squid/passwd

# Buat pengguna htpasswd
htpasswd /etc/squid/passwd gojek1
