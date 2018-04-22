scripts
---
Some useful Linux system administration scripts.

note
---
* cronjobs/ directory are for cron jobs scripts.

scripts description
---
* linux_packages.sh - install sysadmin package bundle for either debian or redhat family distro

* shellcheck_curl.sh - Check shellscript with shellcheck_curl.sh
k, without saving the script; Functioning like curl + bash syntax checker

* torcheck.pl -  Check if user connected through tor layer network (for torsocks user)

* cronjobs/maintainance_update.sh - specific system sysadmin's tools upgrade

* centos6 - Scripts for centos6, to configure local cpanm and root httpd install

* readme_tpl.py - Python script to generate README.md and LICENSE (license) templates

* install_perl_ai_mxnet.sh - Bash script to install Perl's AI::MXNet from CPAN without manually dealing with its external dependencies

* install_liteide32.sh - Bash script to install LiteIDE 32 bit linux for golang into /usr/local/ (except for .desktop file which goes to $HOME specific dir)

* lxc/lxc_templates/lxc-ubuntu - Custom lxc container template for ubuntu. Installs base packages with LAMP tools exception to mysql-server due to security (you need to install it by yourself and insert your custom passwords and configs).

* laravel_deps.sh - Install required php (v7.+) extensions for laravel's 5.4+ web framework

* server_here.sh - python3 http.server wrapper

* stop_mysqld.sh - Stop if mysqld (daemon) is running.

* ext.sh - Gives extension of a file.

* chars.sh - Generate random strings.

* df_alert.pl - Alert user if /dev/sda1 storage size exceeds 60%.

* cap.pl - Append GPL3 license notice after "use strict"; pattern matched.

* ghb.pl - Backup all of my Github's public repositories to local computer.

* psgi_heroku.sh - Create Heroku's stack for Perl 5 + Plack web application hosting.

* install_rvm_ruby.sh - Install rvm, latest ruby and bunch of commonly used ruby on rails web development gems for Ubuntu distro with pre-setup.

* install_mono_stack.sh - Install mono runtime, Rosyln compiler, Monodevelop, local Mono's web server (if you want to use ASP.NET MVC without dealing with external server configs), GTK3.0 binding (no Glade 3 however) for C# (aka gtksharp3), and the actual free MonoDevelop C# IDE (v6.2.0).

* pytempl.sh - Simple script to build a template directory for Python 3 project built on top of readme_tpl.py

* olw.pl - Simple HTML template generator perl script for my 'old-school' personal site.
