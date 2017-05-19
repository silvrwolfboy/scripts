#!/bin/sh

# Check shellscript with shellcheck, without saving the script; Functioning like curl + bash syntax checker. 

 # Example usage: ./shellcheck_curl.sh https://gist.githubusercontent.com/faraco/bbfaf1a60528caa07abde974353a3b5a/raw/9db205420029c1145da94fe0c325c1bded42c71b/shellcheck_curl.sh

curl "$1" > tmpFile;

shellcheck tmpFile;

echo 
echo "[gitshellcheck.sh]"
if [ $? -eq 0 ];then
	echo
	echo "shellcheck:syntax checking pass. No error detected."
	echo
	rm tmpFile

else
	echo
	echo  "shellcheck: exiting with error."
	rm tmpFile
	echo
	exit 1

fi

exit 0
