#!/bin/bash

# Alert user if storage disk size exceeds 60%

df_output=$(df -h | awk '/sda1/ {print $5}')
cleaned_output=$(echo $df_output | sed 's/%$//')

if [[ "$cleaned_output" -ge 60 ]];then
        printf "\n\tAlert!!!\n\tStorage usage is over $(($cleaned_output - 1)) percent. \n\tPlease remove unecessary junks from the operating system.\n\n\tSuggestion: sudo apt autoremove\n"
fi
