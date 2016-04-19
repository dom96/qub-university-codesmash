#!/usr/bin/env bash

config_path=$1
username='vagrant'
password='vagrant'

cp "${config_path}/smb.conf" /etc/samba/smb.conf

restart smbd
restart nmbd

echo $password | tee - | smbpasswd -s -a $username
