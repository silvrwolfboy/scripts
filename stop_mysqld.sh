#!/bin/bash

# stop mysql daemon
echo "Starting \"stop_mysqld.sh\""

mysqld_status=$(service --status-all | awk '/mysql/ {print $2}')

if [[ $mysqld_status == '+' ]];then
        sudo service mysql stop
        echo "mysql daemon stopped."

else
        echo "mysql daemon is not running."
fi

