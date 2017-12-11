#!/bin/bash

if [[ -f $@ ]];then
        ls $1 | awk -F. '{print $NF}'

elif [[ -d $@ ]];then
        echo "Directories are not tolerated. Only file or files allowed."
fi
