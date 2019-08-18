#!/bin/sh

project_name=$1
git clone emptyProject $project_name
cd $project_name
echo "Now in $(pwd)"
sed -i "s/emptyProject/$project_name/" config.xml

# replace old pathnames of emptyProject to $project_name

echo "Replacing emptyProject paths with $1"
cordova platform remove android
cordova platform add android
echo "Done"
