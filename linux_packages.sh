#!/bin/bash

# install sysadmin package bundle for debian family distro

if [[ $EUID != 0 ]]
then
	echo "You need to run as root for this script!" 2>&1
	exit 1
fi

apt update -y
apt install vim mtr traceroute nmap curl netcat wget htop ftp gcc make coreutils -y
apt autoremove -y
