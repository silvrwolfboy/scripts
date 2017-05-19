#!/bin/bash

# install sysadmin package bundle for either debian family or redhat famility distro

if [[ $EUID != 0 ]]
then
	echo "You need to run as root for this script!" 2>&1
	exit 1
fi

# for debian or ubuntu based family
if [[ $(uname -a | grep -i 'ubuntu\|debian') ]]
then
	apt update -y
	apt install vim mtr traceroute nmap curl wget htop ftp gcc make coreutils -y
	apt autoremove -y
fi

