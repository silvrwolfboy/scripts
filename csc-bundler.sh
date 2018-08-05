#!/usr/bin/env bash

# A chicken self-contained script bundler (that requires egg also to be bundled)

# NOTE! Please pass the program_name without .scm extension
# ./csc-bundler <program_name> <eggs_to_install>
PROGRAM_NAME="$1"

csc -deploy "$PROGRAM_NAME.scm"
chicken-install -init "$PROGRAM_NAME"
chicken-install -deploy -prefix "$PROGRAM_NAME" "${@:2}"
