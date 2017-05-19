#!/bin/bash

# update dpkg packages list
apt update -y

apt install --only-upgrade dpkg-dev libpci3 pciutils wget curl vim 
bash apparmor ufw build-essential nmap tcpdump netcat openssl openssh-client openssh-server linux-firmware -y
