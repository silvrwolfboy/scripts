#!/bin/bash

if [[ $EUID != 0 ]]
then
	echo "You need to run this script as root!" 2>&1
	exit 1
fi

# install root level tools
yum install perl perl-devel tar wget vim gcc httpd crontabs

exit $?
