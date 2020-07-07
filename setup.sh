#!/bin/bash
# need root 
# wget https://raw.githubusercontent.com/fdbug/ss_for_qcloud_ubuntu/master/setup.sh
if ［ `whoami` = "root" ］
then
    echo "start!"
else
    echo "not root!"
    exit 0
fi
cd ~
wget https://raw.githubusercontent.com/fdbug/ss_for_qcloud_ubuntu/master/shadowsocks.json
wget https://raw.githubusercontent.com/fdbug/ss_for_qcloud_ubuntu/master/shadowsocks.service
# chmod x+r setup.sh
apt install python-pip
pip install shadowsocks
cp ./shadowsocks.json /etc/shadowsocks.json
cp ./shadowsocks.service /etc/systemd/system/shadowsocks.service
systemctl enable /etc/systemd/system/shadowsocks.service
service shadowsocks restart
