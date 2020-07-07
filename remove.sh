#!/bin/bash
# need root 
if [ `whoami` = "root" ]
then
    echo "remove start!"
else
    echo "not root!"
    exit 0
fi
ps aux | grep ssserver | grep -v grep  | awk 'system("kill -9 "$2)'
echo y | pip uninstall shadowsocks
rm /etc/shadowsocks.json
systemctl disable shadowsocks
rm /etc/systemd/system/shadowsocks.service
