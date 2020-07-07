#!/bin/bash
# need root 
if [ `whoami` = "root" ]
then
    echo "remove start!"
else
    echo "not root!"
    exit 0
fi
pip uninstall shadowsocks
rm /etc/shadowsocks.json
systemctl disable shadowsocks
rm /etc/systemd/system/shadowsocks.service
