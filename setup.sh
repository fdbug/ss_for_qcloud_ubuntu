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
# fix openssl bug
sed -i 's/EVP_CIPHER_CTX_cleanup/EVP_CIPHER_CTX_reset/g' /usr/local/lib/python2.7/dist-packages/shadowsocks/crypto/openssl.py
systemctl enable /etc/systemd/system/shadowsocks.service
service shadowsocks restart
# check
if [ `netstat  -nap | grep 3389 | grep LISTEN|wc -l`=="1" ] 
then
    echo "ss install succeed!"
else
    echo "ss install failed! please manual check!"
fi
