#!/bin/bash

# stop mysql daemon
echo "Starting \"stop_mysqld.sh\""

mysqld_status=$(service --status-all | awk '/mysql/ {print $2}')

if [[ $mysqld_status == '+' ]];then
        sudo service mysql stop
        printf "\n\nmysqld daemon stopped.\n"

else
        printf "\n\nmysqld daemon is not running.\n"
fi

