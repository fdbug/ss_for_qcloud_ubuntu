#!/bin/bash
# sudo su - root
# wget https://raw.githubusercontent.com/fdbug/ss_for_qcloud_ubuntu/master/setup.sh
sudo su - root
cd ~
wget https://raw.githubusercontent.com/fdbug/ss_for_qcloud_ubuntu/master/shadowsocks.json
wget https://raw.githubusercontent.com/fdbug/ss_for_qcloud_ubuntu/master/shadowsocks.service
# chmod x+r setup.sh
sudo apt install python-pip
pip install shadowsocks
sudo cp ./shadowsocks.json /etc/shadowsocks.json
sudo cp ./shadowsocks.service /etc/systemd/system/shadowsocks.service
systemctl enable /etc/systemd/system/shadowsocks.service
service shadowsocks restart
