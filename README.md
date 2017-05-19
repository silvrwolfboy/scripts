scripts
---
Some Linux specific scripts that I use in Ubuntu/Debian and CentOS homelabs.

note
---
* cronjobs/ directory are for cron jobs scripts

* file with _nodeps in the name is a Perl script that doesn't requires user to install anything else  (besides Perl if not already installed) and can be executed like a shell script.

scripts description
---
* linux_packages.sh - install sysadmin package bundle for either debian or redhat family distro

* shellcheck_curl.sh - Check shellscript with shellcheck, without saving the script; Functioning like curl + bash syntax checker

* torcheck/torcheck.pl -  Check if user connected through tor layer network (for torsocks user)

* cronjobs/maintainance_update.sh - specific sysadmin's tools upgrade
