#!/bin/bash

# Generate random strings
# By default, if not arguments were supplied than generate 15 chars.
date +%s | sha256sum| base64 | head -c ${1-15}; echo
