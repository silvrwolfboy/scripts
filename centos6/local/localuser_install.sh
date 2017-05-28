#!/bin/bash

# install Perl's cpanm
wget -qO cpanm.pl http://cpanmin.us && perl cpanm.pl App::cpanminus
perl cpanm.pl --local-lib=~/perl5 local::lib && eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)

# remove this temporary file, we got user's global cpanm installed at this point
rm -f cpanm.pl

# make cpanm accessible from anywhere in the user session
echo 'export $PATH="$HOME/perl5/bin:$PATH"' >> $HOME/.bashrc

# make the change global right away
source $HOME/.bashrc

exit $?
