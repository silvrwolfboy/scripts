#!/bin/sh

## Copyright (c) 2018-2019 momozor <skelic3 at gmail dot com>

GITURL="$1"

command -v git 1> /dev/null 2> /dev/null
test $? -ne 0 \
        && printf "\n* error: git command is not exist in your PATH\n\n" >&2 \
        && exit 1

# set with export CHICKEN_REPOSITORY=...
# or invoke as CHICKEN_REPOSITORY=... sh ./cigithub.sh
test -z "$CHICKEN_REPOSITORY" \
        && printf "\n* error: \$CHICKEN_REPOSITORY env var is not set!\n\n" >&2 \
        && exit 1

test -z "$GITURL" \
        && printf "\nUsage: cigithub <URL>" >&2 \
        && printf "\nExample: cigithub https://github.com/Skylisp/cigithub\n\n" >&2 \
        && exit 1

if test -n "$(echo "$GITURL" | awk '/https?://(www.)?/ {print}')"
then
        CTEMPDIR="$(mktemp -d)"
         
        echo "** cloning $GITURL to $CTEMPDIR/cigithub-tmp..."
        git clone "$GITURL" "$CTEMPDIR/cigithub-tmp" 1> /dev/null 2> /dev/null
        test $? -ne 0 \
                && printf "\n* error: failed to clone repository. Please ensure URL is valid.\n\n" >&2 \
                && exit 1

        cd "$CTEMPDIR/cigithub-tmp" || exit

        echo "** installing egg to $CHICKEN_REPOSITORY.."
        chicken-install "$(ls ./*.setup)" 1> /dev/null 2> /dev/null
        test $? -ne 0 \
                && printf "\n* error: failed to install egg. Please ensure egg_name.setup exists in the directory\n\n" \
                >&2 && exit 1

        printf "\n* success: installation successful\n\n" && exit 0

elif test -z "$(echo "$GITURL" | awk '/http*/ {print}')"
then
        printf "\n* error: argument must be a valid http(s) URL\n\n" >&2 \
        && exit 1
fi
