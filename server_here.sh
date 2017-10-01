#!/bin/bash

if [[ -z $1 ]]; then
        python3 -mhttp.server 3000

else
        python3 -mhttp.server $1
fi
