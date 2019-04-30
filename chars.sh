#!/bin/bash

# Generate random strings
# By default, if no arguments were supplied than generate 15 chars.
if read -d '' -rN 100 < /dev/urandom; then
	printf "%.${1:-15}s\n" "${REPLY//[![:alnum:][:punct:]]}"
fi
