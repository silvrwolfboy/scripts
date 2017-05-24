#!/bin/bash

# reminder: cat /etc/hosts for hostnames to use

if [[ $EUID != 0 ]]
then
	echo "You need to run this script as root!" 2>&1
	exit 1
fi

# setup httpd (servername misleading)
perl -p -i -e 's/\#ServerName www\.example\.com\:80/ServerName localhost/' /etc/httpd/conf/httpd.conf

# check if the setting doesn't result any error
apache2ctl configtest

# start apache/httpd
service httpd start

exit $?
