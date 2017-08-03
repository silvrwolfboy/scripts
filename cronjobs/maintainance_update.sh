#!/bin/bash

# specific sysadmin's tools upgrade

if [[ $EUID != 0 ]]
then
	echo "You must be root to run this script!" 2>&1
	exit 1
fi

apt update -y

apt install --only-upgrade dpkg-dev libpci3 pciutils wget curl vim bash apparmor ufw build-essential nmap tcpdump netcat openssl openssh-client openssh-server linux-firmware -y
