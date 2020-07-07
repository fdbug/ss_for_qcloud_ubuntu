#!/bin/bash
# sudo su - root
# wget https://github.com/fdbug/ss_for_qcloud_ubuntu
# chmod x+r setup.sh
sudo apt install python-pip
pip install shadowsocks
sudo cp ./shadowsocks.json /etc/shadowsocks.json
sudo cp ./shadowsocks.service /etc/systemd/system/shadowsocks.service
systemctl enable /etc/systemd/system/shadowsocks.service
service shadowsocks restart
